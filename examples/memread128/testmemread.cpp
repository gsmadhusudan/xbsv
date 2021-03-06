#include <stdio.h>
#include <sys/mman.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <monkit.h>
#include "StdDmaIndication.h"

#include "DmaDebugRequestProxy.h"
#include "MMUConfigRequestProxy.h"
#include "MemreadIndicationWrapper.h"
#include "MemreadRequestProxy.h"


sem_t test_sem;
int numWords = 16 << 18;
size_t test_sz  = numWords*sizeof(unsigned int);
size_t alloc_sz = test_sz;
int mismatchCount = 0;

void dump(const char *prefix, char *buf, size_t len)
{
    fprintf(stderr, "%s ", prefix);
    for (int i = 0; i < (len > 16 ? 16 : len) ; i++)
	fprintf(stderr, "%02x", (unsigned char)buf[i]);
    fprintf(stderr, "\n");
}

class MemreadIndication : public MemreadIndicationWrapper
{
public:
  unsigned int rDataCnt;
  virtual void readDone(uint32_t v){
    fprintf(stderr, "Memread::readDone mismatch=%x\n", v);
    mismatchCount += v;
    sem_post(&test_sem);
  }
  virtual void started(uint32_t words){
    fprintf(stderr, "Memread::started: words=%x\n", words);
  }
  virtual void reportStateDbg(uint32_t streamRdCnt, uint32_t dataMismatch){
    fprintf(stderr, "Memread::reportStateDbg: streamRdCnt=%08x dataMismatch=%d\n", streamRdCnt, dataMismatch);
  }  
  MemreadIndication(int id) : MemreadIndicationWrapper(id){}
};

int main(int argc, const char **argv)
{
  int srcAlloc;
  unsigned int *srcBuffer = 0;

  MemreadRequestProxy *device = 0;
  MemreadIndication *deviceIndication = 0;

  fprintf(stderr, "Main::%s %s\n", __DATE__, __TIME__);

  device = new MemreadRequestProxy(IfcNames_MemreadRequest);
  DmaDebugRequestProxy *hostDmaDebugRequest = new DmaDebugRequestProxy(IfcNames_HostDmaDebugRequest);
  MMUConfigRequestProxy *dmap = new MMUConfigRequestProxy(IfcNames_HostMMUConfigRequest);
  DmaManager *dma = new DmaManager(hostDmaDebugRequest, dmap);
  DmaDebugIndication *hostDmaDebugIndication = new DmaDebugIndication(dma, IfcNames_HostDmaDebugIndication);
  MMUConfigIndication *hostMMUConfigIndication = new MMUConfigIndication(dma, IfcNames_HostMMUConfigIndication);


  deviceIndication = new MemreadIndication(IfcNames_MemreadIndication);

  fprintf(stderr, "Main::allocating memory...\n");
  srcAlloc = portalAlloc(alloc_sz);
  srcBuffer = (unsigned int *)portalMmap(srcAlloc, alloc_sz);

  portalExec_start();

  for (int i = 0; i < numWords; i++){
    srcBuffer[i] = i;
  }
    
  portalDCacheFlushInval(srcAlloc, alloc_sz, srcBuffer);
  fprintf(stderr, "Main::flush and invalidate complete\n");

  unsigned int ref_srcAlloc = dma->reference(srcAlloc);
  fprintf(stderr, "ref_srcAlloc=%d\n", ref_srcAlloc);

  fprintf(stderr, "Main::starting read %08x\n", numWords);
  portalTimerStart(0);
  int burstLen = 16;
#ifndef BSIM
  int iterCnt = 64;
#else
  int iterCnt = 2;
#endif
  device->startRead(ref_srcAlloc, numWords, burstLen, iterCnt);
  sem_wait(&test_sem);
  uint64_t cycles = portalTimerLap(0);
  uint64_t beats = dma->show_mem_stats(ChannelType_Read);
  float read_util = (float)beats/(float)cycles;
  fprintf(stderr, "memory read utilization (beats/cycle): %f\n", read_util);

  MonkitFile("perf.monkit")
    .setHwCycles(cycles)
    .setReadBwUtil(read_util)
    .writeFile();

  exit(mismatchCount ? 1 : 0);
}
