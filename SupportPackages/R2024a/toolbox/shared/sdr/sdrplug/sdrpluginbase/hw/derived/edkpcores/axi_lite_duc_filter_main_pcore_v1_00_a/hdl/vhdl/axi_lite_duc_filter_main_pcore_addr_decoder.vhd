-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_duc_filter_main\axi_lite_duc_filter_main_pcore_addr_decoder.vhd
-- Created: 2014-03-09 13:20:37
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_duc_filter_main_pcore_addr_decoder
-- Source Path: axi_lite_duc_filter_main_pcore/axi_lite_duc_filter_main_pcore_axi_lite/axi_lite_duc_filter_main_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_duc_filter_main_pcore_addr_decoder IS
  PORT( clk_in                            :   IN    std_logic;
        reset_in                          :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_rd_control_reg               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_control_reg              :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END axi_lite_duc_filter_main_pcore_addr_decoder;


ARCHITECTURE rtl OF axi_lite_duc_filter_main_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_rd_control_reg        : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_rd_control_reg_unsigned     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_reg_rd_control_reg          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rd_control_reg         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_wr_control_reg        : std_logic;  -- ufix1
  SIGNAL reg_enb_wr_control_reg           : std_logic;  -- ufix1
  SIGNAL write_reg_wr_control_reg         : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_rd_control_reg <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000001#, 14) ELSE
      '0';

  const_z <= (OTHERS => 'Z');


  read_rd_control_reg_unsigned <= unsigned(read_rd_control_reg);

  const_1 <= '1';

  enb <= const_1;

  reg_rd_control_reg_process : PROCESS (clk_in, reset_in)
  BEGIN
    IF reset_in = '1' THEN
      read_reg_rd_control_reg <= to_unsigned(0, 32);
    ELSIF clk_in'EVENT AND clk_in = '1' THEN
      IF enb = '1' THEN
        read_reg_rd_control_reg <= read_rd_control_reg_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rd_control_reg_process;


  
  decode_rd_rd_control_reg <= const_z WHEN decode_sel_rd_control_reg = '0' ELSE
      read_reg_rd_control_reg;

  data_read <= std_logic_vector(decode_rd_rd_control_reg);

  data_write_unsigned <= unsigned(data_write);

  
  decode_sel_wr_control_reg <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000000#, 14) ELSE
      '0';

  reg_enb_wr_control_reg <= decode_sel_wr_control_reg AND wr_enb;

  reg_wr_control_reg_process : PROCESS (clk_in, reset_in)
  BEGIN
    IF reset_in = '1' THEN
      write_reg_wr_control_reg <= to_unsigned(0, 32);
    ELSIF clk_in'EVENT AND clk_in = '1' THEN
      IF enb = '1' AND reg_enb_wr_control_reg = '1' THEN
        write_reg_wr_control_reg <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_wr_control_reg_process;


  write_wr_control_reg <= std_logic_vector(write_reg_wr_control_reg);

END rtl;

