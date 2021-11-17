----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:06:08 05/09/2018 
-- Design Name: 
-- Module Name:    Stall_module - Behavioral 
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

entity Stall_module is
port (
         
			  opcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  Rs_1: in  STD_LOGIC_VECTOR (4 downto 0);
			  Rt_Dec_Ex :in  STD_LOGIC_VECTOR (4 downto 0);
			  rt :in  STD_LOGIC_VECTOR (4 downto 0);
			  sel :out  STD_LOGIC;
			  sel_1:out  STD_LOGIC;
			  sel_2:out  STD_LOGIC);

end Stall_module;

architecture Behavioral of Stall_module is

signal signal_RF_WrEn,signal_MEM_WrEn,signal_Pc_Ldn : STD_LOGIC;
begin

process(opcode,Rs_1,signal_RF_WrEn,signal_MEM_WrEn,signal_Pc_Ldn,Rt_Dec_Ex)
	begin

if((opcode="001111") and (Rs_1=Rt_Dec_Ex  or Rt_Dec_Ex=rt ))then			
			signal_RF_WrEn	<= '0';	
			signal_MEM_WrEn	<= '0';
			signal_Pc_Ldn<= '0';
			
		else
     signal_Pc_Ldn <= '1';
     signal_MEM_WrEn<= '1';	
     signal_RF_WrEn<= '1';
 end if ;
 
end process;

           sel <=signal_RF_WrEn;
			  sel_1<=signal_MEM_WrEn;
			  sel_2 <=signal_Pc_Ldn;
end Behavioral;

