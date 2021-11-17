--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:42:22 05/08/2018
-- Design Name:   
-- Module Name:   C:/Users/benmalef/Desktop/tuc/organwsi/organwsi 2018/lab 3/lab_5_ben/organwsi_1/test_final.vhd
-- Project Name:  organwsi_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab_5_datapath
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_final IS
END test_final;
 
ARCHITECTURE behavior OF test_final IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab_5_datapath
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         RST_R : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST_R : std_logic := '0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab_5_datapath PORT MAP (
          RST => RST,
          CLK => CLK,
          RST_R => RST_R
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       RST <='1';
         RST_R <='1';

      wait for CLK_period*3;
		
		  RST <='0';
         RST_R <='0';

      wait for CLK_period*2;
		
		 RST <='0';
         RST_R <='0';

      

     
      wait;
   end process;

END;
