-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/axi_lite_data_verifier_if/axi_lite_data_verifier_if_pcore_addr_decoder.vhd
-- Created: 2015-02-10 12:42:51
-- 
-- Generated by MATLAB 8.5 and HDL Coder 3.6
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_data_verifier_if_pcore_addr_decoder
-- Source Path: axi_lite_data_verifier_if_pcore/axi_lite_data_verifier_if_pcore_axi_lite/axi_lite_data_verifier_if_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_data_verifier_if_pcore_addr_decoder IS
  PORT( axi_clk                           :   IN    std_logic;
        axi_rst                           :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_rd_count_reg                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_status_reg                :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch1_0                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch1_1                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch1_2                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch1_3                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch1_4                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch2_0                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch2_1                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch2_2                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch2_3                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_ch2_4                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_rd_cntmax                    :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_rst_reg                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_wr_cntmax                   :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16
        );
END axi_lite_data_verifier_if_pcore_addr_decoder;


ARCHITECTURE rtl OF axi_lite_data_verifier_if_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_rd_count_reg          : std_logic;  -- ufix1
  SIGNAL read_rd_count_reg_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_rd_status_reg_unsigned      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch1_0_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch1_1_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch1_2_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch1_3_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch1_4_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch2_0_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch2_1_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch2_2_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch2_3_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ch2_4_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_rd_cntmax_unsigned          : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL decode_sel_rd_cntmax             : std_logic;  -- ufix1
  SIGNAL decode_sel_ch2_4                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch2_3                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch2_2                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch2_1                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch2_0                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch1_4                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch1_3                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch1_2                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch1_1                 : std_logic;  -- ufix1
  SIGNAL decode_sel_ch1_0                 : std_logic;  -- ufix1
  SIGNAL decode_sel_rd_status_reg         : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_rd_count_reg            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rd_count_reg           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_rd_status_reg           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rd_status_reg          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch1_0                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch1_0                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch1_1                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch1_1                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch1_2                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch1_2                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch1_3                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch1_3                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch1_4                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch1_4                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch2_0                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch2_0                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch2_1                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch2_1                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch2_2                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch2_2                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch2_3                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch2_3                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ch2_4                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ch2_4                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_rd_cntmax               : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_in_rd_cntmax                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rd_cntmax              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_wr_rst_reg            : std_logic;  -- ufix1
  SIGNAL reg_enb_wr_rst_reg               : std_logic;  -- ufix1
  SIGNAL write_reg_wr_rst_reg             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_wr_cntmax                : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL decode_sel_wr_cntmax             : std_logic;  -- ufix1
  SIGNAL reg_enb_wr_cntmax                : std_logic;  -- ufix1
  SIGNAL write_reg_wr_cntmax              : unsigned(15 DOWNTO 0);  -- ufix16

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_rd_count_reg <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  read_rd_count_reg_unsigned <= unsigned(read_rd_count_reg);

  const_1 <= '1';

  enb <= const_1;

  read_rd_status_reg_unsigned <= unsigned(read_rd_status_reg);

  read_ch1_0_unsigned <= unsigned(read_ch1_0);

  read_ch1_1_unsigned <= unsigned(read_ch1_1);

  read_ch1_2_unsigned <= unsigned(read_ch1_2);

  read_ch1_3_unsigned <= unsigned(read_ch1_3);

  read_ch1_4_unsigned <= unsigned(read_ch1_4);

  read_ch2_0_unsigned <= unsigned(read_ch2_0);

  read_ch2_1_unsigned <= unsigned(read_ch2_1);

  read_ch2_2_unsigned <= unsigned(read_ch2_2);

  read_ch2_3_unsigned <= unsigned(read_ch2_3);

  read_ch2_4_unsigned <= unsigned(read_ch2_4);

  read_rd_cntmax_unsigned <= unsigned(read_rd_cntmax);

  
  decode_sel_rd_cntmax <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004E#, 14) ELSE
      '0';

  
  decode_sel_ch2_4 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004C#, 14) ELSE
      '0';

  
  decode_sel_ch2_3 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004B#, 14) ELSE
      '0';

  
  decode_sel_ch2_2 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004A#, 14) ELSE
      '0';

  
  decode_sel_ch2_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0049#, 14) ELSE
      '0';

  
  decode_sel_ch2_0 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0048#, 14) ELSE
      '0';

  
  decode_sel_ch1_4 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0047#, 14) ELSE
      '0';

  
  decode_sel_ch1_3 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0046#, 14) ELSE
      '0';

  
  decode_sel_ch1_2 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0045#, 14) ELSE
      '0';

  
  decode_sel_ch1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  
  decode_sel_ch1_0 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  
  decode_sel_rd_status_reg <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_rd_count_reg_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_rd_count_reg <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_rd_count_reg <= read_rd_count_reg_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rd_count_reg_process;


  
  decode_rd_rd_count_reg <= const_0 WHEN decode_sel_rd_count_reg = '0' ELSE
      read_reg_rd_count_reg;

  reg_rd_status_reg_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_rd_status_reg <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_rd_status_reg <= read_rd_status_reg_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rd_status_reg_process;


  
  decode_rd_rd_status_reg <= decode_rd_rd_count_reg WHEN decode_sel_rd_status_reg = '0' ELSE
      read_reg_rd_status_reg;

  reg_ch1_0_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch1_0 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch1_0 <= read_ch1_0_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch1_0_process;


  
  decode_rd_ch1_0 <= decode_rd_rd_status_reg WHEN decode_sel_ch1_0 = '0' ELSE
      read_reg_ch1_0;

  reg_ch1_1_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch1_1 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch1_1 <= read_ch1_1_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch1_1_process;


  
  decode_rd_ch1_1 <= decode_rd_ch1_0 WHEN decode_sel_ch1_1 = '0' ELSE
      read_reg_ch1_1;

  reg_ch1_2_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch1_2 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch1_2 <= read_ch1_2_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch1_2_process;


  
  decode_rd_ch1_2 <= decode_rd_ch1_1 WHEN decode_sel_ch1_2 = '0' ELSE
      read_reg_ch1_2;

  reg_ch1_3_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch1_3 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch1_3 <= read_ch1_3_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch1_3_process;


  
  decode_rd_ch1_3 <= decode_rd_ch1_2 WHEN decode_sel_ch1_3 = '0' ELSE
      read_reg_ch1_3;

  reg_ch1_4_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch1_4 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch1_4 <= read_ch1_4_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch1_4_process;


  
  decode_rd_ch1_4 <= decode_rd_ch1_3 WHEN decode_sel_ch1_4 = '0' ELSE
      read_reg_ch1_4;

  reg_ch2_0_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch2_0 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch2_0 <= read_ch2_0_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch2_0_process;


  
  decode_rd_ch2_0 <= decode_rd_ch1_4 WHEN decode_sel_ch2_0 = '0' ELSE
      read_reg_ch2_0;

  reg_ch2_1_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch2_1 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch2_1 <= read_ch2_1_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch2_1_process;


  
  decode_rd_ch2_1 <= decode_rd_ch2_0 WHEN decode_sel_ch2_1 = '0' ELSE
      read_reg_ch2_1;

  reg_ch2_2_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch2_2 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch2_2 <= read_ch2_2_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch2_2_process;


  
  decode_rd_ch2_2 <= decode_rd_ch2_1 WHEN decode_sel_ch2_2 = '0' ELSE
      read_reg_ch2_2;

  reg_ch2_3_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch2_3 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch2_3 <= read_ch2_3_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch2_3_process;


  
  decode_rd_ch2_3 <= decode_rd_ch2_2 WHEN decode_sel_ch2_3 = '0' ELSE
      read_reg_ch2_3;

  reg_ch2_4_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_ch2_4 <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ch2_4 <= read_ch2_4_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ch2_4_process;


  
  decode_rd_ch2_4 <= decode_rd_ch2_3 WHEN decode_sel_ch2_4 = '0' ELSE
      read_reg_ch2_4;

  reg_rd_cntmax_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      read_reg_rd_cntmax <= to_unsigned(16#0000#, 16);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' THEN
        read_reg_rd_cntmax <= read_rd_cntmax_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rd_cntmax_process;


  data_in_rd_cntmax <= resize(read_reg_rd_cntmax, 32);

  
  decode_rd_rd_cntmax <= decode_rd_ch2_4 WHEN decode_sel_rd_cntmax = '0' ELSE
      data_in_rd_cntmax;

  data_read <= std_logic_vector(decode_rd_rd_cntmax);

  data_write_unsigned <= unsigned(data_write);

  
  decode_sel_wr_rst_reg <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_wr_rst_reg <= decode_sel_wr_rst_reg AND wr_enb;

  reg_wr_rst_reg_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      write_reg_wr_rst_reg <= to_unsigned(0, 32);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' AND reg_enb_wr_rst_reg = '1' THEN
        write_reg_wr_rst_reg <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_wr_rst_reg_process;


  write_wr_rst_reg <= std_logic_vector(write_reg_wr_rst_reg);

  data_in_wr_cntmax <= data_write_unsigned(15 DOWNTO 0);

  
  decode_sel_wr_cntmax <= '1' WHEN addr_sel_unsigned = to_unsigned(16#004D#, 14) ELSE
      '0';

  reg_enb_wr_cntmax <= decode_sel_wr_cntmax AND wr_enb;

  reg_wr_cntmax_process : PROCESS (axi_clk, axi_rst)
  BEGIN
    IF axi_rst = '1' THEN
      write_reg_wr_cntmax <= to_unsigned(16#7FFF#, 16);
    ELSIF axi_clk'EVENT AND axi_clk = '1' THEN
      IF enb = '1' AND reg_enb_wr_cntmax = '1' THEN
        write_reg_wr_cntmax <= data_in_wr_cntmax;
      END IF;
    END IF;
  END PROCESS reg_wr_cntmax_process;


  write_wr_cntmax <= std_logic_vector(write_reg_wr_cntmax);

END rtl;

