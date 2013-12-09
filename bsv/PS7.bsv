
// Copyright (c) 2013 Quanta Research Cambridge, Inc.

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Clocks       :: *;
import DefaultValue :: *;
import XilinxCells  :: *;
import Vector       :: *;

(* always_ready, always_enabled *)
interface AxiREQ#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    Bit#(32)             ADDR;
    Bit#(2)              BURST;
    Bit#(4)              CACHE;
    Bit#(C_ID_WIDTH)     ID;
    Bit#(4)              LEN;
    Bit#(2)              LOCK;
    Bit#(3)              PROT;
    Bit#(4)              QOS;
    Bit#(3)              SIZE;
    Bit#(1)              VALID;
endinterface
interface AxiMOSI#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    AxiREQ               AR;
    AxiREQ               AW;
    Bit#(1)              BREADY;
    Bit#(1)              RREADY;
    Bit#(C_DATA_WIDTH)   WDATA;
    Bit#(C_ID_WIDTH)     WID;
    Bit#(1)              WLAST;
    Bit#(C_DATA_WIDTH/8) WSTRB;
    Bit#(1)              WVALID;
endinterface
interface AxiVALID#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    Bit#(C_ID_WIDTH)     ID;
    Bit#(2)              RESP;
    Bit#(1)              VALID;
