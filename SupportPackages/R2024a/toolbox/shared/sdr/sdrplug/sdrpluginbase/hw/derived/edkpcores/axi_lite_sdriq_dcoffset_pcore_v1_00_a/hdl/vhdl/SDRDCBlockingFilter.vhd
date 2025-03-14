-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc_fir_without_mode\msdrfdcblocker\SDRDCBlockingFilter.vhd
-- Created: 2013-10-24 17:20:28
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SDRDCBlockingFilter
-- Source Path: msdrfdcblocker/SDRDCBlockerTop/SDRDCBlockingFilter
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SDRDCBlockerTop_pkg.ALL;

ENTITY SDRDCBlockingFilter IS
  PORT( clk                               :   IN    std_logic;
        rst                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        SDRDCBlockingFilter_in_re         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        SDRDCBlockingFilter_in_im         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        SDRDCBlockingFilter_out_re        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En22
        SDRDCBlockingFilter_out_im        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En22
        );
END SDRDCBlockingFilter;


ARCHITECTURE rtl OF SDRDCBlockingFilter IS

  -- Signals
  SIGNAL SDRDCBlockingFilter_in_re_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL SDRDCBlockingFilter_in_im_signed : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL CombCast1_out1_re                : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL CombCast1_out1_im                : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL CombDelay1_reg_re                : vector_of_signed17(0 TO 511);  -- sfix17_En15 [512]
  SIGNAL CombDelay1_reg_im                : vector_of_signed17(0 TO 511);  -- sfix17_En15 [512]
  SIGNAL CombDelay1_out1_re               : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL CombDelay1_out1_im               : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL CombSum1_out1_re                 : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL CombSum1_out1_im                 : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL CombCast3_out1_re                : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL CombCast3_out1_im                : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL CombDelay3_reg_re                : vector_of_signed18(0 TO 511);  -- sfix18_En15 [512]
  SIGNAL CombDelay3_reg_im                : vector_of_signed18(0 TO 511);  -- sfix18_En15 [512]
  SIGNAL CombDelay3_out1_re               : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL CombDelay3_out1_im               : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL CombSum3_out1_re                 : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL CombSum3_out1_im                 : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL IntDelay5_out1_re                : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL IntDelay5_out1_im                : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL IntSum5_add_cast                 : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL IntSum5_add_cast_1               : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL IntSum5_out1_re                  : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL IntSum5_out1_im                  : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL IntDelay6_out1_re                : signed(33 DOWNTO 0);  -- sfix34_En15
  SIGNAL IntDelay6_out1_im                : signed(33 DOWNTO 0);  -- sfix34_En15
  SIGNAL IntSum6_add_cast                 : signed(33 DOWNTO 0);  -- sfix34_En15
  SIGNAL IntSum6_add_cast_1               : signed(33 DOWNTO 0);  -- sfix34_En15
  SIGNAL IntSum6_out1_re                  : signed(33 DOWNTO 0);  -- sfix34_En15
  SIGNAL IntSum6_out1_im                  : signed(33 DOWNTO 0);  -- sfix34_En15
  SIGNAL cicgaincomp_out1_re              : signed(35 DOWNTO 0);  -- sfix36_En33
  SIGNAL cicgaincomp_out1_im              : signed(35 DOWNTO 0);  -- sfix36_En33
  SIGNAL dtc_out1_re                      : signed(15 DOWNTO 0);  -- sfix16_En22
  SIGNAL dtc_out1_im                      : signed(15 DOWNTO 0);  -- sfix16_En22

