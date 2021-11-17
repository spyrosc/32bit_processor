----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:53:09 03/26/2018 
-- Design Name: 
-- Module Name:    Byte_Module - Behavioral 
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

entity Byte_Module is
Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Byte_Module;

architecture Behavioral of Byte_Module is

begin
	process(Sel,Din)
	begin
	
	if (Sel = '1') then
		Dout(31 downto 8) <= "000000000000000000000000";
		Dout( 7 downto 0) <= Din(7 downto 0);
	else
		Dout <= Din;
	end if;
	
	end process;


end Behavioral;