endinterface
interface AxiMISO(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    Bit#(1)              ARREADY;
    Bit#(1)              AWREADY;
    AxiVALID#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH) B;
    AxiVALID#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH) R;
    Bit#(C_DATA_WIDTH)   RDATA;
    Bit#(1)              RLAST;
    Bit#(1)              WREADY;
endinterface
interface AxiMasterCommon#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    method Action ACLK(Bit#(1) v); // common
    method Bit#(1) ARESETN();      // common
    AxiMOSI#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    AxiMISO#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    method Action ARADDR(Bit#(32) v);
    method Bit#(1) ARREADY();
endinterface

interface AxiMasterHighSpeed#(numeric type C_DATA_WIDTH, numeric type C_ID_WIDTH);
    interface AxiCommon#(C_DATA_WIDTH, C_ID_WIDTH) axi;
    method Bit#(3) RACOUNT();
    method Bit#(8) RCOUNT();
    method Action RDISSUECAP1_EN(Bit#(1) v);
    method Bit#(6) WACOUNT();
    method Bit#(8) WCOUNT();
    method Action WRISSUECAP1_EN(Bit#(1) v);
endinterface
interface Ddr;
    method Bit#(15) DDR_Addr();
    method Bit#(3) DDR_BankAddr();
    method Bit#(1) DDR_CAS_n();
    method Bit#(1) DDR_CKE();
    method Bit#(1) DDR_CS_n();
    method Bit#(1) DDR_Clk();
    method Bit#(1) DDR_Clk_n();
    method Bit#(C_DM_WIDTH) DDR_DM();
    method Bit#(C_DQ_WIDTH) DDR_DQ();
    method Bit#(C_DQS_WIDTH) DDR_DQS();
    method Bit#(C_DQS_WIDTH) DDR_DQS_n();
    method Bit#(1) DDR_DRSTB();
    method Bit#(1) DDR_ODT();
    method Bit#(1) DDR_RAS_n();
    method Bit#(1) DDR_VRN();
    method Bit#(1) DDR_VRP();
    method Bit#(1) DDR_WEB();
endinterface
interface Dma;
    method Action DMA0_ACLK(Bit#(1) v);
    method Action DMA0_DAREADY(Bit#(1) v);
    method Bit#(2) DMA0_DATYPE();
    method Bit#(1) DMA0_DAVALID();
    method Action DMA0_DRLAST(Bit#(1) v);
    method Bit#(1) DMA0_DRREADY();
    method Action DMA0_DRTYPE(Bit#(2) v);
    method Action DMA0_DRVALID(Bit#(1) v);
    method Bit#(1) DMA0_RSTN();
endinterface
interface Enet;
    method Action ENET0_EXT_INTIN(Bit#(1) v);
    method Action ENET0_GMII_COL(Bit#(1) v);
    method Action ENET0_GMII_CRS(Bit#(1) v);
    method Action ENET0_GMII_RXD(Bit#(8) v);
    method Action ENET0_GMII_RX_CLK(Bit#(1) v);
    method Action ENET0_GMII_RX_DV(Bit#(1) v);
    method Action ENET0_GMII_RX_ER(Bit#(1) v);
    method Bit#(8) ENET0_GMII_TXD();
    method Action ENET0_GMII_TX_CLK(Bit#(1) v);
    method Bit#(1) ENET0_GMII_TX_EN();
    method Bit#(1) ENET0_GMII_TX_ER();
    method Action ENET0_MDIO_I(Bit#(1) v);
    method Bit#(1) ENET0_MDIO_MDC();
    method Bit#(1) ENET0_MDIO_O();
    method Bit#(1) ENET0_MDIO_T();
    method Bit#(1) ENET0_PTP_DELAY_REQ_RX();
    method Bit#(1) ENET0_PTP_DELAY_REQ_TX();
    method Bit#(1) ENET0_PTP_PDELAY_REQ_RX();
    method Bit#(1) ENET0_PTP_PDELAY_REQ_TX();
    method Bit#(1) ENET0_PTP_PDELAY_RESP_RX();
    method Bit#(1) ENET0_PTP_PDELAY_RESP_TX();
    method Bit#(1) ENET0_PTP_SYNC_FRAME_RX();
    method Bit#(1) ENET0_PTP_SYNC_FRAME_TX();
    method Bit#(1) ENET0_SOF_RX();
    method Bit#(1) ENET0_SOF_TX();
endinterface
interface Sdio;
    method Bit#(1) SDIO0_BUSPOW();
    method Bit#(3) SDIO0_BUSVOLT();
    method Action SDIO0_CDN(Bit#(1) v);
    method Bit#(1) SDIO0_CLK();
    method Action SDIO0_CLK_FB(Bit#(1) v);
    method Action SDIO0_CMD_I(Bit#(1) v);
    method Bit#(1) SDIO0_CMD_O();
    method Bit#(1) SDIO0_CMD_T();
    method Action SDIO0_DATA_I(Bit#(4) v);
    method Bit#(4) SDIO0_DATA_O();
    method Bit#(4) SDIO0_DATA_T();
    method Bit#(1) SDIO0_LED();
    method Action SDIO0_WP(Bit#(1) v);
endinterface
interface Spi;
    method Action SPI0_MISO_I(Bit#(1) v);
    method Bit#(1) SPI0_MISO_O();
    method Bit#(1) SPI0_MISO_T();
    method Action SPI0_MOSI_I(Bit#(1) v);
    method Bit#(1) SPI0_MOSI_O();
    method Bit#(1) SPI0_MOSI_T();
    method Action SPI0_SCLK_I(Bit#(1) v);
    method Bit#(1) SPI0_SCLK_O();
    method Bit#(1) SPI0_SCLK_T();
    method Bit#(1) SPI0_SS1_O();
    method Bit#(1) SPI0_SS2_O();
    method Action SPI0_SS_I(Bit#(1) v);
    method Bit#(1) SPI0_SS_O();
    method Bit#(1) SPI0_SS_T();
endinterface
interface Ttc;
    method Action TTC0_CLK0_IN(Bit#(1) v);
    method Action TTC0_CLK1_IN(Bit#(1) v);
    method Action TTC0_CLK2_IN(Bit#(1) v);
    method Bit#(1) TTC0_WAVE0_OUT();
    method Bit#(1) TTC0_WAVE1_OUT();
    method Bit#(1) TTC0_WAVE2_OUT();
endinterface
interface Uart;
    method Action UART0_CTSN(Bit#(1) v);
    method Action UART0_DCDN(Bit#(1) v);
    method Action UART0_DSRN(Bit#(1) v);
    method Bit#(1) UART0_DTRN();
    method Action UART0_RIN(Bit#(1) v);
    method Bit#(1) UART0_RTSN();
    method Action UART0_RX(Bit#(1) v);
    method Bit#(1) UART0_TX();
endinterface
interface Usb;
    method Bit#(2) USB0_PORT_INDCTL();
    method Action USB0_VBUS_PWRFAULT(Bit#(1) v);
    method Bit#(1) USB0_VBUS_PWRSELECT();
endinterface
interface I2c;
    method Action I2C0_SCL_I(Bit#(1) v);
    method Bit#(1) I2C0_SCL_O();
    method Bit#(1) I2C0_SCL_T();
    method Action I2C0_SDA_I(Bit#(1) v);
    method Bit#(1) I2C0_SDA_O();
    method Bit#(1) I2C0_SDA_T();
endinterface

interface Ps7#(numeric type C_EMIO_GPIO_WIDTH);
    method Action CAN0_PHY_RX(Bit#(1) v);
    method Bit#(1) CAN0_PHY_TX();
    method Action CAN1_PHY_RX(Bit#(1) v);
    method Bit#(1) CAN1_PHY_TX();
    method Action Core0_nFIQ(Bit#(1) v);
    method Action Core0_nIRQ(Bit#(1) v);
    method Action Core1_nFIQ(Bit#(1) v);
    method Action Core1_nIRQ(Bit#(1) v);
    method Action DDR_ARB(Bit#(4) v);
    interface Ddr DDR;
    interface Dma DMA0;
    interface Dma DMA1;
    interface Dma DMA2;
    interface Dma DMA3;
    interface Enet ENET0;
    interface Enet ENET1;
    method Action EVENT_EVENTI(Bit#(1) v);
    method Bit#(1) EVENT_EVENTO();
    method Bit#(2) EVENT_STANDBYWFE();
    method Bit#(2) EVENT_STANDBYWFI();
    method Bit#(1) FCLK_CLK0();
    method Bit#(1) FCLK_CLK1();
    method Bit#(1) FCLK_CLK2();
    method Bit#(1) FCLK_CLK3();
    method Action FCLK_CLKTRIG0_N(Bit#(1) v);
    method Action FCLK_CLKTRIG1_N(Bit#(1) v);
    method Action FCLK_CLKTRIG2_N(Bit#(1) v);
    method Action FCLK_CLKTRIG3_N(Bit#(1) v);
    method Bit#(1) FCLK_RESET0_N();
    method Bit#(1) FCLK_RESET1_N();
    method Bit#(1) FCLK_RESET2_N();
    method Bit#(1) FCLK_RESET3_N();
    method Action FPGA_IDLE_N(Bit#(1) v);
    method Action FTMD_TRACEIN_ATID(Bit#(4) v);
    method Action FTMD_TRACEIN_CLK(Bit#(1) v);
    method Action FTMD_TRACEIN_DATA(Bit#(32) v);
    method Action FTMD_TRACEIN_VALID(Bit#(1) v);
    method Action FTMT_F2P_DEBUG(Bit#(32) v);
    method Action FTMT_F2P_TRIG(Bit#(4) v);
    method Bit#(4) FTMT_F2P_TRIGACK();
    method Bit#(32) FTMT_P2F_DEBUG();
    method Bit#(4) FTMT_P2F_TRIG();
    method Action FTMT_P2F_TRIGACK(Bit#(4) v);
    method Action GPIO_I(Bit#(C_EMIO_GPIO_WIDTH) v);
    method Bit#(C_EMIO_GPIO_WIDTH) GPIO_O();
    method Bit#(C_EMIO_GPIO_WIDTH) GPIO_T();
    interface I2c I2C0;
    interface I2c I2C1;
    method Action IRQ_F2P(Bit#(16) v);
    method Bit#(1) IRQ_P2F_CAN0();
    method Bit#(1) IRQ_P2F_CAN1();
    method Bit#(1) IRQ_P2F_CTI();
    method Bit#(1) IRQ_P2F_DMAC0();
    method Bit#(1) IRQ_P2F_DMAC1();
    method Bit#(1) IRQ_P2F_DMAC2();
    method Bit#(1) IRQ_P2F_DMAC3();
    method Bit#(1) IRQ_P2F_DMAC4();
    method Bit#(1) IRQ_P2F_DMAC5();
    method Bit#(1) IRQ_P2F_DMAC6();
    method Bit#(1) IRQ_P2F_DMAC7();
    method Bit#(1) IRQ_P2F_DMAC_ABORT();
    method Bit#(1) IRQ_P2F_ENET0();
    method Bit#(1) IRQ_P2F_ENET1();
    method Bit#(1) IRQ_P2F_ENET_WAKE0();
    method Bit#(1) IRQ_P2F_ENET_WAKE1();
    method Bit#(1) IRQ_P2F_GPIO();
    method Bit#(1) IRQ_P2F_I2C0();
    method Bit#(1) IRQ_P2F_I2C1();
    method Bit#(1) IRQ_P2F_QSPI();
    method Bit#(1) IRQ_P2F_SDIO0();
    method Bit#(1) IRQ_P2F_SDIO1();
    method Bit#(1) IRQ_P2F_SMC();
    method Bit#(1) IRQ_P2F_SPI0();
    method Bit#(1) IRQ_P2F_SPI1();
    method Bit#(1) IRQ_P2F_UART0();
    method Bit#(1) IRQ_P2F_UART1();
    method Bit#(1) IRQ_P2F_USB0();
    method Bit#(1) IRQ_P2F_USB1();
    method Bit#(C_MIO_PRIMITIVE) MIO();
    interface AxiSlaveCommon#(1) s_axi_acp;
>     method Action ARUSER(Bit#(5) v);
>     method Action AWUSER(Bit#(5) v);
    interface AxiSlaveCommon#(1) s_axi_gp0;
    interface AxiSlaveCommon#(1) s_axi_gp1;
    interface AxiSlaveHighSpeed#(1) s_axi_hp0;
    interface AxiSlaveHighSpeed#(1) s_axi_hp1;
    interface AxiSlaveHighSpeed#(1) s_axi_hp2;
    interface AxiSlaveHighSpeed#(1) s_axi_hp3;
    interface AxiMasterCommon#(1) m_axi_gp0;
    interface AxiMasterCommon#(1) m_axi_gp1;
    method Action PJTAG_TCK(Bit#(1) v);
    method Action PJTAG_TD_I(Bit#(1) v);
    method Bit#(1) PJTAG_TD_O();
    method Bit#(1) PJTAG_TD_T();
    method Action PJTAG_TMS(Bit#(1) v);
    method Action PS_CLK(Bit#(1) v);
    method Action PS_PORB(Bit#(1) v);
    method Action PS_SRSTB(Bit#(1) v);
    interface Sdio SDIO0;
    interface Sdio SDIO1;
    interface Spi SPI0;
    interface Spi SPI1;
    method Action SRAM_INTIN(Bit#(1) v);
    method Action TRACE_CLK(Bit#(1) v);
    method Bit#(1) TRACE_CTL();
    method Bit#(32) TRACE_DATA();
    interface Ttc TTC0;
    interface Ttc TTC1;
    interface Uart UART0;
    interface Uart UART1;
    interface Usb USB0;
    interface Usb USB1;
    method Action WDT_CLK_IN(Bit#(1) v);
    method Bit#(1) WDT_RST_OUT();

   schedule (datain, idatain, inc, ce) CF (datain, idatain, inc, ce);
endmodule
