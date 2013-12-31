
/*
   ../scripts/importbvi.py
   -p
   c_emio_gpio_width:gpio_width
   -p
   c_m_axi_gp0_thread_id_width:id_width
   -p
   c_m_axi_gp1_thread_id_width:id_width
   -p
   c_s_axi_gp0_id_width:id_width
   -p
   c_s_axi_gp1_id_width:id_width
   -p
   c_s_axi_acp_id_width:id_width
   -p
   c_s_axi_hp0_id_width:id_width
   -p
   c_s_axi_hp0_data_width:data_width
   -p
   c_s_axi_hp1_id_width:id_width
   -p
   c_s_axi_hp1_data_width:data_width
   -p
   c_s_axi_hp2_id_width:id_width
   -p
   c_s_axi_hp2_data_width:data_width
   -p
   c_s_axi_hp3_id_width:id_width
   -p
   c_s_axi_hp3_data_width:data_width
   -p
   c_mio_primitive:mio_width
   -p
   c_dm_width
   -p
   c_dq_width
   -p
   c_dqs_width
   -c
   M_AXI_GP0_ACLK
   -c
   FCLK_CLK0
   ../../import_components/Xilinx/Vivado/2013.2/data/ip/xilinx/processing_system7_v5_01/hdl/verilog/processing_system7.v
*/

import Clocks::*;
import DefaultValue::*;
import XilinxCells::*;
import GetPut::*;

(* always_ready, always_enabled *)
interface Pps7Can#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      phy_rx(Bit#(1) v);
    method Bit#(1)     phy_tx();
