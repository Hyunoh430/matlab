-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_sample_counter\axi_lite_sample_counter_pcore_dut.vhd
-- Created: 2014-07-29 08:51:09
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_sample_counter_pcore_dut
-- Source Path: axi_lite_sample_counter_pcore/axi_lite_sample_counter_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_sample_counter_pcore_dut IS
  PORT( 
        -- axi lite interface
        aclk                        : in std_logic;
        aresetn                     : in std_logic;
        axi_awaddr                  : in std_logic_vector(31 downto 0);
        axi_wvalid                  : in std_logic;
        axi_awvalid                 : in std_logic;
        axi_wdata                   : in std_logic_vector(31 downto 0);
        
        wr_samples_per_ring         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        wr_rst_reg                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        ps7_fclk0                   :   IN    std_logic;  -- ufix1
        data_path_rst_n             :   IN    std_logic;  -- ufix1
        s_axis_tvalid               :   IN    std_logic;  -- ufix1
        m_axis_tready               :   IN    std_logic;  -- ufix1
        s_axis_tdata                :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix32
        rd_samples_per_ring         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_rst_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        m_axis_tdata                :   OUT   std_logic_vector(63 DOWNTO 0);  -- ufix32
        debug_out                   :   OUT   std_logic_vector(34 DOWNTO 0);  -- ufix35
        s_axis_tready               :   OUT   std_logic;  -- ufix1
        m_axis_tvalid               :   OUT   std_logic;  -- ufix1
        m_axis_tlast                :   OUT   std_logic;  -- ufix1
        rst_out                     :   OUT   std_logic  -- ufix1
        );
END axi_lite_sample_counter_pcore_dut;


ARCHITECTURE rtl OF axi_lite_sample_counter_pcore_dut IS

  -- Component Declarations
  COMPONENT axi_lite_sample_counter
    PORT( 
          -- axi lite interface
          aclk                : in std_logic;
          aresetn             : in std_logic;
          axi_awaddr          : in std_logic_vector(31 downto 0);
          axi_wvalid          : in std_logic;
          axi_awvalid         : in std_logic;
          axi_wdata           : in std_logic_vector(31 downto 0);
          
          wr_samples_per_ring             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_rst_reg                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          ps7_fclk0                       :   IN    std_logic;  -- ufix1
          data_path_rst_n                 :   IN    std_logic;  -- ufix1
          s_axis_tvalid                   :   IN    std_logic;  -- ufix1
          m_axis_tready                   :   IN    std_logic;  -- ufix1
          s_axis_tdata                    :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix32
          rd_samples_per_ring             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_rst_reg                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          m_axis_tdata                    :   OUT   std_logic_vector(63 DOWNTO 0);  -- ufix32
          debug_out                       :   OUT   std_logic_vector(34 DOWNTO 0);  -- ufix35
          s_axis_tready                   :   OUT   std_logic;  -- ufix1
          m_axis_tvalid                   :   OUT   std_logic;  -- ufix1
          m_axis_tlast                    :   OUT   std_logic;  -- ufix1
          rst_out                         :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_sample_counter
    USE ENTITY work.axi_lite_sample_counter(rtl);

  -- Signals
  SIGNAL ps7_fclk0_sig                    : std_logic;  -- ufix1
  SIGNAL data_path_rst_n_sig              : std_logic;  -- ufix1
  SIGNAL s_axis_tvalid_sig                : std_logic;  -- ufix1
  SIGNAL m_axis_tready_sig                : std_logic;  -- ufix1
  SIGNAL rd_samples_per_ring_sig          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_rst_reg_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL m_axis_tdata_sig                 : std_logic_vector(63 DOWNTO 0);  -- ufix32
  SIGNAL debug_out_sig                    : std_logic_vector(34 DOWNTO 0);  -- ufix35
  SIGNAL s_axis_tready_sig                : std_logic;  -- ufix1
  SIGNAL m_axis_tvalid_sig                : std_logic;  -- ufix1
  SIGNAL m_axis_tlast_sig                 : std_logic;  -- ufix1
  SIGNAL rst_out_sig                      : std_logic;  -- ufix1

BEGIN
  u_axi_lite_sample_counter : axi_lite_sample_counter
    PORT MAP( 
              -- axi lite interface
              aclk        => aclk,
              aresetn     => aresetn,
              axi_awaddr  => axi_awaddr,
              axi_wvalid  => axi_wvalid,
              axi_awvalid => axi_awvalid,
              axi_wdata   => axi_wdata,
          
              wr_samples_per_ring => wr_samples_per_ring,  -- ufix32
              wr_rst_reg => wr_rst_reg,  -- ufix32
              ps7_fclk0 => ps7_fclk0_sig,  -- ufix1
              data_path_rst_n => data_path_rst_n_sig,  -- ufix1
              s_axis_tvalid => s_axis_tvalid_sig,  -- ufix1
              m_axis_tready => m_axis_tready_sig,  -- ufix1
              s_axis_tdata => s_axis_tdata,  -- ufix32
              rd_samples_per_ring => rd_samples_per_ring_sig,  -- ufix32
              rd_rst_reg => rd_rst_reg_sig,  -- ufix32
              m_axis_tdata => m_axis_tdata_sig,  -- ufix32
              debug_out => debug_out_sig,  -- ufix35
              s_axis_tready => s_axis_tready_sig,  -- ufix1
              m_axis_tvalid => m_axis_tvalid_sig,  -- ufix1
              m_axis_tlast => m_axis_tlast_sig,  -- ufix1
              rst_out => rst_out_sig  -- ufix1
              );

  ps7_fclk0_sig <= ps7_fclk0;

  data_path_rst_n_sig <= data_path_rst_n;

  s_axis_tvalid_sig <= s_axis_tvalid;

  m_axis_tready_sig <= m_axis_tready;

  rd_samples_per_ring <= rd_samples_per_ring_sig;

  rd_rst_reg <= rd_rst_reg_sig;

  m_axis_tdata <= m_axis_tdata_sig;

  debug_out <= debug_out_sig;

  s_axis_tready <= s_axis_tready_sig;

  m_axis_tvalid <= m_axis_tvalid_sig;

  m_axis_tlast <= m_axis_tlast_sig;

  rst_out <= rst_out_sig;

END rtl;
