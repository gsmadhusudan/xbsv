VERSION=140520.1

# On Centos: sudo yum install kernel-headers

obj-m += pcieportal.o

KVERSION=$(shell uname -r)
export KROOT=/lib/modules/$(KVERSION)/build
export BS_MOD_DIR=$(DESTDIR)/lib/modules/$(KVERSION)/bluespec

.PHONY: default
default: pcieportal.ko ../portalmem/portalmem.ko

EXTRA_CFLAGS = -I$(PWD) -I$(PWD)/../../cpp -I$(PWD)/../portalmem -I$(PWD)/../../generated/cpp
cflags-y += -I$(PWD)

../portalmem/portalmem.ko: ../portalmem/portalmem.c
	cd ../portalmem; make -f Makefile.x86

pcieportal.ko: pcieportal.c pcieportal.h
	@$(MAKE) -C $(KROOT) M=$(PWD) modules

.PHONY: modules_check
modules_check:
	@$(MAKE) -C $(KROOT) C=2 M=$(PWD) modules

.PHONY: install
install: pcieportal.ko
	install -d -m755 $(BS_MOD_DIR)
	install -m644 pcieportal.ko $(BS_MOD_DIR)
	install -m644 ../portalmem/portalmem.ko $(BS_MOD_DIR)
	depmod

.PHONY: uninstall
uninstall:
	rm -f $(BS_MOD_DIR)/pcieportal.ko
	rmdir --ignore-fail-on-non-empty $(BS_MOD_DIR)
	depmod

.PHONY: clean
clean:
	rm -rf *.ko *.o *.mod.*
	rm -rf Module.symvers Module.markers modules.order
	cd ../portalmem; make -f Makefile.x86 clean

.PHONY: rmmod
rmmod:
	rmmod portalmem || true
	rmmod pcieportal || true

.PHONY: insmod
insmod: rmmod
	insmod pcieportal.ko
	-chmod agu+rw /dev/fpga*
	insmod ../portalmem/portalmem.ko
	chmod agu+rw /dev/portalmem

.PHONY: install-dkms
install-dkms:
	mkdir -p /usr/src/pcieportal-$(VERSION)
	cp -fv pcieportal.c pcieportal.h dkms.conf /usr/src/pcieportal-$(VERSION)
	cp -fv ../portalmem/portalmem.h ../portalmem/portalmem.c /usr/src/pcieportal-$(VERSION)
	cp -fv Makefile.dkms /usr/src/pcieportal-$(VERSION)/Makefile
