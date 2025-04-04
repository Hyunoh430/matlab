-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_NCO\axi_lite_nco_pcore_addr_decoder.vhd
-- Created: 2014-01-21 14:23:43
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_nco_pcore_addr_decoder
-- Source Path: axi_lite_nco_pcore/axi_lite_nco_pcore_axi_lite/axi_lite_nco_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_nco_pcore_addr_decoder IS
  PORT( clk_in                            :   IN    std_logic;
        reset_in                          :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_rd_NCOinc                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_debugNCO                  :   IN    std_logic;  -- ufix1
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_NCOinc                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_debugNCO                 :   OUT   std_logic  -- ufix1
        );
END axi_lite_nco_pcore_addr_decoder;


ARCHITECTURE rtl OF axi_lite_nco_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_rd_NCOinc             : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_rd_NCOinc_unsigned          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL decode_sel_rd_debugNCO           : std_logic;  -- ufix1
  SIGNAL read_reg_rd_NCOinc               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rd_NCOinc              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_rd_debugNCO             : std_logic;  -- ufix1
  SIGNAL data_in_rd_debugNCO              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rd_debugNCO            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_wr_NCOinc             : std_logic;  -- ufix1
  SIGNAL reg_enb_wr_NCOinc                : std_logic;  -- ufix1
  SIGNAL write_reg_wr_NCOinc              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_wr_debugNCO              : std_logic;  -- ufix1
  SIGNAL decode_sel_wr_debugNCO           : std_logic;  -- ufix1
  SIGNAL reg_enb_wr_debugNCO              : std_logic;  -- ufix1
  SIGNAL write_reg_wr_debugNCO            : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_rd_NCOinc <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000001#, 14) ELSE
      '0';

  const_z <= (OTHERS => 'Z');


  read_rd_NCOinc_unsigned <= unsigned(read_rd_NCOinc);

  const_1 <= '1';

  enb <= const_1;

  
  decode_sel_rd_debugNCO <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000011#, 14) ELSE
      '0';

  reg_rd_NCOinc_process : PROCESS (clk_in, reset_in)
  BEGIN
    IF reset_in = '1' THEN
      read_reg_rd_NCOinc <= to_unsigned(0, 32);
    ELSIF clk_in'EVENT AND clk_in = '1' THEN
      IF enb = '1' THEN
        read_reg_rd_NCOinc <= read_rd_NCOinc_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rd_NCOinc_process;


  
  decode_rd_rd_NCOinc <= const_z WHEN decode_sel_rd_NCOinc = '0' ELSE
      read_reg_rd_NCOinc;

  reg_rd_debugNCO_process : PROCESS (clk_in, reset_in)
  BEGIN
    IF reset_in = '1' THEN
      read_reg_rd_debugNCO <= '0';
    ELSIF clk_in'EVENT AND clk_in = '1' THEN
      IF enb = '1' THEN
        read_reg_rd_debugNCO <= read_rd_debugNCO;
      END IF;
    END IF;
  END PROCESS reg_rd_debugNCO_process;


  data_in_rd_debugNCO <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_rd_debugNCO;

  
  decode_rd_rd_debugNCO <= decode_rd_rd_NCOinc WHEN decode_sel_rd_debugNCO = '0' ELSE
      data_in_rd_debugNCO;

  data_read <= std_logic_vector(decode_rd_rd_debugNCO);

  data_write_unsigned <= unsigned(data_write);

  
  decode_sel_wr_NCOinc <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000000#, 14) ELSE
      '0';

  reg_enb_wr_NCOinc <= decode_sel_wr_NCOinc AND wr_enb;

  reg_wr_NCOinc_process : PROCESS (clk_in, reset_in)
  BEGIN
    IF reset_in = '1' THEN
      write_reg_wr_NCOinc <= to_unsigned(0, 32);
    ELSIF clk_in'EVENT AND clk_in = '1' THEN
      IF enb = '1' AND reg_enb_wr_NCOinc = '1' THEN
        write_reg_wr_NCOinc <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_wr_NCOinc_process;


  write_wr_NCOinc <= std_logic_vector(write_reg_wr_NCOinc);

  data_in_wr_debugNCO <= data_write_unsigned(0);

  
  decode_sel_wr_debugNCO <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000010#, 14) ELSE
      '0';

  reg_enb_wr_debugNCO <= decode_sel_wr_debugNCO AND wr_enb;

  reg_wr_debugNCO_process : PROCESS (clk_in, reset_in)
  BEGIN
    IF reset_in = '1' THEN
      write_reg_wr_debugNCO <= '0';
    ELSIF clk_in'EVENT AND clk_in = '1' THEN
      IF enb = '1' AND reg_enb_wr_debugNCO = '1' THEN
        write_reg_wr_debugNCO <= data_in_wr_debugNCO;
      END IF;
    END IF;
  END PROCESS reg_wr_debugNCO_process;


  write_wr_debugNCO <= write_reg_wr_debugNCO;

END rtl;