BEGIN
  SDRDCBlockingFilter_in_re_signed <= signed(SDRDCBlockingFilter_in_re);

  SDRDCBlockingFilter_in_im_signed <= signed(SDRDCBlockingFilter_in_im);

  CombCast1_out1_re <= resize(SDRDCBlockingFilter_in_re_signed, 17);
  CombCast1_out1_im <= resize(SDRDCBlockingFilter_in_im_signed, 17);

  CombDelay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        CombDelay1_reg_re <= (OTHERS => to_signed(2#00000000000000000#, 17));
        CombDelay1_reg_im <= (OTHERS => to_signed(2#00000000000000000#, 17));
      ELSIF enb = '1' THEN
        CombDelay1_reg_im(0) <= CombCast1_out1_im;
        CombDelay1_reg_im(1 TO 511) <= CombDelay1_reg_im(0 TO 510);
        CombDelay1_reg_re(0) <= CombCast1_out1_re;
        CombDelay1_reg_re(1 TO 511) <= CombDelay1_reg_re(0 TO 510);
      END IF;
    END IF;
  END PROCESS CombDelay1_process;

  CombDelay1_out1_re <= CombDelay1_reg_re(511);
  CombDelay1_out1_im <= CombDelay1_reg_im(511);

  CombSum1_out1_re <= CombCast1_out1_re - CombDelay1_out1_re;
  CombSum1_out1_im <= CombCast1_out1_im - CombDelay1_out1_im;

  CombCast3_out1_re <= resize(CombSum1_out1_re, 18);
  CombCast3_out1_im <= resize(CombSum1_out1_im, 18);

  CombDelay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        CombDelay3_reg_re <= (OTHERS => to_signed(2#000000000000000000#, 18));
        CombDelay3_reg_im <= (OTHERS => to_signed(2#000000000000000000#, 18));
      ELSIF enb = '1' THEN
        CombDelay3_reg_im(0) <= CombCast3_out1_im;
        CombDelay3_reg_im(1 TO 511) <= CombDelay3_reg_im(0 TO 510);
        CombDelay3_reg_re(0) <= CombCast3_out1_re;
        CombDelay3_reg_re(1 TO 511) <= CombDelay3_reg_re(0 TO 510);
      END IF;
    END IF;
  END PROCESS CombDelay3_process;

  CombDelay3_out1_re <= CombDelay3_reg_re(511);
  CombDelay3_out1_im <= CombDelay3_reg_im(511);

  CombSum3_out1_re <= CombCast3_out1_re - CombDelay3_out1_re;
  CombSum3_out1_im <= CombCast3_out1_im - CombDelay3_out1_im;

  IntSum5_add_cast <= resize(CombSum3_out1_re, 26);
  IntSum5_out1_re <= IntSum5_add_cast + IntDelay5_out1_re;
  IntSum5_add_cast_1 <= resize(CombSum3_out1_im, 26);
  IntSum5_out1_im <= IntSum5_add_cast_1 + IntDelay5_out1_im;

  IntDelay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        IntDelay5_out1_re <= to_signed(2#00000000000000000000000000#, 26);
        IntDelay5_out1_im <= to_signed(2#00000000000000000000000000#, 26);
      ELSIF enb = '1' THEN
        IntDelay5_out1_re <= IntSum5_out1_re;
        IntDelay5_out1_im <= IntSum5_out1_im;
      END IF;
    END IF;
  END PROCESS IntDelay5_process;


  IntSum6_add_cast <= resize(IntDelay5_out1_re, 34);
  IntSum6_out1_re <= IntSum6_add_cast + IntDelay6_out1_re;
  IntSum6_add_cast_1 <= resize(IntDelay5_out1_im, 34);
  IntSum6_out1_im <= IntSum6_add_cast_1 + IntDelay6_out1_im;

  IntDelay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF rst = '1' THEN
        IntDelay6_out1_re <= to_signed(0, 34);
        IntDelay6_out1_im <= to_signed(0, 34);
      ELSIF enb = '1' THEN
        IntDelay6_out1_re <= IntSum6_out1_re;
        IntDelay6_out1_im <= IntSum6_out1_im;
      END IF;
    END IF;
  END PROCESS IntDelay6_process;


  cicgaincomp_out1_re <= resize(IntDelay6_out1_re, 36);
  cicgaincomp_out1_im <= resize(IntDelay6_out1_im, 36);

  dtc_out1_re <= cicgaincomp_out1_re(26 DOWNTO 11) + ('0' & cicgaincomp_out1_re(10));
  dtc_out1_im <= cicgaincomp_out1_im(26 DOWNTO 11) + ('0' & cicgaincomp_out1_im(10));

  SDRDCBlockingFilter_out_re <= std_logic_vector(dtc_out1_re);

  SDRDCBlockingFilter_out_im <= std_logic_vector(dtc_out1_im);

END rtl;

