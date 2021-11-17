
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_Control is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  Excep : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (17 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (17 downto 0));
end Register_Control;

architecture Behavioral of Register_Control is

signal Data_sig: STD_LOGIC_VECTOR (17 downto 0);

begin

	
process(CLK)
	begin
	if rising_edge(CLK) then
	
	if (RST='1' or Excep ='1' ) then
		Data_sig <= "000000000000000000";
		
		
	elsif (WE='1') then
		Data_sig <= Data;
	
	
	end if;
	end if;
	end process;
	
Dout<=Data_sig;
end Behavioral;

