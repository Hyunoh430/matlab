-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_system_config\axi_lite_system_config_pcore_axi_lite.vhd
-- Created: 2014-03-09 13:27:11
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_system_config_pcore_axi_lite
-- Source Path: axi_lite_system_config_pcore/axi_lite_system_config_pcore_axi_lite
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_system_config_pcore_axi_lite IS
  PORT( reset                             :   IN    std_logic;
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
        read_rd_ver_reg                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo1_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo2_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo3_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo4_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo5_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo6_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo7_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_hwinfo8_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_rxstrmenb_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_rx_data_src_path          :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        read_rd_txstrmenb_reg             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_tx_data_src_path          :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic;  -- ufix1
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_wr_sysrst_reg               :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        write_wr_rxstrmenb_reg            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_rst_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_rx_data_src_path         :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        write_wr_txstrmenb_reg            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_tx_data_src_path         :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        reset_internal                    :   OUT   std_logic  -- ufix1
        );
END axi_lite_system_config_pcore_axi_lite;


ARCHITECTURE rtl OF axi_lite_system_config_pcore_axi_lite IS

  -- Component Declarations
  COMPONENT axi_lite_system_config_pcore_addr_decoder
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          data_write                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   IN    std_logic;  -- ufix1
          rd_enb                          :   IN    std_logic;  -- ufix1
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
          data_read                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_wr_sysrst_reg             :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_wr_rxstrmenb_reg          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_rst_reg                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_rx_data_src_path       :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          write_wr_txstrmenb_reg          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_tx_data_src_path       :   OUT   std_logic_vector(2 DOWNTO 0)  -- ufix3
          );
  END COMPONENT;

  COMPONENT axi_lite_system_config_pcore_axi_lite_module
    PORT( clk                             :   IN    std_logic;  -- ufix1
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
          data_read                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          data_write                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   OUT   std_logic;  -- ufix1
          rd_enb                          :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_system_config_pcore_addr_decoder
    USE ENTITY work.axi_lite_system_config_pcore_addr_decoder(rtl);

  FOR ALL : axi_lite_system_config_pcore_axi_lite_module
    USE ENTITY work.axi_lite_system_config_pcore_axi_lite_module(rtl);

  -- Signals
  SIGNAL top_data_write                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_addr_sel                     : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL top_wr_enb                       : std_logic;  -- ufix1
  SIGNAL top_rd_enb                       : std_logic;  -- ufix1
  SIGNAL top_data_read                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL inst_axi_enable                  : std_logic;  -- ufix1
  SIGNAL inst_wr_sysrst_reg               : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL inst_wr_rxstrmenb_reg            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL inst_wr_rst_reg                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL inst_wr_rx_data_src_path         : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL inst_wr_txstrmenb_reg            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL inst_wr_tx_data_src_path         : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL top_reset_internal               : std_logic;  -- ufix1

BEGIN
  u_axi_lite_system_config_pcore_addr_decoder_inst : axi_lite_system_config_pcore_addr_decoder
    PORT MAP( clk => AXI_Lite_ACLK,  -- ufix1
              reset => reset,
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              read_rd_ver_reg => read_rd_ver_reg,  -- ufix32
              read_rd_hwinfo1_reg => read_rd_hwinfo1_reg,  -- ufix32
              read_rd_hwinfo2_reg => read_rd_hwinfo2_reg,  -- ufix32
              read_rd_hwinfo3_reg => read_rd_hwinfo3_reg,  -- ufix32
              read_rd_hwinfo4_reg => read_rd_hwinfo4_reg,  -- ufix32
              read_rd_hwinfo5_reg => read_rd_hwinfo5_reg,  -- ufix32
              read_rd_hwinfo6_reg => read_rd_hwinfo6_reg,  -- ufix32
              read_rd_hwinfo7_reg => read_rd_hwinfo7_reg,  -- ufix32
              read_rd_hwinfo8_reg => read_rd_hwinfo8_reg,  -- ufix32
              read_rd_rxstrmenb_reg => read_rd_rxstrmenb_reg,  -- ufix32
              read_rd_rx_data_src_path => read_rd_rx_data_src_path,  -- ufix3
              read_rd_txstrmenb_reg => read_rd_txstrmenb_reg,  -- ufix32
              read_rd_tx_data_src_path => read_rd_tx_data_src_path,  -- ufix3
              data_read => top_data_read,  -- ufix32
              write_axi_enable => inst_axi_enable,  -- ufix1
              write_wr_sysrst_reg => inst_wr_sysrst_reg,  -- ufix8
              write_wr_rxstrmenb_reg => inst_wr_rxstrmenb_reg,  -- ufix32
              write_wr_rst_reg => inst_wr_rst_reg,  -- ufix32
              write_wr_rx_data_src_path => inst_wr_rx_data_src_path,  -- ufix3
              write_wr_txstrmenb_reg => inst_wr_txstrmenb_reg,  -- ufix32
              write_wr_tx_data_src_path => inst_wr_tx_data_src_path  -- ufix3
              );

  u_axi_lite_system_config_pcore_axi_lite_module_inst : axi_lite_system_config_pcore_axi_lite_module
    PORT MAP( clk => AXI_Lite_ACLK,  -- ufix1
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
              data_read => top_data_read,  -- ufix32
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              reset_internal => top_reset_internal  -- ufix1
              );

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

  write_axi_enable <= inst_axi_enable;

  write_wr_sysrst_reg <= inst_wr_sysrst_reg;

  write_wr_rxstrmenb_reg <= inst_wr_rxstrmenb_reg;

  write_wr_rst_reg <= inst_wr_rst_reg;

  write_wr_rx_data_src_path <= inst_wr_rx_data_src_path;

  write_wr_txstrmenb_reg <= inst_wr_txstrmenb_reg;

  write_wr_tx_data_src_path <= inst_wr_tx_data_src_path;

  reset_internal <= top_reset_internal;

END rtl;

