-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\FIFOIRQCtrl\axi_lite_fifo_irq_ctrl_pcore_dut.vhd
-- Created: 2015-05-14 08:08:22
-- 
-- Generated by MATLAB 9.0 and HDL Coder 3.7
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_fifo_irq_ctrl_pcore_dut
-- Source Path: fifo_irq_ctrl_pcore/axi_lite_fifo_irq_ctrl_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_fifo_irq_ctrl_pcore_dut IS
  generic(
        base_addr      : in integer := 1137049600 -- X"43c60000"
  );
  PORT( axi_clk                           :   IN    std_logic;
        FIFO_OF                           :   IN    std_logic;  -- ufix1
        FIFO_UF                           :   IN    std_logic;  -- ufix1
        wr_CTRL                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        wr_ISR                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        wr_IER                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
        FIFO_DATA_OCC_CNT                 :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
        DATA_PATH_RST                     :   IN    std_logic;  -- ufix1
        AXIS_TVALID                       :   IN    std_logic;  -- ufix1
        DATA_CLK                          :   IN    std_logic;  -- ufix1
        ENABLE                            :   IN    std_logic;
        AXI_AWADDR                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_AWVALID                       :   IN    std_logic;  -- ufix1
        AXI_WVALID                        :   IN    std_logic;  -- ufix1
        AXI_WDATA                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_RST                           :   IN    std_logic;  -- ufix1
        rd_STATUS                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_ISR                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_IER                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_OFCNT                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_UFCNT                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        EXT_IRQ                           :   OUT   std_logic;  -- ufix1
        rd_FIFO_OCC_CNT                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_FIFO_SAMP_CNT                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END axi_lite_fifo_irq_ctrl_pcore_dut;


ARCHITECTURE rtl OF axi_lite_fifo_irq_ctrl_pcore_dut IS

  -- Component Declarations
  COMPONENT axi_fifo_irq_ctrl_if
    generic(
          base_addr      : in integer := 1137049600 -- X"43c60000"
    );
    PORT( axi_clk                         :   IN    std_logic;
          FIFO_OF                         :   IN    std_logic;  -- ufix1
          FIFO_UF                         :   IN    std_logic;  -- ufix1
          wr_CTRL                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_ISR                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_IER                          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
          FIFO_DATA_OCC_CNT               :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          DATA_PATH_RST                   :   IN    std_logic;  -- ufix1
          axis_tvalid                     :   IN    std_logic;  -- ufix1
          DATA_CLK                        :   IN    std_logic;  -- ufix1
          ENABLE                          :   IN    std_logic;
          AXI_AWADDR                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_AWVALID                     :   IN    std_logic;  -- ufix1
          AXI_WVALID                      :   IN    std_logic;  -- ufix1
          AXI_WDATA                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_RST                         :   IN    std_logic;  -- ufix1
          rd_STATUS                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_ISR                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_IER                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_OFCNT                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_UFCNT                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          EXT_IRQ                         :   OUT   std_logic;  -- ufix1
          rd_FIFO_OCC_CNT                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_FIFO_SAMP_CNT                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_fifo_irq_ctrl_if
    USE ENTITY work.axi_fifo_irq_ctrl_if(rtl);

  -- Signals
  SIGNAL FIFO_OF_sig                      : std_logic;  -- ufix1
  SIGNAL FIFO_UF_sig                      : std_logic;  -- ufix1
  SIGNAL DATA_PATH_RST_sig                : std_logic;  -- ufix1
  SIGNAL axis_tvalid_sig                : std_logic;  -- ufix1
  SIGNAL DATA_CLK_sig                   : std_logic;  -- ufix1
  SIGNAL AXI_AWVALID_sig                  : std_logic;  -- ufix1
  SIGNAL AXI_WVALID_sig                   : std_logic;  -- ufix1
  SIGNAL AXI_RST_sig                      : std_logic;  -- ufix1
  SIGNAL rd_STATUS_sig                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_ISR_sig                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_IER_sig                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_OFCNT_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_UFCNT_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL EXT_IRQ_sig                      : std_logic;  -- ufix1
  SIGNAL rd_FIFO_OCC_CNT_sig              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_FIFO_SAMP_CNT_sig             : std_logic_vector(31 DOWNTO 0);  -- ufix32


BEGIN
  u_axi_fifo_irq_ctrl_if : axi_fifo_irq_ctrl_if
    generic map(
        base_addr => base_addr
    )
    PORT MAP( axi_clk => axi_clk,
              FIFO_OF => FIFO_OF_sig,  -- ufix1
              FIFO_UF => FIFO_UF_sig,  -- ufix1
              wr_CTRL => wr_CTRL,  -- ufix32
              wr_ISR => wr_ISR,  -- ufix32
              wr_IER => wr_IER,  -- sfix32
              FIFO_DATA_OCC_CNT => FIFO_DATA_OCC_CNT,  -- ufix5
              DATA_PATH_RST => DATA_PATH_RST_sig,  -- ufix1
              axis_tvalid => axis_tvalid_sig,  -- ufix1
              DATA_CLK => DATA_CLK_sig,  -- ufix1
              ENABLE => ENABLE,
              AXI_AWADDR => AXI_AWADDR,  -- ufix32
              AXI_AWVALID => AXI_AWVALID_sig,  -- ufix1
              AXI_WVALID => AXI_WVALID_sig,  -- ufix1
              AXI_WDATA => AXI_WDATA,  -- ufix32
              AXI_RST => AXI_RST_sig,  -- ufix1
              rd_STATUS => rd_STATUS_sig,  -- ufix32
              rd_ISR => rd_ISR_sig,  -- ufix32
              rd_IER => rd_IER_sig,  -- ufix32
              rd_OFCNT => rd_OFCNT_sig,  -- ufix32
              rd_UFCNT => rd_UFCNT_sig,  -- ufix32
              EXT_IRQ => EXT_IRQ_sig,  -- ufix1
              rd_FIFO_OCC_CNT => rd_FIFO_OCC_CNT_sig,  -- ufix32
			  rd_FIFO_SAMP_CNT => rd_FIFO_SAMP_CNT_sig  -- ufix32
              );

  FIFO_OF_sig <= FIFO_OF;

  FIFO_UF_sig <= FIFO_UF;

  DATA_PATH_RST_sig <= DATA_PATH_RST;

  axis_tvalid_sig <= axis_tvalid;

  DATA_CLK_sig <= DATA_CLK;

  AXI_AWVALID_sig <= AXI_AWVALID;

  AXI_WVALID_sig <= AXI_WVALID;

  AXI_RST_sig <= AXI_RST;

  rd_STATUS <= rd_STATUS_sig;

  rd_ISR <= rd_ISR_sig;

  rd_IER <= rd_IER_sig;

  rd_OFCNT <= rd_OFCNT_sig;

  rd_UFCNT <= rd_UFCNT_sig;

  EXT_IRQ <= EXT_IRQ_sig;

  rd_FIFO_OCC_CNT <= rd_FIFO_OCC_CNT_sig;
  
  rd_FIFO_SAMP_CNT <= rd_FIFO_SAMP_CNT_sig;

END rtl;

