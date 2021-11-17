--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:02:55 05/22/2018
-- Design Name:   
-- Module Name:   C:/Users/benmalef/Desktop/lab5a/organwsi_1/test_lab6.vhd
-- Project Name:  organwsi_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_6
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
 
ENTITY test_lab6 IS
END test_lab6;
 
ARCHITECTURE behavior OF test_lab6 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_6
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Data1 : IN  std_logic_vector(31 downto 0);
         Data2 : IN  std_logic_vector(31 downto 0);
         Data3 : IN  std_logic_vector(31 downto 0);
         Data4 : IN  std_logic_vector(31 downto 0);
         Data5 : IN  std_logic_vector(31 downto 0);
         Data6 : IN  std_logic_vector(31 downto 0);
         WE : IN  std_logic;
         Data1_out : OUT  std_logic_vector(31 downto 0);
         Data2_out : OUT  std_logic_vector(31 downto 0);
         Data3_out : OUT  std_logic_vector(31 downto 0);
         Data4_out : OUT  std_logic_vector(31 downto 0);
         Data5_out : OUT  std_logic_vector(31 downto 0);
         Data6_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Data3 : std_logic_vector(31 downto 0) := (others => '0');
   signal Data4 : std_logic_vector(31 downto 0) := (others => '0');
   signal Data5 : std_logic_vector(31 downto 0) := (others => '0');
   signal Data6 : std_logic_vector(31 downto 0) := (others => '0');
   signal WE : std_logic := '0';

 	--Outputs
   signal Data1_out : std_logic_vector(31 downto 0);
   signal Data2_out : std_logic_vector(31 downto 0);
   signal Data3_out : std_logic_vector(31 downto 0);
   signal Data4_out : std_logic_vector(31 downto 0);
   signal Data5_out : std_logic_vector(31 downto 0);
   signal Data6_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_6 PORT MAP (
          CLK => CLK,
          RST => RST,
          Data1 => Data1,
          Data2 => Data2,
          Data3 => Data3,
          Data4 => Data4,
          Data5 => Data5,
          Data6 => Data6,
          WE => WE,
          Data1_out => Data1_out,
          Data2_out => Data2_out,
          Data3_out => Data3_out,
          Data4_out => Data4_out,
          Data5_out => Data5_out,
          Data6_out => Data6_out
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
