-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/axi_lite_data_verifier_if/axi_lite_data_verifier_if_pcore.vhd
-- Created: 2015-02-10 12:42:51
-- 
-- Generated by MATLAB 8.5 and HDL Coder 3.6
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
-- Module: axi_lite_data_verifier_if_pcore
-- Source Path: axi_lite_data_verifier_if_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_data_verifier_if_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        clk                               :   IN    std_logic;  -- ufix1
        dvld                              :   IN    std_logic;  -- ufix1
        ch_sel                            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        data                              :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        AXI4_Lite_ACLK                    :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARESETN                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_AWADDR                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_WDATA                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_WSTRB                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Lite_WVALID                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_BREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_ARVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_RREADY                  :   IN    std_logic;  -- ufix1
        err_irq                           :   OUT   std_logic;  -- ufix1
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END axi_lite_data_verifier_if_pcore;


ARCHITECTURE rtl OF axi_lite_data_verifier_if_pcore IS

  -- Component Declarations
  COMPONENT axi_lite_data_verifier_if_pcore_axi_lite
    PORT( axi_rst                         :   IN    std_logic;
          AXI4_Lite_ACLK                  :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARESETN               :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_WDATA                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_WSTRB                 :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Lite_WVALID                :   IN    std_logic;  -- ufix1
          AXI4_Lite_BREADY                :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_ARVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_RREADY                :   IN    std_logic;  -- ufix1
          read_rd_count_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_status_reg              :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch1_0                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch1_1                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch1_2                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch1_3                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch1_4                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch2_0                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch2_1                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch2_2                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch2_3                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_ch2_4                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_rd_cntmax                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_wr_rst_reg                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_wr_cntmax                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT axi_lite_data_verifier_if_pcore_dut
    PORT( axi_clk                         :   IN    std_logic;  -- ufix1
          axi_rst                         :   IN    std_logic;
          wr_rst_reg                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          axi_awaddr                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          axi_wvalid                      :   IN    std_logic;  -- ufix1
          axi_awvalid                     :   IN    std_logic;  -- ufix1
          clk                             :   IN    std_logic;  -- ufix1
          dvld                            :   IN    std_logic;  -- ufix1
          ch_sel                          :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          data                            :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
          wr_cntmax                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          rd_count_reg                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_status_reg                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          err_irq                         :   OUT   std_logic;  -- ufix1
          ch1_0                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch1_1                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch1_2                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch1_3                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch1_4                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch2_0                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch2_1                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch2_2                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch2_3                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          ch2_4                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_cntmax                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_data_verifier_if_pcore_axi_lite
    USE ENTITY work.axi_lite_data_verifier_if_pcore_axi_lite(rtl);

  FOR ALL : axi_lite_data_verifier_if_pcore_dut
    USE ENTITY work.axi_lite_data_verifier_if_pcore_dut(rtl);

  -- Signals
  SIGNAL axi_rst                          : std_logic;
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL rd_count_reg_sig                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_status_reg_sig                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch1_0_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch1_1_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch1_2_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch1_3_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch1_4_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch2_0_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch2_1_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch2_2_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch2_3_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL ch2_4_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_cntmax_sig                    : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_wr_rst_reg                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_wr_cntmax                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL err_irq_sig                      : std_logic;  -- ufix1
  SIGNAL AXI4_Lite_AWADDR_tmp             : std_logic_vector(15 downto 0);

BEGIN
  AXI4_Lite_AWADDR_tmp <= AXI4_Lite_AWADDR(15 downto 0);
  u_axi_lite_data_verifier_if_pcore_axi_lite_inst : axi_lite_data_verifier_if_pcore_axi_lite
    PORT MAP( axi_rst => axi_rst,
              AXI4_Lite_ACLK => AXI4_Lite_ACLK,  -- ufix1
              AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,  -- ufix1
              AXI4_Lite_AWADDR => AXI4_Lite_AWADDR_tmp,  -- ufix16
              AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,  -- ufix1
              AXI4_Lite_WDATA => AXI4_Lite_WDATA,  -- ufix32
              AXI4_Lite_WSTRB => AXI4_Lite_WSTRB,  -- ufix4
              AXI4_Lite_WVALID => AXI4_Lite_WVALID,  -- ufix1
              AXI4_Lite_BREADY => AXI4_Lite_BREADY,  -- ufix1
              AXI4_Lite_ARADDR => AXI4_Lite_ARADDR,  -- ufix16
              AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,  -- ufix1
              AXI4_Lite_RREADY => AXI4_Lite_RREADY,  -- ufix1
              read_rd_count_reg => rd_count_reg_sig,  -- ufix32
              read_rd_status_reg => rd_status_reg_sig,  -- ufix32
              read_ch1_0 => ch1_0_sig,  -- ufix32
              read_ch1_1 => ch1_1_sig,  -- ufix32
              read_ch1_2 => ch1_2_sig,  -- ufix32
              read_ch1_3 => ch1_3_sig,  -- ufix32
              read_ch1_4 => ch1_4_sig,  -- ufix32
              read_ch2_0 => ch2_0_sig,  -- ufix32
              read_ch2_1 => ch2_1_sig,  -- ufix32
              read_ch2_2 => ch2_2_sig,  -- ufix32
              read_ch2_3 => ch2_3_sig,  -- ufix32
              read_ch2_4 => ch2_4_sig,  -- ufix32
              read_rd_cntmax => rd_cntmax_sig,  -- ufix16
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_wr_rst_reg => write_wr_rst_reg,  -- ufix32
              write_wr_cntmax => write_wr_cntmax,  -- ufix16
              reset_internal => reset_internal  -- ufix1
              );

  u_axi_lite_data_verifier_if_pcore_dut_inst : axi_lite_data_verifier_if_pcore_dut
    PORT MAP( axi_clk => IPCORE_CLK,  -- ufix1
              axi_rst => axi_rst,
              wr_rst_reg => write_wr_rst_reg,  -- ufix32
              axi_awaddr => AXI4_Lite_AWADDR,  -- ufix32
              axi_wvalid => AXI4_Lite_WVALID,  -- ufix1
              axi_awvalid => AXI4_Lite_AWVALID,  -- ufix1
              clk => clk,  -- ufix1
              dvld => dvld,  -- ufix1
              ch_sel => ch_sel,  -- ufix2
              data => data,  -- ufix64
              wr_cntmax => write_wr_cntmax,  -- ufix16
              rd_count_reg => rd_count_reg_sig,  -- ufix32
              rd_status_reg => rd_status_reg_sig,  -- ufix32
              err_irq => err_irq_sig,  -- ufix1
              ch1_0 => ch1_0_sig,  -- ufix32
              ch1_1 => ch1_1_sig,  -- ufix32
              ch1_2 => ch1_2_sig,  -- ufix32
              ch1_3 => ch1_3_sig,  -- ufix32
              ch1_4 => ch1_4_sig,  -- ufix32
              ch2_0 => ch2_0_sig,  -- ufix32
              ch2_1 => ch2_1_sig,  -- ufix32
              ch2_2 => ch2_2_sig,  -- ufix32
              ch2_3 => ch2_3_sig,  -- ufix32
              ch2_4 => ch2_4_sig,  -- ufix32
              rd_cntmax => rd_cntmax_sig  -- ufix16
              );

  reset_cm <=  NOT IPCORE_RESETN;

  axi_rst <= reset_cm OR reset_internal;

  err_irq <= err_irq_sig;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;

