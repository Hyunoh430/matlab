-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_sdrsrc\axi_lite_sdrsrc_pcore_dut.vhd
-- Created: 2014-02-27 10:13:04
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_sdrsrc_pcore_dut
-- Source Path: axi_lite_sdrsrc_pcore/axi_lite_sdrsrc_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_sdrsrc_pcore_dut IS
  PORT( clk                               :   IN    std_logic;  -- ufix1
        reset                             :   IN    std_logic;  -- ufix1
        stream_en                         :   IN    std_logic;  -- ufix1
        wr_src_sel                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        wr_src_amp                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        RFIn_I                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        RFIn_Q                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        RFIn_strb                         :   IN    std_logic;  -- ufix1
        loop_I                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        loop_Q                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        loop_vld                          :   IN    std_logic;  -- ufix1
        wr_src_freq                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        src_strobe                        :   OUT   std_logic;  -- ufix1
        src_I                             :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        src_Q                             :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        rd_src_sel                        :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        rd_src_amp                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_src_freq                       :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END axi_lite_sdrsrc_pcore_dut;


ARCHITECTURE rtl OF axi_lite_sdrsrc_pcore_dut IS

  -- Component Declarations
  COMPONENT axi_lite_sdrsrc
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;  -- ufix1
          stream_en                       :   IN    std_logic;  -- ufix1
          wr_src_sel                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          wr_src_amp                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          RFIn_I                          :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          RFIn_Q                          :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          RFIn_strb                       :   IN    std_logic;  -- ufix1
          loop_I                          :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          loop_Q                          :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          loop_vld                        :   IN    std_logic;  -- ufix1
          wr_src_freq                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          src_strobe                      :   OUT   std_logic;  -- ufix1
          src_I                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          src_Q                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          rd_src_sel                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          rd_src_amp                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_src_freq                     :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_sdrsrc
    USE ENTITY work.axi_lite_sdrsrc(rtl);

  -- Signals
  SIGNAL clk_sig                          : std_logic;  -- ufix1
  SIGNAL reset_sig                        : std_logic;  -- ufix1
  SIGNAL stream_en_sig                    : std_logic;  -- ufix1
  SIGNAL RFIn_strb_sig                    : std_logic;  -- ufix1
  SIGNAL loop_vld_sig                     : std_logic;  -- ufix1
  SIGNAL src_strobe_sig                   : std_logic;  -- ufix1
  SIGNAL src_I_sig                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL src_Q_sig                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rd_src_sel_sig                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL rd_src_amp_sig                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_src_freq_sig                  : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_axi_lite_sdrsrc : axi_lite_sdrsrc
    PORT MAP( clk => clk_sig,  -- ufix1
              reset => reset_sig,  -- ufix1
              stream_en => stream_en_sig,  -- ufix1
              wr_src_sel => wr_src_sel,  -- ufix2
              wr_src_amp => wr_src_amp,  -- ufix32
              RFIn_I => RFIn_I,  -- ufix16
              RFIn_Q => RFIn_Q,  -- ufix16
              RFIn_strb => RFIn_strb_sig,  -- ufix1
              loop_I => loop_I,  -- ufix16
              loop_Q => loop_Q,  -- ufix16
              loop_vld => loop_vld_sig,  -- ufix1
              wr_src_freq => wr_src_freq,  -- ufix32
              src_strobe => src_strobe_sig,  -- ufix1
              src_I => src_I_sig,  -- ufix16
              src_Q => src_Q_sig,  -- ufix16
              rd_src_sel => rd_src_sel_sig,  -- ufix2
              rd_src_amp => rd_src_amp_sig,  -- ufix32
              rd_src_freq => rd_src_freq_sig  -- ufix32
              );

  clk_sig <= clk;

  reset_sig <= reset;

  stream_en_sig <= stream_en;

  RFIn_strb_sig <= RFIn_strb;

  loop_vld_sig <= loop_vld;

  src_strobe <= src_strobe_sig;

  src_I <= src_I_sig;

  src_Q <= src_Q_sig;

  rd_src_sel <= rd_src_sel_sig;

  rd_src_amp <= rd_src_amp_sig;

  rd_src_freq <= rd_src_freq_sig;

END rtl;
