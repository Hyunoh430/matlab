-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_system_config\axi_lite_system_config_pcore.vhd
-- Created: 2014-03-09 13:27:11
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_system_config_pcore
-- Source Path: axi_lite_system_config_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_system_config_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        rx_clk                            :   IN    std_logic;  -- ufix1
        g_reset                           :   IN    std_logic;  -- ufix1
        tx_clk                            :   IN    std_logic;  -- ufix1
        AXI_Lite_ACLK                     :   IN    std_logic;  -- ufix1
        AXI_Lite_ARESETN                  :   IN    std_logic;  -- ufix1
        AXI_Lite_AWADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_AWVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_WDATA                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_WSTRB                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI_Lite_WVALID                   :   IN    std_logic;  -- ufix1
        AXI_Lite_BREADY                   :   IN    std_logic;  -- ufix1
        AXI_Lite_ARADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_ARVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_RREADY                   :   IN    std_logic;  -- ufix1
        i2c_reset                         :   OUT   std_logic;  -- ufix1
        rx_data_path_rst                  :   OUT   std_logic;  -- ufix1
        stream_enable_rx                  :   OUT   std_logic;  -- ufix1
        dec_select                        :   OUT   std_logic;  -- ufix1
        dec_by_pass                       :   OUT   std_logic;  -- ufix1
        dut_rx_by_pass                    :   OUT   std_logic;  -- ufix1
        int_select                        :   OUT   std_logic;  -- ufix1
        int_by_pass                       :   OUT   std_logic;  -- ufix1
        dut_tx_by_pass                    :   OUT   std_logic;  -- ufix1
        tx_data_path_rst                  :   OUT   std_logic;  -- ufix1
        stream_enable_tx                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic  -- ufix1
        );
END axi_lite_system_config_pcore;


ARCHITECTURE rtl OF axi_lite_system_config_pcore IS

  -- Component Declarations
  COMPONENT axi_lite_system_config_pcore_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI_Lite_ACLK                   :   IN    std_logic;  -- ufix1
          AXI_Lite_ARESETN                :   IN    std_logic;  -- ufix1
          AXI_Lite_AWADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_WDATA                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_WSTRB                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI_Lite_WVALID                 :   IN    std_logic;  -- ufix1
          AXI_Lite_BREADY                 :   IN    std_logic;  -- ufix1
          AXI_Lite_ARADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_ARVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_RREADY                 :   IN    std_logic;  -- ufix1
          read_rd_ver_reg                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo1_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo2_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo3_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo4_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo5_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo6_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo7_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_hwinfo8_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_rxstrmenb_reg           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_rx_data_src_path        :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          read_rd_txstrmenb_reg           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_tx_data_src_path        :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_wr_sysrst_reg             :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_wr_rxstrmenb_reg          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_rst_reg                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_rx_data_src_path       :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          write_wr_txstrmenb_reg          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_tx_data_src_path       :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT axi_lite_system_config_pcore_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          wr_rst_reg                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_rxstrmenb_reg                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          rx_clk                          :   IN    std_logic;  -- ufix1
          g_reset                         :   IN    std_logic;  -- ufix1
          wr_rx_data_src_path             :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          wr_sysrst_reg                   :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          tx_clk                          :   IN    std_logic;  -- ufix1
          wr_tx_data_src_path             :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          wr_txstrmenb_reg                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          axi_awaddr                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          axi_wvalid                      :   IN    std_logic;  -- ufix1
          axi_awvalid                     :   IN    std_logic;  -- ufix1
          axi_wdata                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_ver_reg                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo1_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo2_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo3_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo4_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo5_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo6_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo7_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_hwinfo8_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          i2c_reset                       :   OUT   std_logic;  -- ufix1
          rx_data_path_rst                :   OUT   std_logic;  -- ufix1
          stream_enable_rx                :   OUT   std_logic;  -- ufix1
          rd_rxstrmenb_reg                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_rx_data_src_path             :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          dec_select                      :   OUT   std_logic;  -- ufix1
          dec_by_pass                     :   OUT   std_logic;  -- ufix1
          dut_rx_by_pass                  :   OUT   std_logic;  -- ufix1
          int_select                      :   OUT   std_logic;  -- ufix1
          int_by_pass                     :   OUT   std_logic;  -- ufix1
          dut_tx_by_pass                  :   OUT   std_logic;  -- ufix1
          tx_data_path_rst                :   OUT   std_logic;  -- ufix1
          rd_tx_data_src_path             :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          rd_txstrmenb_reg                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          stream_enable_tx                :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_system_config_pcore_axi_lite
    USE ENTITY work.axi_lite_system_config_pcore_axi_lite(rtl);

  FOR ALL : axi_lite_system_config_pcore_dut
    USE ENTITY work.axi_lite_system_config_pcore_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL rd_ver_reg_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo1_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo2_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo3_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo4_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo5_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo6_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo7_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_hwinfo8_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_rxstrmenb_reg_sig             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_rx_data_src_path_sig          : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL rd_txstrmenb_reg_sig             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_tx_data_src_path_sig          : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL wr_sysrst_reg_sig                : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL wr_rxstrmenb_reg_sig             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL wr_rst_reg_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL wr_rx_data_src_path_sig          : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL wr_txstrmenb_reg_sig             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL wr_tx_data_src_path_sig          : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL i2c_reset_sig                    : std_logic;  -- ufix1
  SIGNAL rx_data_path_rst_sig             : std_logic;  -- ufix1
  SIGNAL stream_enable_rx_sig             : std_logic;  -- ufix1
  SIGNAL dec_select_sig                   : std_logic;  -- ufix1
  SIGNAL dec_by_pass_sig                  : std_logic;  -- ufix1
  SIGNAL dut_rx_by_pass_sig               : std_logic;  -- ufix1
  SIGNAL int_select_sig                   : std_logic;  -- ufix1
  SIGNAL int_by_pass_sig                  : std_logic;  -- ufix1
  SIGNAL dut_tx_by_pass_sig               : std_logic;  -- ufix1
  SIGNAL tx_data_path_rst_sig             : std_logic;  -- ufix1
  SIGNAL stream_enable_tx_sig             : std_logic;  -- ufix1

