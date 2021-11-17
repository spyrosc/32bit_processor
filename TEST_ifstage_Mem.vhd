--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:47:28 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/spyros/Desktop/HMMY/organwsi_1/TEST_ifstage_Mem.vhd
-- Project Name:  organwsi_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ifstage_Ram_top
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
 
ENTITY TEST_ifstage_Mem IS
END TEST_ifstage_Mem;
 
ARCHITECTURE behavior OF TEST_ifstage_Mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ifstage_Ram_top
    PORT(
         PC_Immed : IN  std_logic_vector(31 downto 0);
         PC_Sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Instr : OUT  std_logic_vector(31 downto 0);
         Mem_WrEn : IN  std_logic;
         ALU_MEM_ADDR : IN  std_logic_vector(31 downto 0);
         data_din : IN  std_logic_vector(31 downto 0);
         MEM_DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_Sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Mem_WrEn : std_logic := '0';
   signal ALU_MEM_ADDR : std_logic_vector(31 downto 0) := (others => '0');
   signal data_din : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Instr : std_logic_vector(31 downto 0);
   signal MEM_DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ifstage_Ram_top PORT MAP (
          PC_Immed => PC_Immed,
          PC_Sel => PC_Sel,
          PC_LdEn => PC_LdEn,
          Reset => Reset,
          Clk => Clk,
          Instr => Instr,
          Mem_WrEn => Mem_WrEn,
          ALU_MEM_ADDR => ALU_MEM_ADDR,
          data_din => data_din,
          MEM_DataOut => MEM_DataOut
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
	     
		  
--		  Reset <='1';
--	     wait for 50 ns;	  	      
--	      
--        PC_Immed <= "00000000000000000000000000000000";
--		  PC_sel	<= '0';
--		  PC_LdEn <= '1';
--        Reset <='0';
--		  Mem_WrEn 	 <= '0';
--        ALU_MEM_Addr <= "00000000000000000000000000000000";
--        data_din <= "00000000000000000000000000000000";
	     
	
	
     
      	
		   
			Reset <='1';
	     wait for 50 ns;	  	      
	      
        PC_Immed <= "00000000000000000000000000000100";
		  PC_sel	<= '1';
		  PC_LdEn <= '0';
        Reset <='0';
		  Mem_WrEn 	 <= '1';
        ALU_MEM_Addr <= "00000000000000000000000000000011";
        data_din <= "00000000000000000000000011110000";
	     wait for 200 ns;	
		
		 PC_Immed <= "00000000000000000000000000000100";
		  PC_sel	<= '1';
		  PC_LdEn <= '0';
        Reset <='0';
		  Mem_WrEn 	 <= '1';
        ALU_MEM_Addr <= "00000000000000000000000000011011";
        data_din <= "11100000000011100000000011000000";
	     wait for 200 ns;	
		
		 
		  PC_sel	<= '1';
		  PC_LdEn <= '0';
        Reset <='0';
		  Mem_WrEn 	 <= '0';
        ALU_MEM_Addr <= "00000000000000000000000000000011";
        data_din <= "00000000000000000000000000000000";
	     wait for 200 ns;	
		
		

    
      wait;
   end process;

END;
