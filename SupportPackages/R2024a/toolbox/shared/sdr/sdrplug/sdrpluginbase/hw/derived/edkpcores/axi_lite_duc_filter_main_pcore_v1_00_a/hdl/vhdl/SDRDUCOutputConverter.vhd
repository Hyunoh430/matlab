-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\txFilterChainOutputConverter\SDRDUCOutputConverter.vhd
-- Created: 2013-11-04 12:35:37
-- 
-- Generated by MATLAB 8.2 and HDL Coder 3.3
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SDRDUCOutputConverter
-- Source Path: txFilterChainOutputConverter/converter_wrapper/SDRDUCOutputConverter
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SDRDUCOutputConverter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        data_in_im                        :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END SDRDUCOutputConverter;


ARCHITECTURE rtl OF SDRDUCOutputConverter IS

  -- Signals
  SIGNAL data_in_re_signed                : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL data_in_im_signed                : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Data_Type_Conversion_out1_re     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion_out1_im     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay_out1_re                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay_out1_im                    : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  -- This subsystem is used to generate HDL \ncode for the output conversion from\n18 to 16 bits.

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  
  Data_Type_Conversion_out1_re <= X"7FFF" WHEN ((data_in_re_signed(17) = '0') AND (data_in_re_signed(16) /= '0')) OR ((data_in_re_signed(17) = '0') AND (data_in_re_signed(16 DOWNTO 1) = X"7FFF")) ELSE
      X"8000" WHEN (data_in_re_signed(17) = '1') AND (data_in_re_signed(16) /= '1') ELSE
      data_in_re_signed(16 DOWNTO 1) + ('0' & data_in_re_signed(0));
  
  Data_Type_Conversion_out1_im <= X"7FFF" WHEN ((data_in_im_signed(17) = '0') AND (data_in_im_signed(16) /= '0')) OR ((data_in_im_signed(17) = '0') AND (data_in_im_signed(16 DOWNTO 1) = X"7FFF")) ELSE
      X"8000" WHEN (data_in_im_signed(17) = '1') AND (data_in_im_signed(16) /= '1') ELSE
      data_in_im_signed(16 DOWNTO 1) + ('0' & data_in_im_signed(0));

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Delay_out1_re <= to_signed(16#0000#, 16);
        Delay_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay_out1_re <= Data_Type_Conversion_out1_re;
        Delay_out1_im <= Data_Type_Conversion_out1_im;
      END IF;
    END IF;
  END PROCESS Delay_process;


  data_out_re <= std_logic_vector(Delay_out1_re);

  data_out_im <= std_logic_vector(Delay_out1_im);

END rtl;