BEGIN
  u_axi_lite_system_config_pcore_axi_lite_inst : axi_lite_system_config_pcore_axi_lite
    PORT MAP( reset => reset,
              AXI_Lite_ACLK => AXI_Lite_ACLK,  -- ufix1
              AXI_Lite_ARESETN => AXI_Lite_ARESETN,  -- ufix1
              AXI_Lite_AWADDR => AXI_Lite_AWADDR,  -- ufix32
              AXI_Lite_AWVALID => AXI_Lite_AWVALID,  -- ufix1
              AXI_Lite_WDATA => AXI_Lite_WDATA,  -- ufix32
              AXI_Lite_WSTRB => AXI_Lite_WSTRB,  -- ufix4
              AXI_Lite_WVALID => AXI_Lite_WVALID,  -- ufix1
              AXI_Lite_BREADY => AXI_Lite_BREADY,  -- ufix1
              AXI_Lite_ARADDR => AXI_Lite_ARADDR,  -- ufix32
              AXI_Lite_ARVALID => AXI_Lite_ARVALID,  -- ufix1
              AXI_Lite_RREADY => AXI_Lite_RREADY,  -- ufix1
              read_rd_ver_reg => rd_ver_reg_sig,  -- ufix32
              read_rd_hwinfo1_reg => rd_hwinfo1_reg_sig,  -- ufix32
              read_rd_hwinfo2_reg => rd_hwinfo2_reg_sig,  -- ufix32
              read_rd_hwinfo3_reg => rd_hwinfo3_reg_sig,  -- ufix32
              read_rd_hwinfo4_reg => rd_hwinfo4_reg_sig,  -- ufix32
              read_rd_hwinfo5_reg => rd_hwinfo5_reg_sig,  -- ufix32
              read_rd_hwinfo6_reg => rd_hwinfo6_reg_sig,  -- ufix32
              read_rd_hwinfo7_reg => rd_hwinfo7_reg_sig,  -- ufix32
              read_rd_hwinfo8_reg => rd_hwinfo8_reg_sig,  -- ufix32
              read_rd_rxstrmenb_reg => rd_rxstrmenb_reg_sig,  -- ufix32
              read_rd_rx_data_src_path => rd_rx_data_src_path_sig,  -- ufix3
              read_rd_txstrmenb_reg => rd_txstrmenb_reg_sig,  -- ufix32
              read_rd_tx_data_src_path => rd_tx_data_src_path_sig,  -- ufix3
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              write_axi_enable => dut_enable,  -- ufix1
              write_wr_sysrst_reg => wr_sysrst_reg_sig,  -- ufix8
              write_wr_rxstrmenb_reg => wr_rxstrmenb_reg_sig,  -- ufix32
              write_wr_rst_reg => wr_rst_reg_sig,  -- ufix32
              write_wr_rx_data_src_path => wr_rx_data_src_path_sig,  -- ufix3
              write_wr_txstrmenb_reg => wr_txstrmenb_reg_sig,  -- ufix32
              write_wr_tx_data_src_path => wr_tx_data_src_path_sig,  -- ufix3
              reset_internal => reset_internal  -- ufix1
              );

  u_axi_lite_system_config_pcore_dut_inst : axi_lite_system_config_pcore_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              wr_rst_reg => wr_rst_reg_sig,  -- ufix32
              wr_rxstrmenb_reg => wr_rxstrmenb_reg_sig,  -- ufix32
              rx_clk => rx_clk,  -- ufix1
              g_reset => g_reset,  -- ufix1
              wr_rx_data_src_path => wr_rx_data_src_path_sig,  -- ufix3
              wr_sysrst_reg => wr_sysrst_reg_sig,  -- ufix8
              tx_clk => tx_clk,  -- ufix1
              wr_tx_data_src_path => wr_tx_data_src_path_sig,  -- ufix3
              wr_txstrmenb_reg => wr_txstrmenb_reg_sig,  -- ufix32
              axi_awaddr => AXI_Lite_AWADDR,  -- ufix32
              axi_wvalid => AXI_Lite_WVALID,  -- ufix1
              axi_awvalid => AXI_Lite_AWVALID,  -- ufix1
              axi_wdata => AXI_Lite_WDATA,  -- ufix32
              rd_ver_reg => rd_ver_reg_sig,  -- ufix32
              rd_hwinfo1_reg => rd_hwinfo1_reg_sig,  -- ufix32
              rd_hwinfo2_reg => rd_hwinfo2_reg_sig,  -- ufix32
              rd_hwinfo3_reg => rd_hwinfo3_reg_sig,  -- ufix32
              rd_hwinfo4_reg => rd_hwinfo4_reg_sig,  -- ufix32
              rd_hwinfo5_reg => rd_hwinfo5_reg_sig,  -- ufix32
              rd_hwinfo6_reg => rd_hwinfo6_reg_sig,  -- ufix32
              rd_hwinfo7_reg => rd_hwinfo7_reg_sig,  -- ufix32
              rd_hwinfo8_reg => rd_hwinfo8_reg_sig,  -- ufix32
              i2c_reset => i2c_reset_sig,  -- ufix1
              rx_data_path_rst => rx_data_path_rst_sig,  -- ufix1
              stream_enable_rx => stream_enable_rx_sig,  -- ufix1
              rd_rxstrmenb_reg => rd_rxstrmenb_reg_sig,  -- ufix32
              rd_rx_data_src_path => rd_rx_data_src_path_sig,  -- ufix3
              dec_select => dec_select_sig,  -- ufix1
              dec_by_pass => dec_by_pass_sig,  -- ufix1
              dut_rx_by_pass => dut_rx_by_pass_sig,  -- ufix1
              int_select => int_select_sig,  -- ufix1
              int_by_pass => int_by_pass_sig,  -- ufix1
              dut_tx_by_pass => dut_tx_by_pass_sig,  -- ufix1
              tx_data_path_rst => tx_data_path_rst_sig,  -- ufix1
              rd_tx_data_src_path => rd_tx_data_src_path_sig,  -- ufix3
              rd_txstrmenb_reg => rd_txstrmenb_reg_sig,  -- ufix32
              stream_enable_tx => stream_enable_tx_sig  -- ufix1
              );

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  i2c_reset <= i2c_reset_sig;

  rx_data_path_rst <= rx_data_path_rst_sig;

  stream_enable_rx <= stream_enable_rx_sig;

  dec_select <= dec_select_sig;

  dec_by_pass <= dec_by_pass_sig;

  dut_rx_by_pass <= dut_rx_by_pass_sig;

  int_select <= int_select_sig;

  int_by_pass <= int_by_pass_sig;

  dut_tx_by_pass <= dut_tx_by_pass_sig;

  tx_data_path_rst <= tx_data_path_rst_sig;

  stream_enable_tx <= stream_enable_tx_sig;

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

END rtl;
