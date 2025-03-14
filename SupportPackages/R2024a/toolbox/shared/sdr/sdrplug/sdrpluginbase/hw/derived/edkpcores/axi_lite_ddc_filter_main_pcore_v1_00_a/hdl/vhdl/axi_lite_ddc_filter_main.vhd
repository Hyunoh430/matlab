-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\axi_lite_ddc_filter_main\axi_lite_ddc_filter_main.vhd
-- Created: 2013-07-31 17:17:03
-- 
-- Generated by MATLAB 8.2 and HDL Coder 3.3
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 0.2
-- Target subsystem base rate: 0.2
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: axi_lite_ddc_filter_main
-- Source Path: axi_lite_ddc_filter_main
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY axi_lite_ddc_filter_main IS
  PORT( clk                               :   IN    std_logic;  -- ufix1
        clk_enable                        :   IN    std_logic;  -- ufix1
        reset                             :   IN    std_logic;  -- ufix1
        wr_control_reg                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        filter_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix14
        filter_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix14
        ce_out                            :   OUT   std_logic;  -- ufix1
        filter_out_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        filter_out_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        rd_control_reg                    :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END axi_lite_ddc_filter_main;


ARCHITECTURE rtl OF axi_lite_ddc_filter_main IS

  COMPONENT SDRDDCMain IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in_re                    :   IN    std_logic_vector(13 DOWNTO 0); -- sfix14
         filter_in_im                    :   IN    std_logic_vector(13 DOWNTO 0); -- sfix14         
         cic_enable                      :   IN    std_logic;
         hb1_enable                      :   IN    std_logic;
         hb2_enable                      :   IN    std_logic;
         rate                            :   IN    std_logic_vector(7 DOWNTO 0); -- ufix8
        -- load_rate                       :   IN    std_logic; 
         cicfinegain                     :   IN    std_logic_vector(15 DOWNTO 0);
         filter_out_re                   :   OUT   std_logic_vector(15 DOWNTO 0); -- sfix16
         filter_out_im                   :   OUT   std_logic_vector(15 DOWNTO 0); -- sfix16
         ce_out                          :   OUT   std_logic  
         );
	END COMPONENT;
	
    -- Signals
    signal wr_control_reg_sync1 : std_logic_vector(31 downto 0);
    signal wr_control_reg_sync2 : std_logic_vector(31 downto 0);
	signal wr_control_reg_final : std_logic_vector(31 downto 0);


BEGIN

 u_SDRDDCMain: SDRDDCMain
    PORT MAP (
		clk          	=> clk,
		clk_enable     => clk_enable,
		reset     		=> reset,
		filter_in_re	=> filter_in_re(13 downto 0),
		filter_in_im	=> filter_in_im(13 downto 0),
		cic_enable  	=> wr_control_reg_final(24),
		hb1_enable  	=> wr_control_reg_final(25),
		hb2_enable  	=> wr_control_reg_final(26),
		rate        	=> wr_control_reg_final(23 downto 16),
		cicfinegain 	=> wr_control_reg_final(15 downto 0),
		filter_out_re	=> filter_out_re,
		filter_out_im	=> filter_out_im,
		ce_out       	=> ce_out
		);
    -- signal sync
    process(clk)
    begin
        if clk'event and clk = '1' then
            wr_control_reg_sync1 <= wr_control_reg;
            wr_control_reg_sync2 <= wr_control_reg_sync1;
            if wr_control_reg_sync2  = wr_control_reg_sync1 then
                wr_control_reg_final  <= wr_control_reg_sync2;
            end if;
        end if;
    end process;
  
  rd_control_reg <= wr_control_reg;
END rtl;
