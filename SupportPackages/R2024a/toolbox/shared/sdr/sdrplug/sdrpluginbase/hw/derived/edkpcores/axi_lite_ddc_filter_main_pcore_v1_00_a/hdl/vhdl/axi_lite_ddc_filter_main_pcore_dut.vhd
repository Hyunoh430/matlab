-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_ddc_filter_main\axi_lite_ddc_filter_main_pcore_dut.vhd
-- Created: 2013-07-31 17:17:07
-- 
-- Generated by MATLAB 8.2 and HDL Coder 3.3
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_ddc_filter_main_pcore_dut
-- Source Path: axi_lite_ddc_filter_main_pcore/axi_lite_ddc_filter_main_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_ddc_filter_main_pcore_dut IS
  PORT( clk                               :   IN    std_logic;  -- ufix1
        clk_enable                        :   IN    std_logic;  -- ufix1
        reset                             :   IN    std_logic;  -- ufix1
        wr_control_reg                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        filter_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix14
        filter_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix14
        ce_out                            :   OUT   std_logic;  -- ufix1
        filter_out_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        filter_out_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        rd_control_reg                    :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END axi_lite_ddc_filter_main_pcore_dut;


ARCHITECTURE rtl OF axi_lite_ddc_filter_main_pcore_dut IS

  -- Component Declarations
  COMPONENT axi_lite_ddc_filter_main
    PORT( clk                             :   IN    std_logic;  -- ufix1
          clk_enable                      :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;  -- ufix1
          wr_control_reg                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          filter_in_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix14
          filter_in_im                    :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix14
          ce_out                          :   OUT   std_logic;  -- ufix1
          filter_out_re                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          filter_out_im                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          rd_control_reg                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : axi_lite_ddc_filter_main
    USE ENTITY work.axi_lite_ddc_filter_main(rtl);

  -- Signals
  SIGNAL clk_sig                          : std_logic;  -- ufix1
  SIGNAL clk_enable_sig                   : std_logic;  -- ufix1
  SIGNAL reset_sig                        : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL filter_out_re_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL filter_out_im_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rd_control_reg_sig               : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_axi_lite_ddc_filter_main : axi_lite_ddc_filter_main
    PORT MAP( clk => clk_sig,  -- ufix1
              clk_enable => clk_enable_sig,  -- ufix1
              reset => reset_sig,  -- ufix1
              wr_control_reg => wr_control_reg,  -- ufix32
              filter_in_re => filter_in_re,  -- ufix14
              filter_in_im => filter_in_im,  -- ufix14
              ce_out => ce_out_sig,  -- ufix1
              filter_out_re => filter_out_re_sig,  -- ufix16
              filter_out_im => filter_out_im_sig,  -- ufix16
              rd_control_reg => rd_control_reg_sig  -- ufix32
              );

  clk_sig <= clk;

  clk_enable_sig <= clk_enable;

  reset_sig <= reset;

  ce_out <= ce_out_sig;

  filter_out_re <= filter_out_re_sig;

  filter_out_im <= filter_out_im_sig;

  rd_control_reg <= rd_control_reg_sig;

END rtl;