endinterface
(* always_ready, always_enabled *)
interface Pps7Core#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      nfiq(Bit#(1) v);
    method Action      nirq(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Ddr#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      arb(Bit#(4) v);
    interface Inout#(Bit#(15))     addr;
    interface Inout#(Bit#(3))     bankaddr;
    interface Inout#(Bit#(1))     cas_n;
    interface Inout#(Bit#(1))     cke;
    interface Inout#(Bit#(1))     cs_n;
    interface Inout#(Bit#(1))     clk;
    interface Inout#(Bit#(1))     clk_n;
    interface Inout#(Bit#(c_dm_width))     dm;
    interface Inout#(Bit#(c_dq_width))     dq;
    interface Inout#(Bit#(c_dqs_width))     dqs;
    interface Inout#(Bit#(c_dqs_width))     dqs_n;
    interface Inout#(Bit#(1))     drstb;
    interface Inout#(Bit#(1))     odt;
    interface Inout#(Bit#(1))     ras_n;
    interface Inout#(Bit#(1))     vrn;
    interface Inout#(Bit#(1))     vrp;
    interface Inout#(Bit#(1))     web;
endinterface
(* always_ready, always_enabled *)
interface Pps7Dma#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      aclk(Bit#(1) v);
    method Action      daready(Bit#(1) v);
    method Bit#(2)     datype();
    method Bit#(1)     davalid();
    method Action      drlast(Bit#(1) v);
    method Bit#(1)     drready();
    method Action      drtype(Bit#(2) v);
    method Action      drvalid(Bit#(1) v);
    method Bit#(1)     rstn();
endinterface
(* always_ready, always_enabled *)
interface Pps7Enet#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      ext_intin(Bit#(1) v);
    method Action      gmii_col(Bit#(1) v);
    method Action      gmii_crs(Bit#(1) v);
    method Action      gmii_rxd(Bit#(8) v);
    method Action      gmii_rx_clk(Bit#(1) v);
    method Action      gmii_rx_dv(Bit#(1) v);
    method Action      gmii_rx_er(Bit#(1) v);
    method Bit#(8)     gmii_txd();
    method Action      gmii_tx_clk(Bit#(1) v);
    method Bit#(1)     gmii_tx_en();
    method Bit#(1)     gmii_tx_er();
    method Action      mdio_i(Bit#(1) v);
    method Bit#(1)     mdio_mdc();
    method Bit#(1)     mdio_o();
    method Bit#(1)     mdio_t();
    method Bit#(1)     ptp_delay_req_rx();
    method Bit#(1)     ptp_delay_req_tx();
    method Bit#(1)     ptp_pdelay_req_rx();
    method Bit#(1)     ptp_pdelay_req_tx();
    method Bit#(1)     ptp_pdelay_resp_rx();
    method Bit#(1)     ptp_pdelay_resp_tx();
    method Bit#(1)     ptp_sync_frame_rx();
    method Bit#(1)     ptp_sync_frame_tx();
    method Bit#(1)     sof_rx();
    method Bit#(1)     sof_tx();
endinterface
(* always_ready, always_enabled *)
interface Pps7Event#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      eventi(Bit#(1) v);
    method Bit#(1)     evento();
    method Bit#(2)     standbywfe();
    method Bit#(2)     standbywfi();
endinterface
(* always_ready, always_enabled *)
interface Pps7Fclk#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Clock     clk0();
    method Bit#(1)     clk1();
    method Bit#(1)     clk2();
    method Bit#(1)     clk3();
endinterface
(* always_ready, always_enabled *)
interface Pps7Fclk_clktrig#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      n(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Fclk_reset#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Bit#(1)     n();
endinterface
(* always_ready, always_enabled *)
interface Pps7Fpga#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      idle_n(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Ftmd#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      tracein_atid(Bit#(4) v);
    method Action      tracein_clk(Bit#(1) v);
    method Action      tracein_data(Bit#(32) v);
    method Action      tracein_valid(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Ftmt#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      f2p_debug(Bit#(32) v);
    method Action      f2p_trig(Bit#(4) v);
    method Bit#(4)     f2p_trigack();
    method Bit#(32)     p2f_debug();
    method Bit#(4)     p2f_trig();
    method Action      p2f_trigack(Bit#(4) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Gpio#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      i(Bit#(gpio_width) v);
    method Bit#(gpio_width)     o();
    method Bit#(gpio_width)     t();
endinterface
(* always_ready, always_enabled *)
interface Pps7I2c#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      scl_i(Bit#(1) v);
    method Bit#(1)     scl_o();
    method Bit#(1)     scl_t();
    method Action      sda_i(Bit#(1) v);
    method Bit#(1)     sda_o();
    method Bit#(1)     sda_t();
endinterface
(* always_ready, always_enabled *)
interface Pps7Irq#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      f2p(Bit#(16) v);
    method Bit#(1)     p2f_can0();
    method Bit#(1)     p2f_can1();
    method Bit#(1)     p2f_cti();
    method Bit#(1)     p2f_dmac0();
    method Bit#(1)     p2f_dmac1();
    method Bit#(1)     p2f_dmac2();
    method Bit#(1)     p2f_dmac3();
    method Bit#(1)     p2f_dmac4();
    method Bit#(1)     p2f_dmac5();
    method Bit#(1)     p2f_dmac6();
    method Bit#(1)     p2f_dmac7();
    method Bit#(1)     p2f_dmac_abort();
    method Bit#(1)     p2f_enet0();
    method Bit#(1)     p2f_enet1();
    method Bit#(1)     p2f_enet_wake0();
    method Bit#(1)     p2f_enet_wake1();
    method Bit#(1)     p2f_gpio();
    method Bit#(1)     p2f_i2c0();
    method Bit#(1)     p2f_i2c1();
    method Bit#(1)     p2f_qspi();
    method Bit#(1)     p2f_sdio0();
    method Bit#(1)     p2f_sdio1();
    method Bit#(1)     p2f_smc();
    method Bit#(1)     p2f_spi0();
    method Bit#(1)     p2f_spi1();
    method Bit#(1)     p2f_uart0();
    method Bit#(1)     p2f_uart1();
    method Bit#(1)     p2f_usb0();
    method Bit#(1)     p2f_usb1();
endinterface
(* always_ready, always_enabled *)
interface Pps7M_axi_gp#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Bit#(32)     araddr();
    method Bit#(2)     arburst();
    method Bit#(4)     arcache();
    method Bit#(1)     aresetn();
    method Bit#(id_width)     arid();
    method Bit#(4)     arlen();
    method Bit#(2)     arlock();
    method Bit#(3)     arprot();
    method Bit#(4)     arqos();
    method Action      arready(Bit#(1) v);
    method Bit#(3)     arsize();
    method Bit#(1)     arvalid();
    method Bit#(32)     awaddr();
    method Bit#(2)     awburst();
    method Bit#(4)     awcache();
    method Bit#(id_width)     awid();
    method Bit#(4)     awlen();
    method Bit#(2)     awlock();
    method Bit#(3)     awprot();
    method Bit#(4)     awqos();
    method Action      awready(Bit#(1) v);
    method Bit#(3)     awsize();
    method Bit#(1)     awvalid();
    method Action      bid(Bit#(id_width) v);
    method Bit#(1)     bready();
    method Action      bresp(Bit#(2) v);
    method Action      bvalid(Bit#(1) v);
    method Action      rdata(Bit#(32) v);
    method Action      rid(Bit#(id_width) v);
    method Action      rlast(Bit#(1) v);
    method Bit#(1)     rready();
    method Action      rresp(Bit#(2) v);
    method Action      rvalid(Bit#(1) v);
    method Bit#(32)     wdata();
    method Bit#(id_width)     wid();
    method Bit#(1)     wlast();
    method Action      wready(Bit#(1) v);
    method Bit#(4)     wstrb();
    method Bit#(1)     wvalid();
endinterface
(* always_ready, always_enabled *)
interface Pps7Pjtag#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      tck(Bit#(1) v);
    method Action      td_i(Bit#(1) v);
    method Bit#(1)     td_o();
    method Bit#(1)     td_t();
    method Action      tms(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Ps#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    interface Inout#(Bit#(1))     clk;
    interface Inout#(Bit#(1))     porb;
    interface Inout#(Bit#(1))     srstb;
endinterface
(* always_ready, always_enabled *)
interface Pps7S_axi_acp#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      aclk(Bit#(1) v);
    method Action      araddr(Bit#(32) v);
    method Action      arburst(Bit#(2) v);
    method Action      arcache(Bit#(4) v);
    method Bit#(1)     aresetn();
    method Action      arid(Bit#(id_width) v);
    method Action      arlen(Bit#(4) v);
    method Action      arlock(Bit#(2) v);
    method Action      arprot(Bit#(3) v);
    method Action      arqos(Bit#(4) v);
    method Bit#(1)     arready();
    method Action      arsize(Bit#(3) v);
    method Action      aruser(Bit#(5) v);
    method Action      arvalid(Bit#(1) v);
    method Action      awaddr(Bit#(32) v);
    method Action      awburst(Bit#(2) v);
    method Action      awcache(Bit#(4) v);
    method Action      awid(Bit#(id_width) v);
    method Action      awlen(Bit#(4) v);
    method Action      awlock(Bit#(2) v);
    method Action      awprot(Bit#(3) v);
    method Action      awqos(Bit#(4) v);
    method Bit#(1)     awready();
    method Action      awsize(Bit#(3) v);
    method Action      awuser(Bit#(5) v);
    method Action      awvalid(Bit#(1) v);
    method Bit#(id_width)     bid();
    method Action      bready(Bit#(1) v);
    method Bit#(2)     bresp();
    method Bit#(1)     bvalid();
    method Bit#(64)     rdata();
    method Bit#(id_width)     rid();
    method Bit#(1)     rlast();
    method Action      rready(Bit#(1) v);
    method Bit#(2)     rresp();
    method Bit#(1)     rvalid();
    method Action      wdata(Bit#(64) v);
    method Action      wid(Bit#(id_width) v);
    method Action      wlast(Bit#(1) v);
    method Bit#(1)     wready();
    method Action      wstrb(Bit#(8) v);
    method Action      wvalid(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7S_axi_gp#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      aclk(Bit#(1) v);
    method Action      araddr(Bit#(32) v);
    method Action      arburst(Bit#(2) v);
    method Action      arcache(Bit#(4) v);
    method Bit#(1)     aresetn();
    method Action      arid(Bit#(id_width) v);
    method Action      arlen(Bit#(4) v);
    method Action      arlock(Bit#(2) v);
    method Action      arprot(Bit#(3) v);
    method Action      arqos(Bit#(4) v);
    method Bit#(1)     arready();
    method Action      arsize(Bit#(3) v);
    method Action      arvalid(Bit#(1) v);
    method Action      awaddr(Bit#(32) v);
    method Action      awburst(Bit#(2) v);
    method Action      awcache(Bit#(4) v);
    method Action      awid(Bit#(id_width) v);
    method Action      awlen(Bit#(4) v);
    method Action      awlock(Bit#(2) v);
    method Action      awprot(Bit#(3) v);
    method Action      awqos(Bit#(4) v);
    method Bit#(1)     awready();
    method Action      awsize(Bit#(3) v);
    method Action      awvalid(Bit#(1) v);
    method Bit#(id_width)     bid();
    method Action      bready(Bit#(1) v);
    method Bit#(2)     bresp();
    method Bit#(1)     bvalid();
    method Bit#(32)     rdata();
    method Bit#(id_width)     rid();
    method Bit#(1)     rlast();
    method Action      rready(Bit#(1) v);
    method Bit#(2)     rresp();
    method Bit#(1)     rvalid();
    method Action      wdata(Bit#(32) v);
    method Action      wid(Bit#(id_width) v);
    method Action      wlast(Bit#(1) v);
    method Bit#(1)     wready();
    method Action      wstrb(Bit#(4) v);
    method Action      wvalid(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7S_axi_hp#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      aclk(Bit#(1) v);
    method Action      araddr(Bit#(32) v);
    method Action      arburst(Bit#(2) v);
    method Action      arcache(Bit#(4) v);
    method Bit#(1)     aresetn();
    method Action      arid(Bit#(id_width) v);
    method Action      arlen(Bit#(4) v);
    method Action      arlock(Bit#(2) v);
    method Action      arprot(Bit#(3) v);
    method Action      arqos(Bit#(4) v);
    method Bit#(1)     arready();
    method Action      arsize(Bit#(3) v);
    method Action      arvalid(Bit#(1) v);
    method Action      awaddr(Bit#(32) v);
    method Action      awburst(Bit#(2) v);
    method Action      awcache(Bit#(4) v);
    method Action      awid(Bit#(id_width) v);
    method Action      awlen(Bit#(4) v);
    method Action      awlock(Bit#(2) v);
    method Action      awprot(Bit#(3) v);
    method Action      awqos(Bit#(4) v);
    method Bit#(1)     awready();
    method Action      awsize(Bit#(3) v);
    method Action      awvalid(Bit#(1) v);
    method Bit#(id_width)     bid();
    method Action      bready(Bit#(1) v);
    method Bit#(2)     bresp();
    method Bit#(1)     bvalid();
    method Bit#(3)     racount();
    method Bit#(8)     rcount();
    method Bit#(data_width)     rdata();
    method Action      rdissuecap1_en(Bit#(1) v);
    method Bit#(id_width)     rid();
    method Bit#(1)     rlast();
    method Action      rready(Bit#(1) v);
    method Bit#(2)     rresp();
    method Bit#(1)     rvalid();
    method Bit#(6)     wacount();
    method Bit#(8)     wcount();
    method Action      wdata(Bit#(data_width) v);
    method Action      wid(Bit#(id_width) v);
    method Action      wlast(Bit#(1) v);
    method Bit#(1)     wready();
    method Action      wrissuecap1_en(Bit#(1) v);
    method Action      wstrb(Bit#(TDiv#(data_width,8)) v);
    method Action      wvalid(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Sdio#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Bit#(1)     buspow();
    method Bit#(3)     busvolt();
    method Action      cdn(Bit#(1) v);
    method Bit#(1)     clk();
    method Action      clk_fb(Bit#(1) v);
    method Action      cmd_i(Bit#(1) v);
    method Bit#(1)     cmd_o();
    method Bit#(1)     cmd_t();
    method Action      data_i(Bit#(4) v);
    method Bit#(4)     data_o();
    method Bit#(4)     data_t();
    method Bit#(1)     led();
    method Action      wp(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Spi#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      miso_i(Bit#(1) v);
    method Bit#(1)     miso_o();
    method Bit#(1)     miso_t();
    method Action      mosi_i(Bit#(1) v);
    method Bit#(1)     mosi_o();
    method Bit#(1)     mosi_t();
    method Action      sclk_i(Bit#(1) v);
    method Bit#(1)     sclk_o();
    method Bit#(1)     sclk_t();
    method Bit#(1)     ss1_o();
    method Bit#(1)     ss2_o();
    method Action      ss_i(Bit#(1) v);
    method Bit#(1)     ss_o();
    method Bit#(1)     ss_t();
endinterface
(* always_ready, always_enabled *)
interface Pps7Sram#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      intin(Bit#(1) v);
endinterface
(* always_ready, always_enabled *)
interface Pps7Trace#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      clk(Bit#(1) v);
    method Bit#(1)     ctl();
    method Bit#(32)     data();
endinterface
(* always_ready, always_enabled *)
interface Pps7Ttc#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      clk0_in(Bit#(1) v);
    method Action      clk1_in(Bit#(1) v);
    method Action      clk2_in(Bit#(1) v);
    method Bit#(1)     wave0_out();
    method Bit#(1)     wave1_out();
    method Bit#(1)     wave2_out();
endinterface
(* always_ready, always_enabled *)
interface Pps7Uart#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      ctsn(Bit#(1) v);
    method Action      dcdn(Bit#(1) v);
    method Action      dsrn(Bit#(1) v);
    method Bit#(1)     dtrn();
    method Action      rin(Bit#(1) v);
    method Bit#(1)     rtsn();
    method Action      rx(Bit#(1) v);
    method Bit#(1)     tx();
endinterface
(* always_ready, always_enabled *)
interface Pps7Usb#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Bit#(2)     port_indctl();
    method Action      vbus_pwrfault(Bit#(1) v);
    method Bit#(1)     vbus_pwrselect();
endinterface
(* always_ready, always_enabled *)
interface Pps7Wdt#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    method Action      clk_in(Bit#(1) v);
    method Bit#(1)     rst_out();
endinterface
(* always_ready, always_enabled *)
interface PPS7#(numeric type c_dm_width, numeric type c_dq_width, numeric type c_dqs_width, numeric type data_width, numeric type gpio_width, numeric type id_width, numeric type mio_width);
    interface Pps7Can#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     can0;
    interface Pps7Can#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     can1;
    interface Pps7Core#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     core0;
    interface Pps7Core#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     core1;
    interface Pps7Ddr#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     ddr;
    interface Pps7Dma#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     dma0;
    interface Pps7Dma#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     dma1;
    interface Pps7Dma#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     dma2;
    interface Pps7Dma#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     dma3;
    interface Pps7Enet#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     enet0;
    interface Pps7Enet#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     enet1;
    interface Pps7Event#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     event_;
    interface Pps7Fclk#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk;
    interface Pps7Fclk_clktrig#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_clktrig0;
    interface Pps7Fclk_clktrig#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_clktrig1;
    interface Pps7Fclk_clktrig#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_clktrig2;
    interface Pps7Fclk_clktrig#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_clktrig3;
    interface Pps7Fclk_reset#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_reset0;
    interface Pps7Fclk_reset#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_reset1;
    interface Pps7Fclk_reset#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_reset2;
    interface Pps7Fclk_reset#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fclk_reset3;
    interface Pps7Fpga#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     fpga;
    interface Pps7Ftmd#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     ftmd;
    interface Pps7Ftmt#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     ftmt;
    interface Pps7Gpio#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     gpio;
    interface Pps7I2c#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     i2c0;
    interface Pps7I2c#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     i2c1;
    interface Pps7Irq#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     irq;
    interface Inout#(Bit#(mio_width))     mio;
    interface Pps7M_axi_gp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     m_axi_gp0;
    interface Pps7M_axi_gp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     m_axi_gp1;
    interface Pps7Pjtag#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     pjtag;
    interface Pps7Ps#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     ps;
    interface Pps7Sdio#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     sdio0;
    interface Pps7Sdio#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     sdio1;
    interface Pps7Spi#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     spi0;
    interface Pps7Spi#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     spi1;
    interface Pps7Sram#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     sram;
    interface Pps7S_axi_acp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_acp;
    interface Pps7S_axi_gp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_gp0;
    interface Pps7S_axi_gp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_gp1;
    interface Pps7S_axi_hp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_hp0;
    interface Pps7S_axi_hp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_hp1;
    interface Pps7S_axi_hp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_hp2;
    interface Pps7S_axi_hp#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     s_axi_hp3;
    interface Pps7Trace#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     trace;
    interface Pps7Ttc#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     ttc0;
    interface Pps7Ttc#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     ttc1;
    interface Pps7Uart#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     uart0;
    interface Pps7Uart#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     uart1;
    interface Pps7Usb#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     usb0;
    interface Pps7Usb#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     usb1;
    interface Pps7Wdt#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width)     wdt;
endinterface
import "BVI" processing_system7 =
module mkPPS7(PPS7#(c_dm_width, c_dq_width, c_dqs_width, data_width, gpio_width, id_width, mio_width));
    let c_dm_width = valueOf(c_dm_width);
    let c_dq_width = valueOf(c_dq_width);
    let c_dqs_width = valueOf(c_dqs_width);
    let data_width = valueOf(data_width);
    let gpio_width = valueOf(gpio_width);
    let id_width = valueOf(id_width);
    let mio_width = valueOf(mio_width);
    default_clock clk();
    default_reset rst();
    parameter C_DM_WIDTH = 4;
    parameter C_DQS_WIDTH = 4;
    parameter C_DQ_WIDTH = 32;
    parameter C_EMIO_GPIO_WIDTH = 64;
    parameter C_EN_EMIO_ENET0 = 0;
    parameter C_EN_EMIO_ENET1 = 0;
    parameter C_EN_EMIO_TRACE = 0;
    parameter C_FCLK_CLK0_BUF = "TRUE";
    parameter C_FCLK_CLK1_BUF = "TRUE";
    parameter C_FCLK_CLK2_BUF = "TRUE";
    parameter C_FCLK_CLK3_BUF = "TRUE";
    parameter C_INCLUDE_ACP_TRANS_CHECK = 0;
    parameter C_INCLUDE_TRACE_BUFFER = 0;
    parameter C_MIO_PRIMITIVE = 54;
    parameter C_M_AXI_GP0_ENABLE_STATIC_REMAP = 1;
    parameter C_M_AXI_GP0_ID_WIDTH = 12;
    parameter C_M_AXI_GP0_THREAD_ID_WIDTH = 12;
    parameter C_M_AXI_GP1_ENABLE_STATIC_REMAP = 1;
    parameter C_M_AXI_GP1_ID_WIDTH = 12;
    parameter C_M_AXI_GP1_THREAD_ID_WIDTH = 12;
    parameter C_NUM_F2P_INTR_INPUTS = 1;
    parameter C_PACKAGE_NAME = "clg484";
    parameter C_PS7_SI_REV = "PRODUCTION";
    parameter C_S_AXI_ACP_ARUSER_VAL = 31;
    parameter C_S_AXI_ACP_AWUSER_VAL = 31;
    parameter C_S_AXI_ACP_ID_WIDTH = 3;
    parameter C_S_AXI_GP0_ID_WIDTH = 6;
    parameter C_S_AXI_GP1_ID_WIDTH = 6;
    parameter C_S_AXI_HP0_DATA_WIDTH = 64;
    parameter C_S_AXI_HP0_ID_WIDTH = 6;
    parameter C_S_AXI_HP1_DATA_WIDTH = 64;
    parameter C_S_AXI_HP1_ID_WIDTH = 6;
    parameter C_S_AXI_HP2_DATA_WIDTH = 64;
    parameter C_S_AXI_HP2_ID_WIDTH = 6;
    parameter C_S_AXI_HP3_DATA_WIDTH = 64;
    parameter C_S_AXI_HP3_ID_WIDTH = 6;
    parameter C_TRACE_BUFFER_CLOCK_DELAY = 12;
    parameter C_TRACE_BUFFER_FIFO_SIZE = 128;
    parameter C_USE_DEFAULT_ACP_USER_VAL = 1;
    parameter USE_TRACE_DATA_EDGE_DETECTOR = 0;
        input_clock m_axi_gp0_aclk(M_AXI_GP0_ACLK) <- exposeCurrentClock();
        input_clock m_axi_gp1_aclk(M_AXI_GP1_ACLK) <- exposeCurrentClock();
    interface Pps7Can     can0;
        method phy_rx(CAN0_PHY_RX) enable((*inhigh*) EN_CAN0_PHY_RX);
        method CAN0_PHY_TX phy_tx();
    endinterface
    interface Pps7Can     can1;
        method phy_rx(CAN1_PHY_RX) enable((*inhigh*) EN_CAN1_PHY_RX);
        method CAN1_PHY_TX phy_tx();
    endinterface
    interface Pps7Core     core0;
        method nfiq(Core0_nFIQ) enable((*inhigh*) EN_Core0_nFIQ);
        method nirq(Core0_nIRQ) enable((*inhigh*) EN_Core0_nIRQ);
    endinterface
    interface Pps7Core     core1;
        method nfiq(Core1_nFIQ) enable((*inhigh*) EN_Core1_nFIQ);
        method nirq(Core1_nIRQ) enable((*inhigh*) EN_Core1_nIRQ);
    endinterface
    interface Pps7Ddr     ddr;
        method arb(DDR_ARB) enable((*inhigh*) EN_DDR_ARB);
        ifc_inout addr(DDR_Addr);
        ifc_inout bankaddr(DDR_BankAddr);
        ifc_inout cas_n(DDR_CAS_n);
        ifc_inout cke(DDR_CKE);
        ifc_inout cs_n(DDR_CS_n);
        ifc_inout clk(DDR_Clk);
        ifc_inout clk_n(DDR_Clk_n);
        ifc_inout dm(DDR_DM);
        ifc_inout dq(DDR_DQ);
        ifc_inout dqs(DDR_DQS);
        ifc_inout dqs_n(DDR_DQS_n);
        ifc_inout drstb(DDR_DRSTB);
        ifc_inout odt(DDR_ODT);
        ifc_inout ras_n(DDR_RAS_n);
        ifc_inout vrn(DDR_VRN);
        ifc_inout vrp(DDR_VRP);
        ifc_inout web(DDR_WEB);
    endinterface
    interface Pps7Dma     dma0;
        method aclk(DMA0_ACLK) enable((*inhigh*) EN_DMA0_ACLK);
        method daready(DMA0_DAREADY) enable((*inhigh*) EN_DMA0_DAREADY);
        method DMA0_DATYPE datype();
        method DMA0_DAVALID davalid();
        method drlast(DMA0_DRLAST) enable((*inhigh*) EN_DMA0_DRLAST);
        method DMA0_DRREADY drready();
        method drtype(DMA0_DRTYPE) enable((*inhigh*) EN_DMA0_DRTYPE);
        method drvalid(DMA0_DRVALID) enable((*inhigh*) EN_DMA0_DRVALID);
        method DMA0_RSTN rstn();
    endinterface
    interface Pps7Dma     dma1;
        method aclk(DMA1_ACLK) enable((*inhigh*) EN_DMA1_ACLK);
        method daready(DMA1_DAREADY) enable((*inhigh*) EN_DMA1_DAREADY);
        method DMA1_DATYPE datype();
        method DMA1_DAVALID davalid();
        method drlast(DMA1_DRLAST) enable((*inhigh*) EN_DMA1_DRLAST);
        method DMA1_DRREADY drready();
        method drtype(DMA1_DRTYPE) enable((*inhigh*) EN_DMA1_DRTYPE);
        method drvalid(DMA1_DRVALID) enable((*inhigh*) EN_DMA1_DRVALID);
        method DMA1_RSTN rstn();
    endinterface
    interface Pps7Dma     dma2;
        method aclk(DMA2_ACLK) enable((*inhigh*) EN_DMA2_ACLK);
        method daready(DMA2_DAREADY) enable((*inhigh*) EN_DMA2_DAREADY);
        method DMA2_DATYPE datype();
        method DMA2_DAVALID davalid();
        method drlast(DMA2_DRLAST) enable((*inhigh*) EN_DMA2_DRLAST);
        method DMA2_DRREADY drready();
        method drtype(DMA2_DRTYPE) enable((*inhigh*) EN_DMA2_DRTYPE);
        method drvalid(DMA2_DRVALID) enable((*inhigh*) EN_DMA2_DRVALID);
        method DMA2_RSTN rstn();
    endinterface
    interface Pps7Dma     dma3;
        method aclk(DMA3_ACLK) enable((*inhigh*) EN_DMA3_ACLK);
        method daready(DMA3_DAREADY) enable((*inhigh*) EN_DMA3_DAREADY);
        method DMA3_DATYPE datype();
        method DMA3_DAVALID davalid();
        method drlast(DMA3_DRLAST) enable((*inhigh*) EN_DMA3_DRLAST);
        method DMA3_DRREADY drready();
        method drtype(DMA3_DRTYPE) enable((*inhigh*) EN_DMA3_DRTYPE);
        method drvalid(DMA3_DRVALID) enable((*inhigh*) EN_DMA3_DRVALID);
        method DMA3_RSTN rstn();
    endinterface
    interface Pps7Enet     enet0;
        method ext_intin(ENET0_EXT_INTIN) enable((*inhigh*) EN_ENET0_EXT_INTIN);
        method gmii_col(ENET0_GMII_COL) enable((*inhigh*) EN_ENET0_GMII_COL);
        method gmii_crs(ENET0_GMII_CRS) enable((*inhigh*) EN_ENET0_GMII_CRS);
        method gmii_rxd(ENET0_GMII_RXD) enable((*inhigh*) EN_ENET0_GMII_RXD);
        method gmii_rx_clk(ENET0_GMII_RX_CLK) enable((*inhigh*) EN_ENET0_GMII_RX_CLK);
        method gmii_rx_dv(ENET0_GMII_RX_DV) enable((*inhigh*) EN_ENET0_GMII_RX_DV);
        method gmii_rx_er(ENET0_GMII_RX_ER) enable((*inhigh*) EN_ENET0_GMII_RX_ER);
        method ENET0_GMII_TXD gmii_txd();
        method gmii_tx_clk(ENET0_GMII_TX_CLK) enable((*inhigh*) EN_ENET0_GMII_TX_CLK);
        method ENET0_GMII_TX_EN gmii_tx_en();
        method ENET0_GMII_TX_ER gmii_tx_er();
        method mdio_i(ENET0_MDIO_I) enable((*inhigh*) EN_ENET0_MDIO_I);
        method ENET0_MDIO_MDC mdio_mdc();
        method ENET0_MDIO_O mdio_o();
        method ENET0_MDIO_T mdio_t();
        method ENET0_PTP_DELAY_REQ_RX ptp_delay_req_rx();
        method ENET0_PTP_DELAY_REQ_TX ptp_delay_req_tx();
        method ENET0_PTP_PDELAY_REQ_RX ptp_pdelay_req_rx();
        method ENET0_PTP_PDELAY_REQ_TX ptp_pdelay_req_tx();
        method ENET0_PTP_PDELAY_RESP_RX ptp_pdelay_resp_rx();
        method ENET0_PTP_PDELAY_RESP_TX ptp_pdelay_resp_tx();
        method ENET0_PTP_SYNC_FRAME_RX ptp_sync_frame_rx();
        method ENET0_PTP_SYNC_FRAME_TX ptp_sync_frame_tx();
        method ENET0_SOF_RX sof_rx();
        method ENET0_SOF_TX sof_tx();
    endinterface
    interface Pps7Enet     enet1;
        method ext_intin(ENET1_EXT_INTIN) enable((*inhigh*) EN_ENET1_EXT_INTIN);
        method gmii_col(ENET1_GMII_COL) enable((*inhigh*) EN_ENET1_GMII_COL);
        method gmii_crs(ENET1_GMII_CRS) enable((*inhigh*) EN_ENET1_GMII_CRS);
        method gmii_rxd(ENET1_GMII_RXD) enable((*inhigh*) EN_ENET1_GMII_RXD);
        method gmii_rx_clk(ENET1_GMII_RX_CLK) enable((*inhigh*) EN_ENET1_GMII_RX_CLK);
        method gmii_rx_dv(ENET1_GMII_RX_DV) enable((*inhigh*) EN_ENET1_GMII_RX_DV);
        method gmii_rx_er(ENET1_GMII_RX_ER) enable((*inhigh*) EN_ENET1_GMII_RX_ER);
        method ENET1_GMII_TXD gmii_txd();
        method gmii_tx_clk(ENET1_GMII_TX_CLK) enable((*inhigh*) EN_ENET1_GMII_TX_CLK);
        method ENET1_GMII_TX_EN gmii_tx_en();
        method ENET1_GMII_TX_ER gmii_tx_er();
        method mdio_i(ENET1_MDIO_I) enable((*inhigh*) EN_ENET1_MDIO_I);
        method ENET1_MDIO_MDC mdio_mdc();
        method ENET1_MDIO_O mdio_o();
        method ENET1_MDIO_T mdio_t();
        method ENET1_PTP_DELAY_REQ_RX ptp_delay_req_rx();
        method ENET1_PTP_DELAY_REQ_TX ptp_delay_req_tx();
        method ENET1_PTP_PDELAY_REQ_RX ptp_pdelay_req_rx();
        method ENET1_PTP_PDELAY_REQ_TX ptp_pdelay_req_tx();
        method ENET1_PTP_PDELAY_RESP_RX ptp_pdelay_resp_rx();
        method ENET1_PTP_PDELAY_RESP_TX ptp_pdelay_resp_tx();
        method ENET1_PTP_SYNC_FRAME_RX ptp_sync_frame_rx();
        method ENET1_PTP_SYNC_FRAME_TX ptp_sync_frame_tx();
        method ENET1_SOF_RX sof_rx();
        method ENET1_SOF_TX sof_tx();
    endinterface
    interface Pps7Event     event_;
        method eventi(EVENT_EVENTI) enable((*inhigh*) EN_EVENT_EVENTI);
        method EVENT_EVENTO evento();
        method EVENT_STANDBYWFE standbywfe();
        method EVENT_STANDBYWFI standbywfi();
    endinterface
    interface Pps7Fclk     fclk;
        output_clock clk0(FCLK_CLK0);
        method FCLK_CLK1 clk1();
        method FCLK_CLK2 clk2();
        method FCLK_CLK3 clk3();
    endinterface
    interface Pps7Fclk_clktrig     fclk_clktrig0;
        method n(FCLK_CLKTRIG0_N) enable((*inhigh*) EN_FCLK_CLKTRIG0_N);
    endinterface
    interface Pps7Fclk_clktrig     fclk_clktrig1;
        method n(FCLK_CLKTRIG1_N) enable((*inhigh*) EN_FCLK_CLKTRIG1_N);
    endinterface
    interface Pps7Fclk_clktrig     fclk_clktrig2;
        method n(FCLK_CLKTRIG2_N) enable((*inhigh*) EN_FCLK_CLKTRIG2_N);
    endinterface
    interface Pps7Fclk_clktrig     fclk_clktrig3;
        method n(FCLK_CLKTRIG3_N) enable((*inhigh*) EN_FCLK_CLKTRIG3_N);
    endinterface
    interface Pps7Fclk_reset     fclk_reset0;
        method FCLK_RESET0_N n();
    endinterface
    interface Pps7Fclk_reset     fclk_reset1;
        method FCLK_RESET1_N n();
    endinterface
    interface Pps7Fclk_reset     fclk_reset2;
        method FCLK_RESET2_N n();
    endinterface
    interface Pps7Fclk_reset     fclk_reset3;
        method FCLK_RESET3_N n();
    endinterface
    interface Pps7Fpga     fpga;
        method idle_n(FPGA_IDLE_N) enable((*inhigh*) EN_FPGA_IDLE_N);
    endinterface
    interface Pps7Ftmd     ftmd;
        method tracein_atid(FTMD_TRACEIN_ATID) enable((*inhigh*) EN_FTMD_TRACEIN_ATID);
        method tracein_clk(FTMD_TRACEIN_CLK) enable((*inhigh*) EN_FTMD_TRACEIN_CLK);
        method tracein_data(FTMD_TRACEIN_DATA) enable((*inhigh*) EN_FTMD_TRACEIN_DATA);
        method tracein_valid(FTMD_TRACEIN_VALID) enable((*inhigh*) EN_FTMD_TRACEIN_VALID);
    endinterface
    interface Pps7Ftmt     ftmt;
        method f2p_debug(FTMT_F2P_DEBUG) enable((*inhigh*) EN_FTMT_F2P_DEBUG);
        method f2p_trig(FTMT_F2P_TRIG) enable((*inhigh*) EN_FTMT_F2P_TRIG);
        method FTMT_F2P_TRIGACK f2p_trigack();
        method FTMT_P2F_DEBUG p2f_debug();
        method FTMT_P2F_TRIG p2f_trig();
        method p2f_trigack(FTMT_P2F_TRIGACK) enable((*inhigh*) EN_FTMT_P2F_TRIGACK);
    endinterface
    interface Pps7Gpio     gpio;
        method i(GPIO_I) enable((*inhigh*) EN_GPIO_I);
        method GPIO_O o();
        method GPIO_T t();
    endinterface
    interface Pps7I2c     i2c0;
        method scl_i(I2C0_SCL_I) enable((*inhigh*) EN_I2C0_SCL_I);
        method I2C0_SCL_O scl_o();
        method I2C0_SCL_T scl_t();
        method sda_i(I2C0_SDA_I) enable((*inhigh*) EN_I2C0_SDA_I);
        method I2C0_SDA_O sda_o();
        method I2C0_SDA_T sda_t();
    endinterface
    interface Pps7I2c     i2c1;
        method scl_i(I2C1_SCL_I) enable((*inhigh*) EN_I2C1_SCL_I);
        method I2C1_SCL_O scl_o();
        method I2C1_SCL_T scl_t();
        method sda_i(I2C1_SDA_I) enable((*inhigh*) EN_I2C1_SDA_I);
        method I2C1_SDA_O sda_o();
        method I2C1_SDA_T sda_t();
    endinterface
    interface Pps7Irq     irq;
        method f2p(IRQ_F2P) enable((*inhigh*) EN_IRQ_F2P);
        method IRQ_P2F_CAN0 p2f_can0();
        method IRQ_P2F_CAN1 p2f_can1();
        method IRQ_P2F_CTI p2f_cti();
        method IRQ_P2F_DMAC0 p2f_dmac0();
        method IRQ_P2F_DMAC1 p2f_dmac1();
        method IRQ_P2F_DMAC2 p2f_dmac2();
        method IRQ_P2F_DMAC3 p2f_dmac3();
        method IRQ_P2F_DMAC4 p2f_dmac4();
        method IRQ_P2F_DMAC5 p2f_dmac5();
        method IRQ_P2F_DMAC6 p2f_dmac6();
        method IRQ_P2F_DMAC7 p2f_dmac7();
        method IRQ_P2F_DMAC_ABORT p2f_dmac_abort();
        method IRQ_P2F_ENET0 p2f_enet0();
        method IRQ_P2F_ENET1 p2f_enet1();
        method IRQ_P2F_ENET_WAKE0 p2f_enet_wake0();
        method IRQ_P2F_ENET_WAKE1 p2f_enet_wake1();
        method IRQ_P2F_GPIO p2f_gpio();
        method IRQ_P2F_I2C0 p2f_i2c0();
        method IRQ_P2F_I2C1 p2f_i2c1();
        method IRQ_P2F_QSPI p2f_qspi();
        method IRQ_P2F_SDIO0 p2f_sdio0();
        method IRQ_P2F_SDIO1 p2f_sdio1();
        method IRQ_P2F_SMC p2f_smc();
        method IRQ_P2F_SPI0 p2f_spi0();
        method IRQ_P2F_SPI1 p2f_spi1();
        method IRQ_P2F_UART0 p2f_uart0();
        method IRQ_P2F_UART1 p2f_uart1();
        method IRQ_P2F_USB0 p2f_usb0();
        method IRQ_P2F_USB1 p2f_usb1();
    endinterface
    ifc_inout mio(MIO);
    interface Pps7M_axi_gp     m_axi_gp0;
        method M_AXI_GP0_ARADDR araddr();
        method M_AXI_GP0_ARBURST arburst();
        method M_AXI_GP0_ARCACHE arcache();
        method M_AXI_GP0_ARESETN aresetn();
        method M_AXI_GP0_ARID arid();
        method M_AXI_GP0_ARLEN arlen();
        method M_AXI_GP0_ARLOCK arlock();
        method M_AXI_GP0_ARPROT arprot();
        method M_AXI_GP0_ARQOS arqos();
        method arready(M_AXI_GP0_ARREADY) enable((*inhigh*) EN_M_AXI_GP0_ARREADY);
        method M_AXI_GP0_ARSIZE arsize();
        method M_AXI_GP0_ARVALID arvalid();
        method M_AXI_GP0_AWADDR awaddr();
        method M_AXI_GP0_AWBURST awburst();
        method M_AXI_GP0_AWCACHE awcache();
        method M_AXI_GP0_AWID awid();
        method M_AXI_GP0_AWLEN awlen();
        method M_AXI_GP0_AWLOCK awlock();
        method M_AXI_GP0_AWPROT awprot();
        method M_AXI_GP0_AWQOS awqos();
        method awready(M_AXI_GP0_AWREADY) enable((*inhigh*) EN_M_AXI_GP0_AWREADY);
        method M_AXI_GP0_AWSIZE awsize();
        method M_AXI_GP0_AWVALID awvalid();
        method bid(M_AXI_GP0_BID) enable((*inhigh*) EN_M_AXI_GP0_BID);
        method M_AXI_GP0_BREADY bready();
        method bresp(M_AXI_GP0_BRESP) enable((*inhigh*) EN_M_AXI_GP0_BRESP);
        method bvalid(M_AXI_GP0_BVALID) enable((*inhigh*) EN_M_AXI_GP0_BVALID);
        method rdata(M_AXI_GP0_RDATA) enable((*inhigh*) EN_M_AXI_GP0_RDATA);
        method rid(M_AXI_GP0_RID) enable((*inhigh*) EN_M_AXI_GP0_RID);
        method rlast(M_AXI_GP0_RLAST) enable((*inhigh*) EN_M_AXI_GP0_RLAST);
        method M_AXI_GP0_RREADY rready();
        method rresp(M_AXI_GP0_RRESP) enable((*inhigh*) EN_M_AXI_GP0_RRESP);
        method rvalid(M_AXI_GP0_RVALID) enable((*inhigh*) EN_M_AXI_GP0_RVALID);
        method M_AXI_GP0_WDATA wdata();
        method M_AXI_GP0_WID wid();
        method M_AXI_GP0_WLAST wlast();
        method wready(M_AXI_GP0_WREADY) enable((*inhigh*) EN_M_AXI_GP0_WREADY);
        method M_AXI_GP0_WSTRB wstrb();
        method M_AXI_GP0_WVALID wvalid();
    endinterface
    interface Pps7M_axi_gp     m_axi_gp1;
        method M_AXI_GP1_ARADDR araddr();
        method M_AXI_GP1_ARBURST arburst();
        method M_AXI_GP1_ARCACHE arcache();
        method M_AXI_GP1_ARESETN aresetn();
        method M_AXI_GP1_ARID arid();
        method M_AXI_GP1_ARLEN arlen();
        method M_AXI_GP1_ARLOCK arlock();
        method M_AXI_GP1_ARPROT arprot();
        method M_AXI_GP1_ARQOS arqos();
        method arready(M_AXI_GP1_ARREADY) enable((*inhigh*) EN_M_AXI_GP1_ARREADY);
        method M_AXI_GP1_ARSIZE arsize();
        method M_AXI_GP1_ARVALID arvalid();
        method M_AXI_GP1_AWADDR awaddr();
        method M_AXI_GP1_AWBURST awburst();
        method M_AXI_GP1_AWCACHE awcache();
        method M_AXI_GP1_AWID awid();
        method M_AXI_GP1_AWLEN awlen();
        method M_AXI_GP1_AWLOCK awlock();
        method M_AXI_GP1_AWPROT awprot();
        method M_AXI_GP1_AWQOS awqos();
        method awready(M_AXI_GP1_AWREADY) enable((*inhigh*) EN_M_AXI_GP1_AWREADY);
        method M_AXI_GP1_AWSIZE awsize();
        method M_AXI_GP1_AWVALID awvalid();
        method bid(M_AXI_GP1_BID) enable((*inhigh*) EN_M_AXI_GP1_BID);
        method M_AXI_GP1_BREADY bready();
        method bresp(M_AXI_GP1_BRESP) enable((*inhigh*) EN_M_AXI_GP1_BRESP);
        method bvalid(M_AXI_GP1_BVALID) enable((*inhigh*) EN_M_AXI_GP1_BVALID);
        method rdata(M_AXI_GP1_RDATA) enable((*inhigh*) EN_M_AXI_GP1_RDATA);
        method rid(M_AXI_GP1_RID) enable((*inhigh*) EN_M_AXI_GP1_RID);
        method rlast(M_AXI_GP1_RLAST) enable((*inhigh*) EN_M_AXI_GP1_RLAST);
        method M_AXI_GP1_RREADY rready();
        method rresp(M_AXI_GP1_RRESP) enable((*inhigh*) EN_M_AXI_GP1_RRESP);
        method rvalid(M_AXI_GP1_RVALID) enable((*inhigh*) EN_M_AXI_GP1_RVALID);
        method M_AXI_GP1_WDATA wdata();
        method M_AXI_GP1_WID wid();
        method M_AXI_GP1_WLAST wlast();
        method wready(M_AXI_GP1_WREADY) enable((*inhigh*) EN_M_AXI_GP1_WREADY);
        method M_AXI_GP1_WSTRB wstrb();
        method M_AXI_GP1_WVALID wvalid();
    endinterface
    interface Pps7Pjtag     pjtag;
        method tck(PJTAG_TCK) enable((*inhigh*) EN_PJTAG_TCK);
        method td_i(PJTAG_TD_I) enable((*inhigh*) EN_PJTAG_TD_I);
        method PJTAG_TD_O td_o();
        method PJTAG_TD_T td_t();
        method tms(PJTAG_TMS) enable((*inhigh*) EN_PJTAG_TMS);
    endinterface
    interface Pps7Ps     ps;
        ifc_inout clk(PS_CLK);
        ifc_inout porb(PS_PORB);
        ifc_inout srstb(PS_SRSTB);
    endinterface
    interface Pps7Sdio     sdio0;
        method SDIO0_BUSPOW buspow();
        method SDIO0_BUSVOLT busvolt();
        method cdn(SDIO0_CDN) enable((*inhigh*) EN_SDIO0_CDN);
        method SDIO0_CLK clk();
        method clk_fb(SDIO0_CLK_FB) enable((*inhigh*) EN_SDIO0_CLK_FB);
        method cmd_i(SDIO0_CMD_I) enable((*inhigh*) EN_SDIO0_CMD_I);
        method SDIO0_CMD_O cmd_o();
        method SDIO0_CMD_T cmd_t();
        method data_i(SDIO0_DATA_I) enable((*inhigh*) EN_SDIO0_DATA_I);
        method SDIO0_DATA_O data_o();
        method SDIO0_DATA_T data_t();
        method SDIO0_LED led();
        method wp(SDIO0_WP) enable((*inhigh*) EN_SDIO0_WP);
    endinterface
    interface Pps7Sdio     sdio1;
        method SDIO1_BUSPOW buspow();
        method SDIO1_BUSVOLT busvolt();
        method cdn(SDIO1_CDN) enable((*inhigh*) EN_SDIO1_CDN);
        method SDIO1_CLK clk();
        method clk_fb(SDIO1_CLK_FB) enable((*inhigh*) EN_SDIO1_CLK_FB);
        method cmd_i(SDIO1_CMD_I) enable((*inhigh*) EN_SDIO1_CMD_I);
        method SDIO1_CMD_O cmd_o();
        method SDIO1_CMD_T cmd_t();
        method data_i(SDIO1_DATA_I) enable((*inhigh*) EN_SDIO1_DATA_I);
        method SDIO1_DATA_O data_o();
        method SDIO1_DATA_T data_t();
        method SDIO1_LED led();
        method wp(SDIO1_WP) enable((*inhigh*) EN_SDIO1_WP);
    endinterface
    interface Pps7Spi     spi0;
        method miso_i(SPI0_MISO_I) enable((*inhigh*) EN_SPI0_MISO_I);
        method SPI0_MISO_O miso_o();
        method SPI0_MISO_T miso_t();
        method mosi_i(SPI0_MOSI_I) enable((*inhigh*) EN_SPI0_MOSI_I);
        method SPI0_MOSI_O mosi_o();
        method SPI0_MOSI_T mosi_t();
        method sclk_i(SPI0_SCLK_I) enable((*inhigh*) EN_SPI0_SCLK_I);
        method SPI0_SCLK_O sclk_o();
        method SPI0_SCLK_T sclk_t();
        method SPI0_SS1_O ss1_o();
        method SPI0_SS2_O ss2_o();
        method ss_i(SPI0_SS_I) enable((*inhigh*) EN_SPI0_SS_I);
        method SPI0_SS_O ss_o();
        method SPI0_SS_T ss_t();
    endinterface
    interface Pps7Spi     spi1;
        method miso_i(SPI1_MISO_I) enable((*inhigh*) EN_SPI1_MISO_I);
        method SPI1_MISO_O miso_o();
        method SPI1_MISO_T miso_t();
        method mosi_i(SPI1_MOSI_I) enable((*inhigh*) EN_SPI1_MOSI_I);
        method SPI1_MOSI_O mosi_o();
        method SPI1_MOSI_T mosi_t();
        method sclk_i(SPI1_SCLK_I) enable((*inhigh*) EN_SPI1_SCLK_I);
        method SPI1_SCLK_O sclk_o();
        method SPI1_SCLK_T sclk_t();
        method SPI1_SS1_O ss1_o();
        method SPI1_SS2_O ss2_o();
        method ss_i(SPI1_SS_I) enable((*inhigh*) EN_SPI1_SS_I);
        method SPI1_SS_O ss_o();
        method SPI1_SS_T ss_t();
    endinterface
    interface Pps7Sram     sram;
        method intin(SRAM_INTIN) enable((*inhigh*) EN_SRAM_INTIN);
    endinterface
    interface Pps7S_axi_acp     s_axi_acp;
        method aclk(S_AXI_ACP_ACLK) enable((*inhigh*) EN_S_AXI_ACP_ACLK);
        method araddr(S_AXI_ACP_ARADDR) enable((*inhigh*) EN_S_AXI_ACP_ARADDR);
        method arburst(S_AXI_ACP_ARBURST) enable((*inhigh*) EN_S_AXI_ACP_ARBURST);
        method arcache(S_AXI_ACP_ARCACHE) enable((*inhigh*) EN_S_AXI_ACP_ARCACHE);
        method S_AXI_ACP_ARESETN aresetn();
        method arid(S_AXI_ACP_ARID) enable((*inhigh*) EN_S_AXI_ACP_ARID);
        method arlen(S_AXI_ACP_ARLEN) enable((*inhigh*) EN_S_AXI_ACP_ARLEN);
        method arlock(S_AXI_ACP_ARLOCK) enable((*inhigh*) EN_S_AXI_ACP_ARLOCK);
        method arprot(S_AXI_ACP_ARPROT) enable((*inhigh*) EN_S_AXI_ACP_ARPROT);
        method arqos(S_AXI_ACP_ARQOS) enable((*inhigh*) EN_S_AXI_ACP_ARQOS);
        method S_AXI_ACP_ARREADY arready();
        method arsize(S_AXI_ACP_ARSIZE) enable((*inhigh*) EN_S_AXI_ACP_ARSIZE);
        method aruser(S_AXI_ACP_ARUSER) enable((*inhigh*) EN_S_AXI_ACP_ARUSER);
        method arvalid(S_AXI_ACP_ARVALID) enable((*inhigh*) EN_S_AXI_ACP_ARVALID);
        method awaddr(S_AXI_ACP_AWADDR) enable((*inhigh*) EN_S_AXI_ACP_AWADDR);
        method awburst(S_AXI_ACP_AWBURST) enable((*inhigh*) EN_S_AXI_ACP_AWBURST);
        method awcache(S_AXI_ACP_AWCACHE) enable((*inhigh*) EN_S_AXI_ACP_AWCACHE);
        method awid(S_AXI_ACP_AWID) enable((*inhigh*) EN_S_AXI_ACP_AWID);
        method awlen(S_AXI_ACP_AWLEN) enable((*inhigh*) EN_S_AXI_ACP_AWLEN);
        method awlock(S_AXI_ACP_AWLOCK) enable((*inhigh*) EN_S_AXI_ACP_AWLOCK);
        method awprot(S_AXI_ACP_AWPROT) enable((*inhigh*) EN_S_AXI_ACP_AWPROT);
        method awqos(S_AXI_ACP_AWQOS) enable((*inhigh*) EN_S_AXI_ACP_AWQOS);
        method S_AXI_ACP_AWREADY awready();
        method awsize(S_AXI_ACP_AWSIZE) enable((*inhigh*) EN_S_AXI_ACP_AWSIZE);
        method awuser(S_AXI_ACP_AWUSER) enable((*inhigh*) EN_S_AXI_ACP_AWUSER);
        method awvalid(S_AXI_ACP_AWVALID) enable((*inhigh*) EN_S_AXI_ACP_AWVALID);
        method S_AXI_ACP_BID bid();
        method bready(S_AXI_ACP_BREADY) enable((*inhigh*) EN_S_AXI_ACP_BREADY);
        method S_AXI_ACP_BRESP bresp();
        method S_AXI_ACP_BVALID bvalid();
        method S_AXI_ACP_RDATA rdata();
        method S_AXI_ACP_RID rid();
        method S_AXI_ACP_RLAST rlast();
        method rready(S_AXI_ACP_RREADY) enable((*inhigh*) EN_S_AXI_ACP_RREADY);
        method S_AXI_ACP_RRESP rresp();
        method S_AXI_ACP_RVALID rvalid();
        method wdata(S_AXI_ACP_WDATA) enable((*inhigh*) EN_S_AXI_ACP_WDATA);
        method wid(S_AXI_ACP_WID) enable((*inhigh*) EN_S_AXI_ACP_WID);
        method wlast(S_AXI_ACP_WLAST) enable((*inhigh*) EN_S_AXI_ACP_WLAST);
        method S_AXI_ACP_WREADY wready();
        method wstrb(S_AXI_ACP_WSTRB) enable((*inhigh*) EN_S_AXI_ACP_WSTRB);
        method wvalid(S_AXI_ACP_WVALID) enable((*inhigh*) EN_S_AXI_ACP_WVALID);
    endinterface
    interface Pps7S_axi_gp     s_axi_gp0;
        method aclk(S_AXI_GP0_ACLK) enable((*inhigh*) EN_S_AXI_GP0_ACLK);
        method araddr(S_AXI_GP0_ARADDR) enable((*inhigh*) EN_S_AXI_GP0_ARADDR);
        method arburst(S_AXI_GP0_ARBURST) enable((*inhigh*) EN_S_AXI_GP0_ARBURST);
        method arcache(S_AXI_GP0_ARCACHE) enable((*inhigh*) EN_S_AXI_GP0_ARCACHE);
        method S_AXI_GP0_ARESETN aresetn();
        method arid(S_AXI_GP0_ARID) enable((*inhigh*) EN_S_AXI_GP0_ARID);
        method arlen(S_AXI_GP0_ARLEN) enable((*inhigh*) EN_S_AXI_GP0_ARLEN);
        method arlock(S_AXI_GP0_ARLOCK) enable((*inhigh*) EN_S_AXI_GP0_ARLOCK);
        method arprot(S_AXI_GP0_ARPROT) enable((*inhigh*) EN_S_AXI_GP0_ARPROT);
        method arqos(S_AXI_GP0_ARQOS) enable((*inhigh*) EN_S_AXI_GP0_ARQOS);
        method S_AXI_GP0_ARREADY arready();
        method arsize(S_AXI_GP0_ARSIZE) enable((*inhigh*) EN_S_AXI_GP0_ARSIZE);
        method arvalid(S_AXI_GP0_ARVALID) enable((*inhigh*) EN_S_AXI_GP0_ARVALID);
        method awaddr(S_AXI_GP0_AWADDR) enable((*inhigh*) EN_S_AXI_GP0_AWADDR);
        method awburst(S_AXI_GP0_AWBURST) enable((*inhigh*) EN_S_AXI_GP0_AWBURST);
        method awcache(S_AXI_GP0_AWCACHE) enable((*inhigh*) EN_S_AXI_GP0_AWCACHE);
        method awid(S_AXI_GP0_AWID) enable((*inhigh*) EN_S_AXI_GP0_AWID);
        method awlen(S_AXI_GP0_AWLEN) enable((*inhigh*) EN_S_AXI_GP0_AWLEN);
        method awlock(S_AXI_GP0_AWLOCK) enable((*inhigh*) EN_S_AXI_GP0_AWLOCK);
        method awprot(S_AXI_GP0_AWPROT) enable((*inhigh*) EN_S_AXI_GP0_AWPROT);
        method awqos(S_AXI_GP0_AWQOS) enable((*inhigh*) EN_S_AXI_GP0_AWQOS);
        method S_AXI_GP0_AWREADY awready();
        method awsize(S_AXI_GP0_AWSIZE) enable((*inhigh*) EN_S_AXI_GP0_AWSIZE);
        method awvalid(S_AXI_GP0_AWVALID) enable((*inhigh*) EN_S_AXI_GP0_AWVALID);
        method S_AXI_GP0_BID bid();
        method bready(S_AXI_GP0_BREADY) enable((*inhigh*) EN_S_AXI_GP0_BREADY);
        method S_AXI_GP0_BRESP bresp();
        method S_AXI_GP0_BVALID bvalid();
        method S_AXI_GP0_RDATA rdata();
        method S_AXI_GP0_RID rid();
        method S_AXI_GP0_RLAST rlast();
        method rready(S_AXI_GP0_RREADY) enable((*inhigh*) EN_S_AXI_GP0_RREADY);
        method S_AXI_GP0_RRESP rresp();
        method S_AXI_GP0_RVALID rvalid();
        method wdata(S_AXI_GP0_WDATA) enable((*inhigh*) EN_S_AXI_GP0_WDATA);
        method wid(S_AXI_GP0_WID) enable((*inhigh*) EN_S_AXI_GP0_WID);
        method wlast(S_AXI_GP0_WLAST) enable((*inhigh*) EN_S_AXI_GP0_WLAST);
        method S_AXI_GP0_WREADY wready();
        method wstrb(S_AXI_GP0_WSTRB) enable((*inhigh*) EN_S_AXI_GP0_WSTRB);
        method wvalid(S_AXI_GP0_WVALID) enable((*inhigh*) EN_S_AXI_GP0_WVALID);
    endinterface
    interface Pps7S_axi_gp     s_axi_gp1;
        method aclk(S_AXI_GP1_ACLK) enable((*inhigh*) EN_S_AXI_GP1_ACLK);
        method araddr(S_AXI_GP1_ARADDR) enable((*inhigh*) EN_S_AXI_GP1_ARADDR);
        method arburst(S_AXI_GP1_ARBURST) enable((*inhigh*) EN_S_AXI_GP1_ARBURST);
        method arcache(S_AXI_GP1_ARCACHE) enable((*inhigh*) EN_S_AXI_GP1_ARCACHE);
        method S_AXI_GP1_ARESETN aresetn();
        method arid(S_AXI_GP1_ARID) enable((*inhigh*) EN_S_AXI_GP1_ARID);
        method arlen(S_AXI_GP1_ARLEN) enable((*inhigh*) EN_S_AXI_GP1_ARLEN);
        method arlock(S_AXI_GP1_ARLOCK) enable((*inhigh*) EN_S_AXI_GP1_ARLOCK);
        method arprot(S_AXI_GP1_ARPROT) enable((*inhigh*) EN_S_AXI_GP1_ARPROT);
        method arqos(S_AXI_GP1_ARQOS) enable((*inhigh*) EN_S_AXI_GP1_ARQOS);
        method S_AXI_GP1_ARREADY arready();
        method arsize(S_AXI_GP1_ARSIZE) enable((*inhigh*) EN_S_AXI_GP1_ARSIZE);
        method arvalid(S_AXI_GP1_ARVALID) enable((*inhigh*) EN_S_AXI_GP1_ARVALID);
        method awaddr(S_AXI_GP1_AWADDR) enable((*inhigh*) EN_S_AXI_GP1_AWADDR);
        method awburst(S_AXI_GP1_AWBURST) enable((*inhigh*) EN_S_AXI_GP1_AWBURST);
        method awcache(S_AXI_GP1_AWCACHE) enable((*inhigh*) EN_S_AXI_GP1_AWCACHE);
        method awid(S_AXI_GP1_AWID) enable((*inhigh*) EN_S_AXI_GP1_AWID);
        method awlen(S_AXI_GP1_AWLEN) enable((*inhigh*) EN_S_AXI_GP1_AWLEN);
        method awlock(S_AXI_GP1_AWLOCK) enable((*inhigh*) EN_S_AXI_GP1_AWLOCK);
        method awprot(S_AXI_GP1_AWPROT) enable((*inhigh*) EN_S_AXI_GP1_AWPROT);
        method awqos(S_AXI_GP1_AWQOS) enable((*inhigh*) EN_S_AXI_GP1_AWQOS);
        method S_AXI_GP1_AWREADY awready();
        method awsize(S_AXI_GP1_AWSIZE) enable((*inhigh*) EN_S_AXI_GP1_AWSIZE);
        method awvalid(S_AXI_GP1_AWVALID) enable((*inhigh*) EN_S_AXI_GP1_AWVALID);
        method S_AXI_GP1_BID bid();
        method bready(S_AXI_GP1_BREADY) enable((*inhigh*) EN_S_AXI_GP1_BREADY);
        method S_AXI_GP1_BRESP bresp();
        method S_AXI_GP1_BVALID bvalid();
        method S_AXI_GP1_RDATA rdata();
        method S_AXI_GP1_RID rid();
        method S_AXI_GP1_RLAST rlast();
        method rready(S_AXI_GP1_RREADY) enable((*inhigh*) EN_S_AXI_GP1_RREADY);
        method S_AXI_GP1_RRESP rresp();
        method S_AXI_GP1_RVALID rvalid();
        method wdata(S_AXI_GP1_WDATA) enable((*inhigh*) EN_S_AXI_GP1_WDATA);
        method wid(S_AXI_GP1_WID) enable((*inhigh*) EN_S_AXI_GP1_WID);
        method wlast(S_AXI_GP1_WLAST) enable((*inhigh*) EN_S_AXI_GP1_WLAST);
        method S_AXI_GP1_WREADY wready();
        method wstrb(S_AXI_GP1_WSTRB) enable((*inhigh*) EN_S_AXI_GP1_WSTRB);
        method wvalid(S_AXI_GP1_WVALID) enable((*inhigh*) EN_S_AXI_GP1_WVALID);
    endinterface
    interface Pps7S_axi_hp     s_axi_hp0;
        method aclk(S_AXI_HP0_ACLK) enable((*inhigh*) EN_S_AXI_HP0_ACLK);
        method araddr(S_AXI_HP0_ARADDR) enable((*inhigh*) EN_S_AXI_HP0_ARADDR);
        method arburst(S_AXI_HP0_ARBURST) enable((*inhigh*) EN_S_AXI_HP0_ARBURST);
        method arcache(S_AXI_HP0_ARCACHE) enable((*inhigh*) EN_S_AXI_HP0_ARCACHE);
        method S_AXI_HP0_ARESETN aresetn();
        method arid(S_AXI_HP0_ARID) enable((*inhigh*) EN_S_AXI_HP0_ARID);
        method arlen(S_AXI_HP0_ARLEN) enable((*inhigh*) EN_S_AXI_HP0_ARLEN);
        method arlock(S_AXI_HP0_ARLOCK) enable((*inhigh*) EN_S_AXI_HP0_ARLOCK);
        method arprot(S_AXI_HP0_ARPROT) enable((*inhigh*) EN_S_AXI_HP0_ARPROT);
        method arqos(S_AXI_HP0_ARQOS) enable((*inhigh*) EN_S_AXI_HP0_ARQOS);
        method S_AXI_HP0_ARREADY arready();
        method arsize(S_AXI_HP0_ARSIZE) enable((*inhigh*) EN_S_AXI_HP0_ARSIZE);
        method arvalid(S_AXI_HP0_ARVALID) enable((*inhigh*) EN_S_AXI_HP0_ARVALID);
        method awaddr(S_AXI_HP0_AWADDR) enable((*inhigh*) EN_S_AXI_HP0_AWADDR);
        method awburst(S_AXI_HP0_AWBURST) enable((*inhigh*) EN_S_AXI_HP0_AWBURST);
        method awcache(S_AXI_HP0_AWCACHE) enable((*inhigh*) EN_S_AXI_HP0_AWCACHE);
        method awid(S_AXI_HP0_AWID) enable((*inhigh*) EN_S_AXI_HP0_AWID);
        method awlen(S_AXI_HP0_AWLEN) enable((*inhigh*) EN_S_AXI_HP0_AWLEN);
        method awlock(S_AXI_HP0_AWLOCK) enable((*inhigh*) EN_S_AXI_HP0_AWLOCK);
        method awprot(S_AXI_HP0_AWPROT) enable((*inhigh*) EN_S_AXI_HP0_AWPROT);
        method awqos(S_AXI_HP0_AWQOS) enable((*inhigh*) EN_S_AXI_HP0_AWQOS);
        method S_AXI_HP0_AWREADY awready();
        method awsize(S_AXI_HP0_AWSIZE) enable((*inhigh*) EN_S_AXI_HP0_AWSIZE);
        method awvalid(S_AXI_HP0_AWVALID) enable((*inhigh*) EN_S_AXI_HP0_AWVALID);
        method S_AXI_HP0_BID bid();
        method bready(S_AXI_HP0_BREADY) enable((*inhigh*) EN_S_AXI_HP0_BREADY);
        method S_AXI_HP0_BRESP bresp();
        method S_AXI_HP0_BVALID bvalid();
        method S_AXI_HP0_RACOUNT racount();
        method S_AXI_HP0_RCOUNT rcount();
        method S_AXI_HP0_RDATA rdata();
        method rdissuecap1_en(S_AXI_HP0_RDISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP0_RDISSUECAP1_EN);
        method S_AXI_HP0_RID rid();
        method S_AXI_HP0_RLAST rlast();
        method rready(S_AXI_HP0_RREADY) enable((*inhigh*) EN_S_AXI_HP0_RREADY);
        method S_AXI_HP0_RRESP rresp();
        method S_AXI_HP0_RVALID rvalid();
        method S_AXI_HP0_WACOUNT wacount();
        method S_AXI_HP0_WCOUNT wcount();
        method wdata(S_AXI_HP0_WDATA) enable((*inhigh*) EN_S_AXI_HP0_WDATA);
        method wid(S_AXI_HP0_WID) enable((*inhigh*) EN_S_AXI_HP0_WID);
        method wlast(S_AXI_HP0_WLAST) enable((*inhigh*) EN_S_AXI_HP0_WLAST);
        method S_AXI_HP0_WREADY wready();
        method wrissuecap1_en(S_AXI_HP0_WRISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP0_WRISSUECAP1_EN);
        method wstrb(S_AXI_HP0_WSTRB) enable((*inhigh*) EN_S_AXI_HP0_WSTRB);
        method wvalid(S_AXI_HP0_WVALID) enable((*inhigh*) EN_S_AXI_HP0_WVALID);
    endinterface
    interface Pps7S_axi_hp     s_axi_hp1;
        method aclk(S_AXI_HP1_ACLK) enable((*inhigh*) EN_S_AXI_HP1_ACLK);
        method araddr(S_AXI_HP1_ARADDR) enable((*inhigh*) EN_S_AXI_HP1_ARADDR);
        method arburst(S_AXI_HP1_ARBURST) enable((*inhigh*) EN_S_AXI_HP1_ARBURST);
        method arcache(S_AXI_HP1_ARCACHE) enable((*inhigh*) EN_S_AXI_HP1_ARCACHE);
        method S_AXI_HP1_ARESETN aresetn();
        method arid(S_AXI_HP1_ARID) enable((*inhigh*) EN_S_AXI_HP1_ARID);
        method arlen(S_AXI_HP1_ARLEN) enable((*inhigh*) EN_S_AXI_HP1_ARLEN);
        method arlock(S_AXI_HP1_ARLOCK) enable((*inhigh*) EN_S_AXI_HP1_ARLOCK);
        method arprot(S_AXI_HP1_ARPROT) enable((*inhigh*) EN_S_AXI_HP1_ARPROT);
        method arqos(S_AXI_HP1_ARQOS) enable((*inhigh*) EN_S_AXI_HP1_ARQOS);
        method S_AXI_HP1_ARREADY arready();
        method arsize(S_AXI_HP1_ARSIZE) enable((*inhigh*) EN_S_AXI_HP1_ARSIZE);
        method arvalid(S_AXI_HP1_ARVALID) enable((*inhigh*) EN_S_AXI_HP1_ARVALID);
        method awaddr(S_AXI_HP1_AWADDR) enable((*inhigh*) EN_S_AXI_HP1_AWADDR);
        method awburst(S_AXI_HP1_AWBURST) enable((*inhigh*) EN_S_AXI_HP1_AWBURST);
        method awcache(S_AXI_HP1_AWCACHE) enable((*inhigh*) EN_S_AXI_HP1_AWCACHE);
        method awid(S_AXI_HP1_AWID) enable((*inhigh*) EN_S_AXI_HP1_AWID);
        method awlen(S_AXI_HP1_AWLEN) enable((*inhigh*) EN_S_AXI_HP1_AWLEN);
        method awlock(S_AXI_HP1_AWLOCK) enable((*inhigh*) EN_S_AXI_HP1_AWLOCK);
        method awprot(S_AXI_HP1_AWPROT) enable((*inhigh*) EN_S_AXI_HP1_AWPROT);
        method awqos(S_AXI_HP1_AWQOS) enable((*inhigh*) EN_S_AXI_HP1_AWQOS);
        method S_AXI_HP1_AWREADY awready();
        method awsize(S_AXI_HP1_AWSIZE) enable((*inhigh*) EN_S_AXI_HP1_AWSIZE);
        method awvalid(S_AXI_HP1_AWVALID) enable((*inhigh*) EN_S_AXI_HP1_AWVALID);
        method S_AXI_HP1_BID bid();
        method bready(S_AXI_HP1_BREADY) enable((*inhigh*) EN_S_AXI_HP1_BREADY);
        method S_AXI_HP1_BRESP bresp();
        method S_AXI_HP1_BVALID bvalid();
        method S_AXI_HP1_RACOUNT racount();
        method S_AXI_HP1_RCOUNT rcount();
        method S_AXI_HP1_RDATA rdata();
        method rdissuecap1_en(S_AXI_HP1_RDISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP1_RDISSUECAP1_EN);
        method S_AXI_HP1_RID rid();
        method S_AXI_HP1_RLAST rlast();
        method rready(S_AXI_HP1_RREADY) enable((*inhigh*) EN_S_AXI_HP1_RREADY);
        method S_AXI_HP1_RRESP rresp();
        method S_AXI_HP1_RVALID rvalid();
        method S_AXI_HP1_WACOUNT wacount();
        method S_AXI_HP1_WCOUNT wcount();
        method wdata(S_AXI_HP1_WDATA) enable((*inhigh*) EN_S_AXI_HP1_WDATA);
        method wid(S_AXI_HP1_WID) enable((*inhigh*) EN_S_AXI_HP1_WID);
        method wlast(S_AXI_HP1_WLAST) enable((*inhigh*) EN_S_AXI_HP1_WLAST);
        method S_AXI_HP1_WREADY wready();
        method wrissuecap1_en(S_AXI_HP1_WRISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP1_WRISSUECAP1_EN);
        method wstrb(S_AXI_HP1_WSTRB) enable((*inhigh*) EN_S_AXI_HP1_WSTRB);
        method wvalid(S_AXI_HP1_WVALID) enable((*inhigh*) EN_S_AXI_HP1_WVALID);
    endinterface
    interface Pps7S_axi_hp     s_axi_hp2;
        method aclk(S_AXI_HP2_ACLK) enable((*inhigh*) EN_S_AXI_HP2_ACLK);
        method araddr(S_AXI_HP2_ARADDR) enable((*inhigh*) EN_S_AXI_HP2_ARADDR);
        method arburst(S_AXI_HP2_ARBURST) enable((*inhigh*) EN_S_AXI_HP2_ARBURST);
        method arcache(S_AXI_HP2_ARCACHE) enable((*inhigh*) EN_S_AXI_HP2_ARCACHE);
        method S_AXI_HP2_ARESETN aresetn();
        method arid(S_AXI_HP2_ARID) enable((*inhigh*) EN_S_AXI_HP2_ARID);
        method arlen(S_AXI_HP2_ARLEN) enable((*inhigh*) EN_S_AXI_HP2_ARLEN);
        method arlock(S_AXI_HP2_ARLOCK) enable((*inhigh*) EN_S_AXI_HP2_ARLOCK);
        method arprot(S_AXI_HP2_ARPROT) enable((*inhigh*) EN_S_AXI_HP2_ARPROT);
        method arqos(S_AXI_HP2_ARQOS) enable((*inhigh*) EN_S_AXI_HP2_ARQOS);
        method S_AXI_HP2_ARREADY arready();
        method arsize(S_AXI_HP2_ARSIZE) enable((*inhigh*) EN_S_AXI_HP2_ARSIZE);
        method arvalid(S_AXI_HP2_ARVALID) enable((*inhigh*) EN_S_AXI_HP2_ARVALID);
        method awaddr(S_AXI_HP2_AWADDR) enable((*inhigh*) EN_S_AXI_HP2_AWADDR);
        method awburst(S_AXI_HP2_AWBURST) enable((*inhigh*) EN_S_AXI_HP2_AWBURST);
        method awcache(S_AXI_HP2_AWCACHE) enable((*inhigh*) EN_S_AXI_HP2_AWCACHE);
        method awid(S_AXI_HP2_AWID) enable((*inhigh*) EN_S_AXI_HP2_AWID);
        method awlen(S_AXI_HP2_AWLEN) enable((*inhigh*) EN_S_AXI_HP2_AWLEN);
        method awlock(S_AXI_HP2_AWLOCK) enable((*inhigh*) EN_S_AXI_HP2_AWLOCK);
        method awprot(S_AXI_HP2_AWPROT) enable((*inhigh*) EN_S_AXI_HP2_AWPROT);
        method awqos(S_AXI_HP2_AWQOS) enable((*inhigh*) EN_S_AXI_HP2_AWQOS);
        method S_AXI_HP2_AWREADY awready();
        method awsize(S_AXI_HP2_AWSIZE) enable((*inhigh*) EN_S_AXI_HP2_AWSIZE);
        method awvalid(S_AXI_HP2_AWVALID) enable((*inhigh*) EN_S_AXI_HP2_AWVALID);
        method S_AXI_HP2_BID bid();
        method bready(S_AXI_HP2_BREADY) enable((*inhigh*) EN_S_AXI_HP2_BREADY);
        method S_AXI_HP2_BRESP bresp();
        method S_AXI_HP2_BVALID bvalid();
        method S_AXI_HP2_RACOUNT racount();
        method S_AXI_HP2_RCOUNT rcount();
        method S_AXI_HP2_RDATA rdata();
        method rdissuecap1_en(S_AXI_HP2_RDISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP2_RDISSUECAP1_EN);
        method S_AXI_HP2_RID rid();
        method S_AXI_HP2_RLAST rlast();
        method rready(S_AXI_HP2_RREADY) enable((*inhigh*) EN_S_AXI_HP2_RREADY);
        method S_AXI_HP2_RRESP rresp();
        method S_AXI_HP2_RVALID rvalid();
        method S_AXI_HP2_WACOUNT wacount();
        method S_AXI_HP2_WCOUNT wcount();
        method wdata(S_AXI_HP2_WDATA) enable((*inhigh*) EN_S_AXI_HP2_WDATA);
        method wid(S_AXI_HP2_WID) enable((*inhigh*) EN_S_AXI_HP2_WID);
        method wlast(S_AXI_HP2_WLAST) enable((*inhigh*) EN_S_AXI_HP2_WLAST);
        method S_AXI_HP2_WREADY wready();
        method wrissuecap1_en(S_AXI_HP2_WRISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP2_WRISSUECAP1_EN);
        method wstrb(S_AXI_HP2_WSTRB) enable((*inhigh*) EN_S_AXI_HP2_WSTRB);
        method wvalid(S_AXI_HP2_WVALID) enable((*inhigh*) EN_S_AXI_HP2_WVALID);
    endinterface
    interface Pps7S_axi_hp     s_axi_hp3;
        method aclk(S_AXI_HP3_ACLK) enable((*inhigh*) EN_S_AXI_HP3_ACLK);
        method araddr(S_AXI_HP3_ARADDR) enable((*inhigh*) EN_S_AXI_HP3_ARADDR);
        method arburst(S_AXI_HP3_ARBURST) enable((*inhigh*) EN_S_AXI_HP3_ARBURST);
        method arcache(S_AXI_HP3_ARCACHE) enable((*inhigh*) EN_S_AXI_HP3_ARCACHE);
        method S_AXI_HP3_ARESETN aresetn();
        method arid(S_AXI_HP3_ARID) enable((*inhigh*) EN_S_AXI_HP3_ARID);
        method arlen(S_AXI_HP3_ARLEN) enable((*inhigh*) EN_S_AXI_HP3_ARLEN);
        method arlock(S_AXI_HP3_ARLOCK) enable((*inhigh*) EN_S_AXI_HP3_ARLOCK);
        method arprot(S_AXI_HP3_ARPROT) enable((*inhigh*) EN_S_AXI_HP3_ARPROT);
        method arqos(S_AXI_HP3_ARQOS) enable((*inhigh*) EN_S_AXI_HP3_ARQOS);
        method S_AXI_HP3_ARREADY arready();
        method arsize(S_AXI_HP3_ARSIZE) enable((*inhigh*) EN_S_AXI_HP3_ARSIZE);
        method arvalid(S_AXI_HP3_ARVALID) enable((*inhigh*) EN_S_AXI_HP3_ARVALID);
        method awaddr(S_AXI_HP3_AWADDR) enable((*inhigh*) EN_S_AXI_HP3_AWADDR);
        method awburst(S_AXI_HP3_AWBURST) enable((*inhigh*) EN_S_AXI_HP3_AWBURST);
        method awcache(S_AXI_HP3_AWCACHE) enable((*inhigh*) EN_S_AXI_HP3_AWCACHE);
        method awid(S_AXI_HP3_AWID) enable((*inhigh*) EN_S_AXI_HP3_AWID);
        method awlen(S_AXI_HP3_AWLEN) enable((*inhigh*) EN_S_AXI_HP3_AWLEN);
        method awlock(S_AXI_HP3_AWLOCK) enable((*inhigh*) EN_S_AXI_HP3_AWLOCK);
        method awprot(S_AXI_HP3_AWPROT) enable((*inhigh*) EN_S_AXI_HP3_AWPROT);
        method awqos(S_AXI_HP3_AWQOS) enable((*inhigh*) EN_S_AXI_HP3_AWQOS);
        method S_AXI_HP3_AWREADY awready();
        method awsize(S_AXI_HP3_AWSIZE) enable((*inhigh*) EN_S_AXI_HP3_AWSIZE);
        method awvalid(S_AXI_HP3_AWVALID) enable((*inhigh*) EN_S_AXI_HP3_AWVALID);
        method S_AXI_HP3_BID bid();
        method bready(S_AXI_HP3_BREADY) enable((*inhigh*) EN_S_AXI_HP3_BREADY);
        method S_AXI_HP3_BRESP bresp();
        method S_AXI_HP3_BVALID bvalid();
        method S_AXI_HP3_RACOUNT racount();
        method S_AXI_HP3_RCOUNT rcount();
        method S_AXI_HP3_RDATA rdata();
        method rdissuecap1_en(S_AXI_HP3_RDISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP3_RDISSUECAP1_EN);
        method S_AXI_HP3_RID rid();
        method S_AXI_HP3_RLAST rlast();
        method rready(S_AXI_HP3_RREADY) enable((*inhigh*) EN_S_AXI_HP3_RREADY);
        method S_AXI_HP3_RRESP rresp();
        method S_AXI_HP3_RVALID rvalid();
        method S_AXI_HP3_WACOUNT wacount();
        method S_AXI_HP3_WCOUNT wcount();
        method wdata(S_AXI_HP3_WDATA) enable((*inhigh*) EN_S_AXI_HP3_WDATA);
        method wid(S_AXI_HP3_WID) enable((*inhigh*) EN_S_AXI_HP3_WID);
        method wlast(S_AXI_HP3_WLAST) enable((*inhigh*) EN_S_AXI_HP3_WLAST);
        method S_AXI_HP3_WREADY wready();
        method wrissuecap1_en(S_AXI_HP3_WRISSUECAP1_EN) enable((*inhigh*) EN_S_AXI_HP3_WRISSUECAP1_EN);
        method wstrb(S_AXI_HP3_WSTRB) enable((*inhigh*) EN_S_AXI_HP3_WSTRB);
        method wvalid(S_AXI_HP3_WVALID) enable((*inhigh*) EN_S_AXI_HP3_WVALID);
    endinterface
    interface Pps7Trace     trace;
        method clk(TRACE_CLK) enable((*inhigh*) EN_TRACE_CLK);
        method TRACE_CTL ctl();
        method TRACE_DATA data();
    endinterface
    interface Pps7Ttc     ttc0;
        method clk0_in(TTC0_CLK0_IN) enable((*inhigh*) EN_TTC0_CLK0_IN);
        method clk1_in(TTC0_CLK1_IN) enable((*inhigh*) EN_TTC0_CLK1_IN);
        method clk2_in(TTC0_CLK2_IN) enable((*inhigh*) EN_TTC0_CLK2_IN);
        method TTC0_WAVE0_OUT wave0_out();
        method TTC0_WAVE1_OUT wave1_out();
        method TTC0_WAVE2_OUT wave2_out();
    endinterface
    interface Pps7Ttc     ttc1;
        method clk0_in(TTC1_CLK0_IN) enable((*inhigh*) EN_TTC1_CLK0_IN);
        method clk1_in(TTC1_CLK1_IN) enable((*inhigh*) EN_TTC1_CLK1_IN);
        method clk2_in(TTC1_CLK2_IN) enable((*inhigh*) EN_TTC1_CLK2_IN);
        method TTC1_WAVE0_OUT wave0_out();
        method TTC1_WAVE1_OUT wave1_out();
        method TTC1_WAVE2_OUT wave2_out();
    endinterface
    interface Pps7Uart     uart0;
        method ctsn(UART0_CTSN) enable((*inhigh*) EN_UART0_CTSN);
        method dcdn(UART0_DCDN) enable((*inhigh*) EN_UART0_DCDN);
        method dsrn(UART0_DSRN) enable((*inhigh*) EN_UART0_DSRN);
        method UART0_DTRN dtrn();
        method rin(UART0_RIN) enable((*inhigh*) EN_UART0_RIN);
        method UART0_RTSN rtsn();
        method rx(UART0_RX) enable((*inhigh*) EN_UART0_RX);
        method UART0_TX tx();
    endinterface
    interface Pps7Uart     uart1;
        method ctsn(UART1_CTSN) enable((*inhigh*) EN_UART1_CTSN);
        method dcdn(UART1_DCDN) enable((*inhigh*) EN_UART1_DCDN);
        method dsrn(UART1_DSRN) enable((*inhigh*) EN_UART1_DSRN);
        method UART1_DTRN dtrn();
        method rin(UART1_RIN) enable((*inhigh*) EN_UART1_RIN);
        method UART1_RTSN rtsn();
        method rx(UART1_RX) enable((*inhigh*) EN_UART1_RX);
        method UART1_TX tx();
    endinterface
    interface Pps7Usb     usb0;
        method USB0_PORT_INDCTL port_indctl();
        method vbus_pwrfault(USB0_VBUS_PWRFAULT) enable((*inhigh*) EN_USB0_VBUS_PWRFAULT);
        method USB0_VBUS_PWRSELECT vbus_pwrselect();
    endinterface
    interface Pps7Usb     usb1;
        method USB1_PORT_INDCTL port_indctl();
        method vbus_pwrfault(USB1_VBUS_PWRFAULT) enable((*inhigh*) EN_USB1_VBUS_PWRFAULT);
        method USB1_VBUS_PWRSELECT vbus_pwrselect();
    endinterface
    interface Pps7Wdt     wdt;
        method clk_in(WDT_CLK_IN) enable((*inhigh*) EN_WDT_CLK_IN);
        method WDT_RST_OUT rst_out();
    endinterface
    schedule (can0.phy_rx, can0.phy_tx, can1.phy_rx, can1.phy_tx, core0.nfiq, core0.nirq, core1.nfiq, core1.nirq, ddr.arb, dma0.aclk, dma0.daready, dma0.datype, dma0.davalid, dma0.drlast, dma0.drready, dma0.drtype, dma0.drvalid, dma0.rstn, dma1.aclk, dma1.daready, dma1.datype, dma1.davalid, dma1.drlast, dma1.drready, dma1.drtype, dma1.drvalid, dma1.rstn, dma2.aclk, dma2.daready, dma2.datype, dma2.davalid, dma2.drlast, dma2.drready, dma2.drtype, dma2.drvalid, dma2.rstn, dma3.aclk, dma3.daready, dma3.datype, dma3.davalid, dma3.drlast, dma3.drready, dma3.drtype, dma3.drvalid, dma3.rstn, enet0.ext_intin, enet0.gmii_col, enet0.gmii_crs, enet0.gmii_rxd, enet0.gmii_rx_clk, enet0.gmii_rx_dv, enet0.gmii_rx_er, enet0.gmii_txd, enet0.gmii_tx_clk, enet0.gmii_tx_en, enet0.gmii_tx_er, enet0.mdio_i, enet0.mdio_mdc, enet0.mdio_o, enet0.mdio_t, enet0.ptp_delay_req_rx, enet0.ptp_delay_req_tx, enet0.ptp_pdelay_req_rx, enet0.ptp_pdelay_req_tx, enet0.ptp_pdelay_resp_rx, enet0.ptp_pdelay_resp_tx, enet0.ptp_sync_frame_rx, enet0.ptp_sync_frame_tx, enet0.sof_rx, enet0.sof_tx, enet1.ext_intin, enet1.gmii_col, enet1.gmii_crs, enet1.gmii_rxd, enet1.gmii_rx_clk, enet1.gmii_rx_dv, enet1.gmii_rx_er, enet1.gmii_txd, enet1.gmii_tx_clk, enet1.gmii_tx_en, enet1.gmii_tx_er, enet1.mdio_i, enet1.mdio_mdc, enet1.mdio_o, enet1.mdio_t, enet1.ptp_delay_req_rx, enet1.ptp_delay_req_tx, enet1.ptp_pdelay_req_rx, enet1.ptp_pdelay_req_tx, enet1.ptp_pdelay_resp_rx, enet1.ptp_pdelay_resp_tx, enet1.ptp_sync_frame_rx, enet1.ptp_sync_frame_tx, enet1.sof_rx, enet1.sof_tx, event_.eventi, event_.evento, event_.standbywfe, event_.standbywfi, fclk.clk1, fclk.clk2, fclk.clk3, fclk_clktrig0.n, fclk_clktrig1.n, fclk_clktrig2.n, fclk_clktrig3.n, fclk_reset0.n, fclk_reset1.n, fclk_reset2.n, fclk_reset3.n, fpga.idle_n, ftmd.tracein_atid, ftmd.tracein_clk, ftmd.tracein_data, ftmd.tracein_valid, ftmt.f2p_debug, ftmt.f2p_trig, ftmt.f2p_trigack, ftmt.p2f_debug, ftmt.p2f_trig, ftmt.p2f_trigack, gpio.i, gpio.o, gpio.t, i2c0.scl_i, i2c0.scl_o, i2c0.scl_t, i2c0.sda_i, i2c0.sda_o, i2c0.sda_t, i2c1.scl_i, i2c1.scl_o, i2c1.scl_t, i2c1.sda_i, i2c1.sda_o, i2c1.sda_t, irq.f2p, irq.p2f_can0, irq.p2f_can1, irq.p2f_cti, irq.p2f_dmac0, irq.p2f_dmac1, irq.p2f_dmac2, irq.p2f_dmac3, irq.p2f_dmac4, irq.p2f_dmac5, irq.p2f_dmac6, irq.p2f_dmac7, irq.p2f_dmac_abort, irq.p2f_enet0, irq.p2f_enet1, irq.p2f_enet_wake0, irq.p2f_enet_wake1, irq.p2f_gpio, irq.p2f_i2c0, irq.p2f_i2c1, irq.p2f_qspi, irq.p2f_sdio0, irq.p2f_sdio1, irq.p2f_smc, irq.p2f_spi0, irq.p2f_spi1, irq.p2f_uart0, irq.p2f_uart1, irq.p2f_usb0, irq.p2f_usb1, m_axi_gp0.araddr, m_axi_gp0.arburst, m_axi_gp0.arcache, m_axi_gp0.aresetn, m_axi_gp0.arid, m_axi_gp0.arlen, m_axi_gp0.arlock, m_axi_gp0.arprot, m_axi_gp0.arqos, m_axi_gp0.arready, m_axi_gp0.arsize, m_axi_gp0.arvalid, m_axi_gp0.awaddr, m_axi_gp0.awburst, m_axi_gp0.awcache, m_axi_gp0.awid, m_axi_gp0.awlen, m_axi_gp0.awlock, m_axi_gp0.awprot, m_axi_gp0.awqos, m_axi_gp0.awready, m_axi_gp0.awsize, m_axi_gp0.awvalid, m_axi_gp0.bid, m_axi_gp0.bready, m_axi_gp0.bresp, m_axi_gp0.bvalid, m_axi_gp0.rdata, m_axi_gp0.rid, m_axi_gp0.rlast, m_axi_gp0.rready, m_axi_gp0.rresp, m_axi_gp0.rvalid, m_axi_gp0.wdata, m_axi_gp0.wid, m_axi_gp0.wlast, m_axi_gp0.wready, m_axi_gp0.wstrb, m_axi_gp0.wvalid, m_axi_gp1.araddr, m_axi_gp1.arburst, m_axi_gp1.arcache, m_axi_gp1.aresetn, m_axi_gp1.arid, m_axi_gp1.arlen, m_axi_gp1.arlock, m_axi_gp1.arprot, m_axi_gp1.arqos, m_axi_gp1.arready, m_axi_gp1.arsize, m_axi_gp1.arvalid, m_axi_gp1.awaddr, m_axi_gp1.awburst, m_axi_gp1.awcache, m_axi_gp1.awid, m_axi_gp1.awlen, m_axi_gp1.awlock, m_axi_gp1.awprot, m_axi_gp1.awqos, m_axi_gp1.awready, m_axi_gp1.awsize, m_axi_gp1.awvalid, m_axi_gp1.bid, m_axi_gp1.bready, m_axi_gp1.bresp, m_axi_gp1.bvalid, m_axi_gp1.rdata, m_axi_gp1.rid, m_axi_gp1.rlast, m_axi_gp1.rready, m_axi_gp1.rresp, m_axi_gp1.rvalid, m_axi_gp1.wdata, m_axi_gp1.wid, m_axi_gp1.wlast, m_axi_gp1.wready, m_axi_gp1.wstrb, m_axi_gp1.wvalid, pjtag.tck, pjtag.td_i, pjtag.td_o, pjtag.td_t, pjtag.tms, sdio0.buspow, sdio0.busvolt, sdio0.cdn, sdio0.clk, sdio0.clk_fb, sdio0.cmd_i, sdio0.cmd_o, sdio0.cmd_t, sdio0.data_i, sdio0.data_o, sdio0.data_t, sdio0.led, sdio0.wp, sdio1.buspow, sdio1.busvolt, sdio1.cdn, sdio1.clk, sdio1.clk_fb, sdio1.cmd_i, sdio1.cmd_o, sdio1.cmd_t, sdio1.data_i, sdio1.data_o, sdio1.data_t, sdio1.led, sdio1.wp, spi0.miso_i, spi0.miso_o, spi0.miso_t, spi0.mosi_i, spi0.mosi_o, spi0.mosi_t, spi0.sclk_i, spi0.sclk_o, spi0.sclk_t, spi0.ss1_o, spi0.ss2_o, spi0.ss_i, spi0.ss_o, spi0.ss_t, spi1.miso_i, spi1.miso_o, spi1.miso_t, spi1.mosi_i, spi1.mosi_o, spi1.mosi_t, spi1.sclk_i, spi1.sclk_o, spi1.sclk_t, spi1.ss1_o, spi1.ss2_o, spi1.ss_i, spi1.ss_o, spi1.ss_t, sram.intin, s_axi_acp.aclk, s_axi_acp.araddr, s_axi_acp.arburst, s_axi_acp.arcache, s_axi_acp.aresetn, s_axi_acp.arid, s_axi_acp.arlen, s_axi_acp.arlock, s_axi_acp.arprot, s_axi_acp.arqos, s_axi_acp.arready, s_axi_acp.arsize, s_axi_acp.aruser, s_axi_acp.arvalid, s_axi_acp.awaddr, s_axi_acp.awburst, s_axi_acp.awcache, s_axi_acp.awid, s_axi_acp.awlen, s_axi_acp.awlock, s_axi_acp.awprot, s_axi_acp.awqos, s_axi_acp.awready, s_axi_acp.awsize, s_axi_acp.awuser, s_axi_acp.awvalid, s_axi_acp.bid, s_axi_acp.bready, s_axi_acp.bresp, s_axi_acp.bvalid, s_axi_acp.rdata, s_axi_acp.rid, s_axi_acp.rlast, s_axi_acp.rready, s_axi_acp.rresp, s_axi_acp.rvalid, s_axi_acp.wdata, s_axi_acp.wid, s_axi_acp.wlast, s_axi_acp.wready, s_axi_acp.wstrb, s_axi_acp.wvalid, s_axi_gp0.aclk, s_axi_gp0.araddr, s_axi_gp0.arburst, s_axi_gp0.arcache, s_axi_gp0.aresetn, s_axi_gp0.arid, s_axi_gp0.arlen, s_axi_gp0.arlock, s_axi_gp0.arprot, s_axi_gp0.arqos, s_axi_gp0.arready, s_axi_gp0.arsize, s_axi_gp0.arvalid, s_axi_gp0.awaddr, s_axi_gp0.awburst, s_axi_gp0.awcache, s_axi_gp0.awid, s_axi_gp0.awlen, s_axi_gp0.awlock, s_axi_gp0.awprot, s_axi_gp0.awqos, s_axi_gp0.awready, s_axi_gp0.awsize, s_axi_gp0.awvalid, s_axi_gp0.bid, s_axi_gp0.bready, s_axi_gp0.bresp, s_axi_gp0.bvalid, s_axi_gp0.rdata, s_axi_gp0.rid, s_axi_gp0.rlast, s_axi_gp0.rready, s_axi_gp0.rresp, s_axi_gp0.rvalid, s_axi_gp0.wdata, s_axi_gp0.wid, s_axi_gp0.wlast, s_axi_gp0.wready, s_axi_gp0.wstrb, s_axi_gp0.wvalid, s_axi_gp1.aclk, s_axi_gp1.araddr, s_axi_gp1.arburst, s_axi_gp1.arcache, s_axi_gp1.aresetn, s_axi_gp1.arid, s_axi_gp1.arlen, s_axi_gp1.arlock, s_axi_gp1.arprot, s_axi_gp1.arqos, s_axi_gp1.arready, s_axi_gp1.arsize, s_axi_gp1.arvalid, s_axi_gp1.awaddr, s_axi_gp1.awburst, s_axi_gp1.awcache, s_axi_gp1.awid, s_axi_gp1.awlen, s_axi_gp1.awlock, s_axi_gp1.awprot, s_axi_gp1.awqos, s_axi_gp1.awready, s_axi_gp1.awsize, s_axi_gp1.awvalid, s_axi_gp1.bid, s_axi_gp1.bready, s_axi_gp1.bresp, s_axi_gp1.bvalid, s_axi_gp1.rdata, s_axi_gp1.rid, s_axi_gp1.rlast, s_axi_gp1.rready, s_axi_gp1.rresp, s_axi_gp1.rvalid, s_axi_gp1.wdata, s_axi_gp1.wid, s_axi_gp1.wlast, s_axi_gp1.wready, s_axi_gp1.wstrb, s_axi_gp1.wvalid, s_axi_hp0.aclk, s_axi_hp0.araddr, s_axi_hp0.arburst, s_axi_hp0.arcache, s_axi_hp0.aresetn, s_axi_hp0.arid, s_axi_hp0.arlen, s_axi_hp0.arlock, s_axi_hp0.arprot, s_axi_hp0.arqos, s_axi_hp0.arready, s_axi_hp0.arsize, s_axi_hp0.arvalid, s_axi_hp0.awaddr, s_axi_hp0.awburst, s_axi_hp0.awcache, s_axi_hp0.awid, s_axi_hp0.awlen, s_axi_hp0.awlock, s_axi_hp0.awprot, s_axi_hp0.awqos, s_axi_hp0.awready, s_axi_hp0.awsize, s_axi_hp0.awvalid, s_axi_hp0.bid, s_axi_hp0.bready, s_axi_hp0.bresp, s_axi_hp0.bvalid, s_axi_hp0.racount, s_axi_hp0.rcount, s_axi_hp0.rdata, s_axi_hp0.rdissuecap1_en, s_axi_hp0.rid, s_axi_hp0.rlast, s_axi_hp0.rready, s_axi_hp0.rresp, s_axi_hp0.rvalid, s_axi_hp0.wacount, s_axi_hp0.wcount, s_axi_hp0.wdata, s_axi_hp0.wid, s_axi_hp0.wlast, s_axi_hp0.wready, s_axi_hp0.wrissuecap1_en, s_axi_hp0.wstrb, s_axi_hp0.wvalid, s_axi_hp1.aclk, s_axi_hp1.araddr, s_axi_hp1.arburst, s_axi_hp1.arcache, s_axi_hp1.aresetn, s_axi_hp1.arid, s_axi_hp1.arlen, s_axi_hp1.arlock, s_axi_hp1.arprot, s_axi_hp1.arqos, s_axi_hp1.arready, s_axi_hp1.arsize, s_axi_hp1.arvalid, s_axi_hp1.awaddr, s_axi_hp1.awburst, s_axi_hp1.awcache, s_axi_hp1.awid, s_axi_hp1.awlen, s_axi_hp1.awlock, s_axi_hp1.awprot, s_axi_hp1.awqos, s_axi_hp1.awready, s_axi_hp1.awsize, s_axi_hp1.awvalid, s_axi_hp1.bid, s_axi_hp1.bready, s_axi_hp1.bresp, s_axi_hp1.bvalid, s_axi_hp1.racount, s_axi_hp1.rcount, s_axi_hp1.rdata, s_axi_hp1.rdissuecap1_en, s_axi_hp1.rid, s_axi_hp1.rlast, s_axi_hp1.rready, s_axi_hp1.rresp, s_axi_hp1.rvalid, s_axi_hp1.wacount, s_axi_hp1.wcount, s_axi_hp1.wdata, s_axi_hp1.wid, s_axi_hp1.wlast, s_axi_hp1.wready, s_axi_hp1.wrissuecap1_en, s_axi_hp1.wstrb, s_axi_hp1.wvalid, s_axi_hp2.aclk, s_axi_hp2.araddr, s_axi_hp2.arburst, s_axi_hp2.arcache, s_axi_hp2.aresetn, s_axi_hp2.arid, s_axi_hp2.arlen, s_axi_hp2.arlock, s_axi_hp2.arprot, s_axi_hp2.arqos, s_axi_hp2.arready, s_axi_hp2.arsize, s_axi_hp2.arvalid, s_axi_hp2.awaddr, s_axi_hp2.awburst, s_axi_hp2.awcache, s_axi_hp2.awid, s_axi_hp2.awlen, s_axi_hp2.awlock, s_axi_hp2.awprot, s_axi_hp2.awqos, s_axi_hp2.awready, s_axi_hp2.awsize, s_axi_hp2.awvalid, s_axi_hp2.bid, s_axi_hp2.bready, s_axi_hp2.bresp, s_axi_hp2.bvalid, s_axi_hp2.racount, s_axi_hp2.rcount, s_axi_hp2.rdata, s_axi_hp2.rdissuecap1_en, s_axi_hp2.rid, s_axi_hp2.rlast, s_axi_hp2.rready, s_axi_hp2.rresp, s_axi_hp2.rvalid, s_axi_hp2.wacount, s_axi_hp2.wcount, s_axi_hp2.wdata, s_axi_hp2.wid, s_axi_hp2.wlast, s_axi_hp2.wready, s_axi_hp2.wrissuecap1_en, s_axi_hp2.wstrb, s_axi_hp2.wvalid, s_axi_hp3.aclk, s_axi_hp3.araddr, s_axi_hp3.arburst, s_axi_hp3.arcache, s_axi_hp3.aresetn, s_axi_hp3.arid, s_axi_hp3.arlen, s_axi_hp3.arlock, s_axi_hp3.arprot, s_axi_hp3.arqos, s_axi_hp3.arready, s_axi_hp3.arsize, s_axi_hp3.arvalid, s_axi_hp3.awaddr, s_axi_hp3.awburst, s_axi_hp3.awcache, s_axi_hp3.awid, s_axi_hp3.awlen, s_axi_hp3.awlock, s_axi_hp3.awprot, s_axi_hp3.awqos, s_axi_hp3.awready, s_axi_hp3.awsize, s_axi_hp3.awvalid, s_axi_hp3.bid, s_axi_hp3.bready, s_axi_hp3.bresp, s_axi_hp3.bvalid, s_axi_hp3.racount, s_axi_hp3.rcount, s_axi_hp3.rdata, s_axi_hp3.rdissuecap1_en, s_axi_hp3.rid, s_axi_hp3.rlast, s_axi_hp3.rready, s_axi_hp3.rresp, s_axi_hp3.rvalid, s_axi_hp3.wacount, s_axi_hp3.wcount, s_axi_hp3.wdata, s_axi_hp3.wid, s_axi_hp3.wlast, s_axi_hp3.wready, s_axi_hp3.wrissuecap1_en, s_axi_hp3.wstrb, s_axi_hp3.wvalid, trace.clk, trace.ctl, trace.data, ttc0.clk0_in, ttc0.clk1_in, ttc0.clk2_in, ttc0.wave0_out, ttc0.wave1_out, ttc0.wave2_out, ttc1.clk0_in, ttc1.clk1_in, ttc1.clk2_in, ttc1.wave0_out, ttc1.wave1_out, ttc1.wave2_out, uart0.ctsn, uart0.dcdn, uart0.dsrn, uart0.dtrn, uart0.rin, uart0.rtsn, uart0.rx, uart0.tx, uart1.ctsn, uart1.dcdn, uart1.dsrn, uart1.dtrn, uart1.rin, uart1.rtsn, uart1.rx, uart1.tx, usb0.port_indctl, usb0.vbus_pwrfault, usb0.vbus_pwrselect, usb1.port_indctl, usb1.vbus_pwrfault, usb1.vbus_pwrselect, wdt.clk_in, wdt.rst_out) CF (can0.phy_rx, can0.phy_tx, can1.phy_rx, can1.phy_tx, core0.nfiq, core0.nirq, core1.nfiq, core1.nirq, ddr.arb, dma0.aclk, dma0.daready, dma0.datype, dma0.davalid, dma0.drlast, dma0.drready, dma0.drtype, dma0.drvalid, dma0.rstn, dma1.aclk, dma1.daready, dma1.datype, dma1.davalid, dma1.drlast, dma1.drready, dma1.drtype, dma1.drvalid, dma1.rstn, dma2.aclk, dma2.daready, dma2.datype, dma2.davalid, dma2.drlast, dma2.drready, dma2.drtype, dma2.drvalid, dma2.rstn, dma3.aclk, dma3.daready, dma3.datype, dma3.davalid, dma3.drlast, dma3.drready, dma3.drtype, dma3.drvalid, dma3.rstn, enet0.ext_intin, enet0.gmii_col, enet0.gmii_crs, enet0.gmii_rxd, enet0.gmii_rx_clk, enet0.gmii_rx_dv, enet0.gmii_rx_er, enet0.gmii_txd, enet0.gmii_tx_clk, enet0.gmii_tx_en, enet0.gmii_tx_er, enet0.mdio_i, enet0.mdio_mdc, enet0.mdio_o, enet0.mdio_t, enet0.ptp_delay_req_rx, enet0.ptp_delay_req_tx, enet0.ptp_pdelay_req_rx, enet0.ptp_pdelay_req_tx, enet0.ptp_pdelay_resp_rx, enet0.ptp_pdelay_resp_tx, enet0.ptp_sync_frame_rx, enet0.ptp_sync_frame_tx, enet0.sof_rx, enet0.sof_tx, enet1.ext_intin, enet1.gmii_col, enet1.gmii_crs, enet1.gmii_rxd, enet1.gmii_rx_clk, enet1.gmii_rx_dv, enet1.gmii_rx_er, enet1.gmii_txd, enet1.gmii_tx_clk, enet1.gmii_tx_en, enet1.gmii_tx_er, enet1.mdio_i, enet1.mdio_mdc, enet1.mdio_o, enet1.mdio_t, enet1.ptp_delay_req_rx, enet1.ptp_delay_req_tx, enet1.ptp_pdelay_req_rx, enet1.ptp_pdelay_req_tx, enet1.ptp_pdelay_resp_rx, enet1.ptp_pdelay_resp_tx, enet1.ptp_sync_frame_rx, enet1.ptp_sync_frame_tx, enet1.sof_rx, enet1.sof_tx, event_.eventi, event_.evento, event_.standbywfe, event_.standbywfi, fclk.clk1, fclk.clk2, fclk.clk3, fclk_clktrig0.n, fclk_clktrig1.n, fclk_clktrig2.n, fclk_clktrig3.n, fclk_reset0.n, fclk_reset1.n, fclk_reset2.n, fclk_reset3.n, fpga.idle_n, ftmd.tracein_atid, ftmd.tracein_clk, ftmd.tracein_data, ftmd.tracein_valid, ftmt.f2p_debug, ftmt.f2p_trig, ftmt.f2p_trigack, ftmt.p2f_debug, ftmt.p2f_trig, ftmt.p2f_trigack, gpio.i, gpio.o, gpio.t, i2c0.scl_i, i2c0.scl_o, i2c0.scl_t, i2c0.sda_i, i2c0.sda_o, i2c0.sda_t, i2c1.scl_i, i2c1.scl_o, i2c1.scl_t, i2c1.sda_i, i2c1.sda_o, i2c1.sda_t, irq.f2p, irq.p2f_can0, irq.p2f_can1, irq.p2f_cti, irq.p2f_dmac0, irq.p2f_dmac1, irq.p2f_dmac2, irq.p2f_dmac3, irq.p2f_dmac4, irq.p2f_dmac5, irq.p2f_dmac6, irq.p2f_dmac7, irq.p2f_dmac_abort, irq.p2f_enet0, irq.p2f_enet1, irq.p2f_enet_wake0, irq.p2f_enet_wake1, irq.p2f_gpio, irq.p2f_i2c0, irq.p2f_i2c1, irq.p2f_qspi, irq.p2f_sdio0, irq.p2f_sdio1, irq.p2f_smc, irq.p2f_spi0, irq.p2f_spi1, irq.p2f_uart0, irq.p2f_uart1, irq.p2f_usb0, irq.p2f_usb1, m_axi_gp0.araddr, m_axi_gp0.arburst, m_axi_gp0.arcache, m_axi_gp0.aresetn, m_axi_gp0.arid, m_axi_gp0.arlen, m_axi_gp0.arlock, m_axi_gp0.arprot, m_axi_gp0.arqos, m_axi_gp0.arready, m_axi_gp0.arsize, m_axi_gp0.arvalid, m_axi_gp0.awaddr, m_axi_gp0.awburst, m_axi_gp0.awcache, m_axi_gp0.awid, m_axi_gp0.awlen, m_axi_gp0.awlock, m_axi_gp0.awprot, m_axi_gp0.awqos, m_axi_gp0.awready, m_axi_gp0.awsize, m_axi_gp0.awvalid, m_axi_gp0.bid, m_axi_gp0.bready, m_axi_gp0.bresp, m_axi_gp0.bvalid, m_axi_gp0.rdata, m_axi_gp0.rid, m_axi_gp0.rlast, m_axi_gp0.rready, m_axi_gp0.rresp, m_axi_gp0.rvalid, m_axi_gp0.wdata, m_axi_gp0.wid, m_axi_gp0.wlast, m_axi_gp0.wready, m_axi_gp0.wstrb, m_axi_gp0.wvalid, m_axi_gp1.araddr, m_axi_gp1.arburst, m_axi_gp1.arcache, m_axi_gp1.aresetn, m_axi_gp1.arid, m_axi_gp1.arlen, m_axi_gp1.arlock, m_axi_gp1.arprot, m_axi_gp1.arqos, m_axi_gp1.arready, m_axi_gp1.arsize, m_axi_gp1.arvalid, m_axi_gp1.awaddr, m_axi_gp1.awburst, m_axi_gp1.awcache, m_axi_gp1.awid, m_axi_gp1.awlen, m_axi_gp1.awlock, m_axi_gp1.awprot, m_axi_gp1.awqos, m_axi_gp1.awready, m_axi_gp1.awsize, m_axi_gp1.awvalid, m_axi_gp1.bid, m_axi_gp1.bready, m_axi_gp1.bresp, m_axi_gp1.bvalid, m_axi_gp1.rdata, m_axi_gp1.rid, m_axi_gp1.rlast, m_axi_gp1.rready, m_axi_gp1.rresp, m_axi_gp1.rvalid, m_axi_gp1.wdata, m_axi_gp1.wid, m_axi_gp1.wlast, m_axi_gp1.wready, m_axi_gp1.wstrb, m_axi_gp1.wvalid, pjtag.tck, pjtag.td_i, pjtag.td_o, pjtag.td_t, pjtag.tms, sdio0.buspow, sdio0.busvolt, sdio0.cdn, sdio0.clk, sdio0.clk_fb, sdio0.cmd_i, sdio0.cmd_o, sdio0.cmd_t, sdio0.data_i, sdio0.data_o, sdio0.data_t, sdio0.led, sdio0.wp, sdio1.buspow, sdio1.busvolt, sdio1.cdn, sdio1.clk, sdio1.clk_fb, sdio1.cmd_i, sdio1.cmd_o, sdio1.cmd_t, sdio1.data_i, sdio1.data_o, sdio1.data_t, sdio1.led, sdio1.wp, spi0.miso_i, spi0.miso_o, spi0.miso_t, spi0.mosi_i, spi0.mosi_o, spi0.mosi_t, spi0.sclk_i, spi0.sclk_o, spi0.sclk_t, spi0.ss1_o, spi0.ss2_o, spi0.ss_i, spi0.ss_o, spi0.ss_t, spi1.miso_i, spi1.miso_o, spi1.miso_t, spi1.mosi_i, spi1.mosi_o, spi1.mosi_t, spi1.sclk_i, spi1.sclk_o, spi1.sclk_t, spi1.ss1_o, spi1.ss2_o, spi1.ss_i, spi1.ss_o, spi1.ss_t, sram.intin, s_axi_acp.aclk, s_axi_acp.araddr, s_axi_acp.arburst, s_axi_acp.arcache, s_axi_acp.aresetn, s_axi_acp.arid, s_axi_acp.arlen, s_axi_acp.arlock, s_axi_acp.arprot, s_axi_acp.arqos, s_axi_acp.arready, s_axi_acp.arsize, s_axi_acp.aruser, s_axi_acp.arvalid, s_axi_acp.awaddr, s_axi_acp.awburst, s_axi_acp.awcache, s_axi_acp.awid, s_axi_acp.awlen, s_axi_acp.awlock, s_axi_acp.awprot, s_axi_acp.awqos, s_axi_acp.awready, s_axi_acp.awsize, s_axi_acp.awuser, s_axi_acp.awvalid, s_axi_acp.bid, s_axi_acp.bready, s_axi_acp.bresp, s_axi_acp.bvalid, s_axi_acp.rdata, s_axi_acp.rid, s_axi_acp.rlast, s_axi_acp.rready, s_axi_acp.rresp, s_axi_acp.rvalid, s_axi_acp.wdata, s_axi_acp.wid, s_axi_acp.wlast, s_axi_acp.wready, s_axi_acp.wstrb, s_axi_acp.wvalid, s_axi_gp0.aclk, s_axi_gp0.araddr, s_axi_gp0.arburst, s_axi_gp0.arcache, s_axi_gp0.aresetn, s_axi_gp0.arid, s_axi_gp0.arlen, s_axi_gp0.arlock, s_axi_gp0.arprot, s_axi_gp0.arqos, s_axi_gp0.arready, s_axi_gp0.arsize, s_axi_gp0.arvalid, s_axi_gp0.awaddr, s_axi_gp0.awburst, s_axi_gp0.awcache, s_axi_gp0.awid, s_axi_gp0.awlen, s_axi_gp0.awlock, s_axi_gp0.awprot, s_axi_gp0.awqos, s_axi_gp0.awready, s_axi_gp0.awsize, s_axi_gp0.awvalid, s_axi_gp0.bid, s_axi_gp0.bready, s_axi_gp0.bresp, s_axi_gp0.bvalid, s_axi_gp0.rdata, s_axi_gp0.rid, s_axi_gp0.rlast, s_axi_gp0.rready, s_axi_gp0.rresp, s_axi_gp0.rvalid, s_axi_gp0.wdata, s_axi_gp0.wid, s_axi_gp0.wlast, s_axi_gp0.wready, s_axi_gp0.wstrb, s_axi_gp0.wvalid, s_axi_gp1.aclk, s_axi_gp1.araddr, s_axi_gp1.arburst, s_axi_gp1.arcache, s_axi_gp1.aresetn, s_axi_gp1.arid, s_axi_gp1.arlen, s_axi_gp1.arlock, s_axi_gp1.arprot, s_axi_gp1.arqos, s_axi_gp1.arready, s_axi_gp1.arsize, s_axi_gp1.arvalid, s_axi_gp1.awaddr, s_axi_gp1.awburst, s_axi_gp1.awcache, s_axi_gp1.awid, s_axi_gp1.awlen, s_axi_gp1.awlock, s_axi_gp1.awprot, s_axi_gp1.awqos, s_axi_gp1.awready, s_axi_gp1.awsize, s_axi_gp1.awvalid, s_axi_gp1.bid, s_axi_gp1.bready, s_axi_gp1.bresp, s_axi_gp1.bvalid, s_axi_gp1.rdata, s_axi_gp1.rid, s_axi_gp1.rlast, s_axi_gp1.rready, s_axi_gp1.rresp, s_axi_gp1.rvalid, s_axi_gp1.wdata, s_axi_gp1.wid, s_axi_gp1.wlast, s_axi_gp1.wready, s_axi_gp1.wstrb, s_axi_gp1.wvalid, s_axi_hp0.aclk, s_axi_hp0.araddr, s_axi_hp0.arburst, s_axi_hp0.arcache, s_axi_hp0.aresetn, s_axi_hp0.arid, s_axi_hp0.arlen, s_axi_hp0.arlock, s_axi_hp0.arprot, s_axi_hp0.arqos, s_axi_hp0.arready, s_axi_hp0.arsize, s_axi_hp0.arvalid, s_axi_hp0.awaddr, s_axi_hp0.awburst, s_axi_hp0.awcache, s_axi_hp0.awid, s_axi_hp0.awlen, s_axi_hp0.awlock, s_axi_hp0.awprot, s_axi_hp0.awqos, s_axi_hp0.awready, s_axi_hp0.awsize, s_axi_hp0.awvalid, s_axi_hp0.bid, s_axi_hp0.bready, s_axi_hp0.bresp, s_axi_hp0.bvalid, s_axi_hp0.racount, s_axi_hp0.rcount, s_axi_hp0.rdata, s_axi_hp0.rdissuecap1_en, s_axi_hp0.rid, s_axi_hp0.rlast, s_axi_hp0.rready, s_axi_hp0.rresp, s_axi_hp0.rvalid, s_axi_hp0.wacount, s_axi_hp0.wcount, s_axi_hp0.wdata, s_axi_hp0.wid, s_axi_hp0.wlast, s_axi_hp0.wready, s_axi_hp0.wrissuecap1_en, s_axi_hp0.wstrb, s_axi_hp0.wvalid, s_axi_hp1.aclk, s_axi_hp1.araddr, s_axi_hp1.arburst, s_axi_hp1.arcache, s_axi_hp1.aresetn, s_axi_hp1.arid, s_axi_hp1.arlen, s_axi_hp1.arlock, s_axi_hp1.arprot, s_axi_hp1.arqos, s_axi_hp1.arready, s_axi_hp1.arsize, s_axi_hp1.arvalid, s_axi_hp1.awaddr, s_axi_hp1.awburst, s_axi_hp1.awcache, s_axi_hp1.awid, s_axi_hp1.awlen, s_axi_hp1.awlock, s_axi_hp1.awprot, s_axi_hp1.awqos, s_axi_hp1.awready, s_axi_hp1.awsize, s_axi_hp1.awvalid, s_axi_hp1.bid, s_axi_hp1.bready, s_axi_hp1.bresp, s_axi_hp1.bvalid, s_axi_hp1.racount, s_axi_hp1.rcount, s_axi_hp1.rdata, s_axi_hp1.rdissuecap1_en, s_axi_hp1.rid, s_axi_hp1.rlast, s_axi_hp1.rready, s_axi_hp1.rresp, s_axi_hp1.rvalid, s_axi_hp1.wacount, s_axi_hp1.wcount, s_axi_hp1.wdata, s_axi_hp1.wid, s_axi_hp1.wlast, s_axi_hp1.wready, s_axi_hp1.wrissuecap1_en, s_axi_hp1.wstrb, s_axi_hp1.wvalid, s_axi_hp2.aclk, s_axi_hp2.araddr, s_axi_hp2.arburst, s_axi_hp2.arcache, s_axi_hp2.aresetn, s_axi_hp2.arid, s_axi_hp2.arlen, s_axi_hp2.arlock, s_axi_hp2.arprot, s_axi_hp2.arqos, s_axi_hp2.arready, s_axi_hp2.arsize, s_axi_hp2.arvalid, s_axi_hp2.awaddr, s_axi_hp2.awburst, s_axi_hp2.awcache, s_axi_hp2.awid, s_axi_hp2.awlen, s_axi_hp2.awlock, s_axi_hp2.awprot, s_axi_hp2.awqos, s_axi_hp2.awready, s_axi_hp2.awsize, s_axi_hp2.awvalid, s_axi_hp2.bid, s_axi_hp2.bready, s_axi_hp2.bresp, s_axi_hp2.bvalid, s_axi_hp2.racount, s_axi_hp2.rcount, s_axi_hp2.rdata, s_axi_hp2.rdissuecap1_en, s_axi_hp2.rid, s_axi_hp2.rlast, s_axi_hp2.rready, s_axi_hp2.rresp, s_axi_hp2.rvalid, s_axi_hp2.wacount, s_axi_hp2.wcount, s_axi_hp2.wdata, s_axi_hp2.wid, s_axi_hp2.wlast, s_axi_hp2.wready, s_axi_hp2.wrissuecap1_en, s_axi_hp2.wstrb, s_axi_hp2.wvalid, s_axi_hp3.aclk, s_axi_hp3.araddr, s_axi_hp3.arburst, s_axi_hp3.arcache, s_axi_hp3.aresetn, s_axi_hp3.arid, s_axi_hp3.arlen, s_axi_hp3.arlock, s_axi_hp3.arprot, s_axi_hp3.arqos, s_axi_hp3.arready, s_axi_hp3.arsize, s_axi_hp3.arvalid, s_axi_hp3.awaddr, s_axi_hp3.awburst, s_axi_hp3.awcache, s_axi_hp3.awid, s_axi_hp3.awlen, s_axi_hp3.awlock, s_axi_hp3.awprot, s_axi_hp3.awqos, s_axi_hp3.awready, s_axi_hp3.awsize, s_axi_hp3.awvalid, s_axi_hp3.bid, s_axi_hp3.bready, s_axi_hp3.bresp, s_axi_hp3.bvalid, s_axi_hp3.racount, s_axi_hp3.rcount, s_axi_hp3.rdata, s_axi_hp3.rdissuecap1_en, s_axi_hp3.rid, s_axi_hp3.rlast, s_axi_hp3.rready, s_axi_hp3.rresp, s_axi_hp3.rvalid, s_axi_hp3.wacount, s_axi_hp3.wcount, s_axi_hp3.wdata, s_axi_hp3.wid, s_axi_hp3.wlast, s_axi_hp3.wready, s_axi_hp3.wrissuecap1_en, s_axi_hp3.wstrb, s_axi_hp3.wvalid, trace.clk, trace.ctl, trace.data, ttc0.clk0_in, ttc0.clk1_in, ttc0.clk2_in, ttc0.wave0_out, ttc0.wave1_out, ttc0.wave2_out, ttc1.clk0_in, ttc1.clk1_in, ttc1.clk2_in, ttc1.wave0_out, ttc1.wave1_out, ttc1.wave2_out, uart0.ctsn, uart0.dcdn, uart0.dsrn, uart0.dtrn, uart0.rin, uart0.rtsn, uart0.rx, uart0.tx, uart1.ctsn, uart1.dcdn, uart1.dsrn, uart1.dtrn, uart1.rin, uart1.rtsn, uart1.rx, uart1.tx, usb0.port_indctl, usb0.vbus_pwrfault, usb0.vbus_pwrselect, usb1.port_indctl, usb1.vbus_pwrfault, usb1.vbus_pwrselect, wdt.clk_in, wdt.rst_out);
endmodule
