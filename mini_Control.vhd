----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:46 05/07/2018 
-- Design Name: 
-- Module Name:    mini_Control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mini_Control is
Port (  
			  RST : in STD_LOGIC;
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Control_Out : out  STD_LOGIC_VECTOR (1 downto 0)
			  );
			  


end mini_Control;

architecture Behavioral of mini_Control is
signal Opcode,Func : STD_LOGIC_VECTOR (5 downto 0);
signal pc_load,sel : STD_LOGIC;
signal signal_Control_Out :STD_LOGIC_VECTOR (1 downto 0);
begin
process(RST,Instr,pc_load,sel)
	begin
		
	if (RST='1') then
		  sel<='0';
			  pc_load<='0';
		else
		 
			  if(Instr(31 downto 26) = "100000") then -- add
			  
			  sel<='0';
			  pc_load<='1';
			  elsif (Instr(31 downto 26) = "011111") then -- sw
			  sel<='1';
			  pc_load<='1';
			  else 
			 	  sel<='0';
			  pc_load<='1';
	end if ;
	end if ;
	end process;
	
	Control_Out(0)<=sel;
	Control_Out(1)<=pc_load;
	
	
end Behavioral;

