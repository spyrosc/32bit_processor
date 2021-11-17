
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:28:59 03/06/2018 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity Register_4 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC ;
           WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIc
			 				
			  );
			  
			  
end Register_4;

architecture Behavioral of Register_4 is

signal Data_sig1: STD_LOGIC;




begin

	
process
	begin
	
	wait until CLK 'event and CLK = '1' ;
	
	if (RST='1') then
		Data_sig1 <= '0';
	
	
		
		
	elsif (WE='1') then
		Data_sig1 <= Data1;
		
		
		
	
	end if;
	end process;
	
 Data1_out<=Data_sig1;
 
	
	  
		 
		 
		 
end Behavioral;

