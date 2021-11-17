--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:31:17 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/spyros/Desktop/HMMY/organwsi_1/TEST_DECstage.vhd
-- Project Name:  organwsi_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
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
 
ENTITY TEST_DECstage IS
END TEST_DECstage;
 
ARCHITECTURE behavior OF TEST_DECstage IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          Clk => Clk,
          Reset => Reset,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		Reset <= '1';
		wait for Clk_period*3;
		Reset <= '0';
		wait for Clk_period*3;
		
		
		
		Instr <= "11100000011001010000000001110011"; --Sign Extend
		ALU_out <= "00111000000000010001110001000000";
		MEM_out <= "00000001110000000000111110100000";
		RF_WrData_sel <= '0';
		RF_WrEn		  <= '1';
		RF_B_sel<='1';
		wait for 200 ns;
		
		
		
		Instr <= "11001000011001011111111111111111"; --Zero Fill
		ALU_out <= "00111000001100010001110001000000";
		MEM_out <= "01100001110000000000111110100000";
		RF_WrData_sel <= '0';
		RF_WrEn		  <= '1';
		RF_B_sel<='1';
		wait for 200 ns;
		
		
		
		Instr <= "11100100011001010011110011100011";  --Imm<<16(zero-fill)
		ALU_out <= "00111011000110010001110001000000";
		MEM_out <= "00110001110000000000111110100000";
		RF_WrData_sel <= '0';
		RF_WrEn		  <= '1';
		RF_B_sel<='0';
		wait for 200 ns;
		
		
		Instr <= "11111100011001000011100100111011"; --Sign Extend << 2
		RF_WrEn		  <= '0';
		wait for 200 ns;
		
      wait;
   end process;

END;
