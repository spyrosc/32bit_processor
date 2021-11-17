--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:26:16 03/07/2018
-- Design Name:   
-- Module Name:   C:/Users/spyros/Desktop/HMMY/organwsi_1/Test_register_file.vhd
-- Project Name:  organwsi_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY Test_register_file IS
END Test_register_file;
 
ARCHITECTURE behavior OF Test_register_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WrEn : IN  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          Dout1 => Dout1,
          Dout2 => Dout2,
          Din => Din,
          WrEn => WrEn,
          CLK => CLK,
          RST => RST
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
-- reset
	 RST<='1';
	 wait for 50 ns;
	 
	 RST<='0';
	 wait for 50 ns;
	 
	 
	  
	  --grafoume ston register 1
		Ard1 <= "00000"; 
		Ard2 <= "00000"; 
		Awr  <= "00001"; 
		Din  <= "00000000000000000000000001111111"; 
		WrEn <= '1';  
      wait for 200 ns;
		
    -- diabazoume to register 1 		
		Ard1 <= "00001"; 
		Ard2 <= "00000"; 
		Awr  <= "00000"; 
		Din  <= "00000000000000000000000001111111"; 
		WrEn <= '0'; 
		wait for 200 ns;
		--grafoume ston register 3
		Ard1 <= "00000"; 
		Ard2 <= "00000"; 
		Awr  <= "00011"; 
		Din  <= "11110000000000000000000001111111"; 
		WrEn <= '1'; 
      wait for 200 ns;
		
		
		
		
		--diavazoume ton register 1 kai 3
		Ard1 <= "00001"; 
		Ard2 <= "00011"; 
		Awr  <= "00000"; 
		Din  <= "11110000000000000000000001111111"; 
		WrEn <= '0'; 
      wait for 100 ns;
--		
--		Ard1 <= "00000";
--		Ard2 <= "00000";
--		Awr  <= "00100";
--		Din  <= "11100000000000100011111100010000";  
--		WrEn <= '1';
--      wait for 200 ns;
--		
--		
--		--diavazoume kai grafoume tautoxrona sto register 4 
--		Ard1 <= "00100";
--		Ard2 <= "00000";
--		Awr  <= "00100";
--		Din  <= "00000011100011100011111100010000";  
--		WrEn <= '1';
--      wait for 100 ns;
--		
		
	
		

      

      -- insert stimulus here 

      wait;
   end process;

END;