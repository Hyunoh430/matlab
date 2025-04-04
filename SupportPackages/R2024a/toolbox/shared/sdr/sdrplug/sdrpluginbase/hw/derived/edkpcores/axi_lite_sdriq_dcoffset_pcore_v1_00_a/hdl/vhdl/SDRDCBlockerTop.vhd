-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc_fir_without_mode\msdrfdcblocker\SDRDCBlockerTop.vhd
-- Created: 2013-10-24 17:20:28
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 2.22222e-08
-- Target subsystem base rate: 2.22222e-08
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        2.22222e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- data_out_re                   ce_out        2.22222e-08
-- data_out_im                   ce_out        2.22222e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SDRDCBlockerTop
-- Source Path: msdrfdcblocker/SDRDCBlockerTop
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SDRDCBlockerTop IS
  PORT( clk                               :   IN    std_logic;
        rst                               :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        bypass                            :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END SDRDCBlockerTop;


ARCHITECTURE rtl OF SDRDCBlockerTop IS

  -- Component Declarations
  COMPONENT SDRDCBlockingFilter
    PORT( clk                             :   IN    std_logic;
          rst                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          SDRDCBlockingFilter_in_re       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          SDRDCBlockingFilter_in_im       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          SDRDCBlockingFilter_out_re      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En22
          SDRDCBlockingFilter_out_im      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En22
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SDRDCBlockingFilter
    USE ENTITY work.SDRDCBlockingFilter(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL data_in_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL data_in_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay1_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay1_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL SDRDCBlockingFilter_out1_re      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL SDRDCBlockingFilter_out1_im      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL SDRDCBlockingFilter_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En22
  SIGNAL SDRDCBlockingFilter_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En22
  SIGNAL Sum_sub_cast                     : signed(31 DOWNTO 0);  -- sfix32_En22
  SIGNAL Sum_sub_cast_1                   : signed(31 DOWNTO 0);  -- sfix32_En22
  SIGNAL Sum_sub_temp                     : signed(31 DOWNTO 0);  -- sfix32_En22
  SIGNAL Sum_sub_cast_2                   : signed(31 DOWNTO 0);  -- sfix32_En22
  SIGNAL Sum_sub_cast_3                   : signed(31 DOWNTO 0);  -- sfix32_En22
  SIGNAL Sum_sub_temp_1                   : signed(31 DOWNTO 0);  -- sfix32_En22
  SIGNAL Sum_out1_re                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Sum_out1_im                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay3_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay3_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL bypass_switch_out1_re            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL bypass_switch_out1_im            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_reg                       : std_logic_vector(0 TO 1);  -- ufix1 [2]

BEGIN
  u_SDRDCBlockingFilter : SDRDCBlockingFilter
    PORT MAP( clk => clk,
              rst => rst,
              enb => clk_enable,
              SDRDCBlockingFilter_in_re => std_logic_vector(Delay1_out1_re),  -- sfix16_En15
              SDRDCBlockingFilter_in_im => std_logic_vector(Delay1_out1_im),  -- sfix16_En15
              SDRDCBlockingFilter_out_re => SDRDCBlockingFilter_out1_re,  -- sfix16_En22
              SDRDCBlockingFilter_out_im => SDRDCBlockingFilter_out1_im  -- sfix16_En22
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  enb <= clk_enable;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        Delay1_out1_re <= to_signed(16#0000#, 16);
        Delay1_out1_im <= to_signed(16#0000#, 16);
      ELSE
        Delay1_out1_re <= data_in_re_signed;
        Delay1_out1_im <= data_in_im_signed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  SDRDCBlockingFilter_out1_re_signed <= signed(SDRDCBlockingFilter_out1_re);

  SDRDCBlockingFilter_out1_im_signed <= signed(SDRDCBlockingFilter_out1_im);

  Sum_sub_cast <= resize(Delay1_out1_re & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
  Sum_sub_cast_1 <= resize(SDRDCBlockingFilter_out1_re_signed, 32);
  Sum_sub_temp <= Sum_sub_cast - Sum_sub_cast_1;
  
  Sum_out1_re <= X"7FFF" WHEN ((Sum_sub_temp(31) = '0') AND (Sum_sub_temp(30 DOWNTO 22) /= "000000000")) OR ((Sum_sub_temp(31) = '0') AND (Sum_sub_temp(22 DOWNTO 7) = X"7FFF")) ELSE
      X"8000" WHEN (Sum_sub_temp(31) = '1') AND (Sum_sub_temp(30 DOWNTO 22) /= "111111111") ELSE
      Sum_sub_temp(22 DOWNTO 7) + ('0' & Sum_sub_temp(6));
  Sum_sub_cast_2 <= resize(Delay1_out1_im & '0' & '0' & '0' & '0' & '0' & '0' & '0', 32);
  Sum_sub_cast_3 <= resize(SDRDCBlockingFilter_out1_im_signed, 32);
  Sum_sub_temp_1 <= Sum_sub_cast_2 - Sum_sub_cast_3;
  
  Sum_out1_im <= X"7FFF" WHEN ((Sum_sub_temp_1(31) = '0') AND (Sum_sub_temp_1(30 DOWNTO 22) /= "000000000")) OR ((Sum_sub_temp_1(31) = '0') AND (Sum_sub_temp_1(22 DOWNTO 7) = X"7FFF")) ELSE
      X"8000" WHEN (Sum_sub_temp_1(31) = '1') AND (Sum_sub_temp_1(30 DOWNTO 22) /= "111111111") ELSE
      Sum_sub_temp_1(22 DOWNTO 7) + ('0' & Sum_sub_temp_1(6));

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        Delay3_out1_re <= to_signed(16#0000#, 16);
        Delay3_out1_im <= to_signed(16#0000#, 16);
      ELSE
        Delay3_out1_re <= Sum_out1_re;
        Delay3_out1_im <= Sum_out1_im;
      END IF;
    END IF;
  END PROCESS Delay3_process;

  -- manually added 
  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        Delay2_reg <= (OTHERS => '0');
      ELSE
        Delay2_reg(0) <= clk_enable;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  
 -- bypass_switch_out1_re <= Delay3_out1_re WHEN bypass = '0' ELSE
 --     data_in_re_signed;
  
 -- bypass_switch_out1_im <= Delay3_out1_im WHEN bypass = '0' ELSE
 --     data_in_im_signed;

 -- data_out_re <= std_logic_vector(bypass_switch_out1_re);

--  data_out_im <= std_logic_vector(bypass_switch_out1_im);

 -- ce_out <= clk_enable;

  data_out_re <= std_logic_vector(Delay3_out1_re) WHEN bypass = '0' ELSE
      data_in_re;
  
  data_out_im <= std_logic_vector(Delay3_out1_im) WHEN bypass = '0' ELSE
      data_in_im;
  
  ce_out <= Delay2_reg(1) WHEN bypass = '0' ELSE
      clk_enable;

END rtl;

