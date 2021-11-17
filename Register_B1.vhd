
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Register_B1 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_B1;

architecture Behavioral of Register_B1 is

signal Data_sig: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";

begin

	
process(CLK)
	begin
	if rising_edge(CLK) then
	
		if (RST='1') then
			Data_sig <= "00000000000000000000000000000000";
			
		elsif (WE='1') then
			Data_sig <= Data;
		
		
		end if;
	end if;
	end process;
	
Dout<=Data_sig;
end Behavioral;
