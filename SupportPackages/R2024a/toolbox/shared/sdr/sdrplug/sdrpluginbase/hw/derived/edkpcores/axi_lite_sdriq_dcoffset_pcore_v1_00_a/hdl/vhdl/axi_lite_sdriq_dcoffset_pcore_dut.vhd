-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_sdriq_dcoffset\axi_lite_sdriq_dcoffset_pcore_dut.vhd
-- Created: 2013-08-28 18:09:31
-- 
-- Generated by MATLAB 8.2 and HDL Coder 3.3
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_sdriq_dcoffset_pcore_dut
-- Source Path: axi_lite_sdriq_dcoffset_pcore/axi_lite_sdriq_dcoffset_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_sdriq_dcoffset_pcore_dut IS
  PORT( clock                             :   IN    std_logic;  -- ufix1
        reset                             :   IN    std_logic;  -- ufix1
        strobe_in                         :   IN    std_logic;  -- ufix1
        wr_dcoffset                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        wr_IQbal                          :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        wr_iqbal_dcoffbypass              :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        x_in                              :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        y_in                              :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        strobe_out                        :   OUT   std_logic;  -- ufix1
        rd_dcoffset                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_IQbal                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        rd_iqbal_dcoffbypass              :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        x_out                             :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        y_out                             :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
        );
END axi_lite_sdriq_dcoffset_pcore_dut;


ARCHITECTURE rtl OF axi_lite_sdriq_dcoffset_pcore_dut IS

  -- Component Declarations
  COMPONENT axi_lite_sdriq_dcoffset
    PORT( clock                           :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;  -- ufix1
          strobe_in                       :   IN    std_logic;  -- ufix1
          wr_dcoffset                     :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_IQbal                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          wr_iqbal_dcoffbypass            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          x_in                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          y_in                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          strobe_out                      :   OUT   std_logic;  -- ufix1
          rd_dcoffset                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_IQbal                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          rd_iqbal_dcoffbypass            :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          x_out                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          y_out                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_sdriq_dcoffset
    USE ENTITY work.axi_lite_sdriq_dcoffset(rtl);

  -- Signals
  SIGNAL clock_sig                        : std_logic;  -- ufix1
  SIGNAL reset_sig                        : std_logic;  -- ufix1
  SIGNAL strobe_in_sig                    : std_logic;  -- ufix1
  SIGNAL strobe_out_sig                   : std_logic;  -- ufix1
  SIGNAL rd_dcoffset_sig                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_IQbal_sig                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rd_iqbal_dcoffbypass_sig         : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL x_out_sig                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL y_out_sig                        : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_axi_lite_sdriq_dcoffset : axi_lite_sdriq_dcoffset
    PORT MAP( clock => clock_sig,  -- ufix1
              reset => reset_sig,  -- ufix1
              strobe_in => strobe_in_sig,  -- ufix1
              wr_dcoffset => wr_dcoffset,  -- ufix32
              wr_IQbal => wr_IQbal,  -- ufix32
              wr_iqbal_dcoffbypass => wr_iqbal_dcoffbypass,  -- ufix2
              x_in => x_in,  -- ufix16
              y_in => y_in,  -- ufix16
              strobe_out => strobe_out_sig,  -- ufix1
              rd_dcoffset => rd_dcoffset_sig,  -- ufix32
              rd_IQbal => rd_IQbal_sig,  -- ufix32
              rd_iqbal_dcoffbypass => rd_iqbal_dcoffbypass_sig,  -- ufix2
              x_out => x_out_sig,  -- ufix16
              y_out => y_out_sig  -- ufix16
              );

  clock_sig <= clock;

  reset_sig <= reset;

  strobe_in_sig <= strobe_in;

  strobe_out <= strobe_out_sig;

  rd_dcoffset <= rd_dcoffset_sig;

  rd_IQbal <= rd_IQbal_sig;

  rd_iqbal_dcoffbypass <= rd_iqbal_dcoffbypass_sig;

  x_out <= x_out_sig;

  y_out <= y_out_sig;

END rtl;

