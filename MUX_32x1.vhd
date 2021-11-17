----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:09 03/13/2018 
-- Design Name: 
-- Module Name:    MUX_32x1 - Behavioral 
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

entity MUX_32x1 is
Port ( 
        Din0 : in  STD_LOGIC_VECTOR (31 downto 0);
		  Din1 : in  STD_LOGIC_VECTOR (31 downto 0);
		  sel : in  STD_LOGIC;
		  MuxOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_32x1;

architecture Behavioral of MUX_32x1 is

begin
with Sel select
			MuxOut <= 	   Din0 when '0',
								Din1 when '1',
								Din0 when others; 

end Behavioral;



