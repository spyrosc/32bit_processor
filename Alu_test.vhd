--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:26:51 03/07/2018
-- Design Name:   
-- Module Name:   C:/Users/spyros/Desktop/HMMY/organwsi_1/Alu_test.vhd
-- Project Name:  organwsi_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY Alu_test IS
END Alu_test;
 
ARCHITECTURE behavior OF Alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Output => Output,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     -- Apla Pros8esh:
		A <= "00000000000000000000000000001111";
		B <= "00000000000000000001111000000000";
		Op <="0000";
		wait for 100 ns;	
		
		--Pros8esh me Overflow 
		A <= "01111111111111111111111111111111";
		B <= "01111111111111111111111111111111";
		Op <="0000";
		wait for 100 ns;
		
	   --Pros8esh me Carry
		A <= "01111111111111111111111111111111";
		B <= "11111111111111111111111111111111";
		Op <="0000";
		wait for 100 ns;
		
		--Pros8esh me Overflow kai Carry
		A <= "10111100000000000000000000000000";
		B <= "10110100000000000000000000000000";
		Op <="0000";
		wait for 100 ns;
		
		--Zero	
		A <= "00000000000000000000000000000000";
		B <= "00000000000000000000000000000000";
		Op <="0000";
		wait for 100 ns;
		
		---Aplh Afairesh:
		A <= "00011100000111100000000000001111";
		B <= "00001110000011110001111000000000";
		Op <="0001";
		wait for 100 ns;
	
   	---Afairesh me Overflow kai Carry
		A <= "01110000000000000000000000000000";--- 
		B <= "10100000000000000000000000000000";--- 
		Op <="0001";
		wait for 100 ns;
		
		--AND
		A <= "00000000000000000011100000001111";
		B <= "00000000000000000001111000000000";
		Op <="0010";
		wait for 100 ns;
		
		--OR
		A <= "00000000000000000011100000001111";
		B <= "00000000000000000001111000000000";
		Op <="0011";
		wait for 100 ns;
		
		--NOT
		A <= "01110000011000000011100000001111";
		Op <="0100";
		wait for 100 ns;
		
		--Arithmetic Right Shift
		A <= "00000000000000000011100000001111";
		Op <="1000";
		wait for 100 ns;
		
		--Logic Right Shift
		A <= "00000000000000000011100000001111";
		Op <="1001";
		wait for 100 ns;
		
		--Logic Left Shift
		A <= "00000000000000000011100000001111";
		Op <="1010";
		wait for 100 ns;
		
		--Circle Left Rotate
		A <= "00000000000000000011100000001111";
		Op <="1100";
		wait for 100 ns;
	
	   --Circle Right Rotate
		A <= "00000000000000000011100000001111";
		Op <="1101";
		wait for 100 ns;
     

      wait;
   end process;

END;
