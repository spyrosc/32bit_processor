----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:24 03/12/2018 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
 Port ( 
           Mux_IF_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC_Out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end PC;

architecture Behavioral of PC is

signal temp : STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";

begin

process
	begin
	
	wait until CLK ' event and CLK = '1';
	
	if(Reset='1') then
		temp <="00000000000000000000000000000000";
	elsif (PC_LdEn='1') then
		temp <= Mux_IF_Out;
	else
		temp<=temp;
	end if;
  
  end process;

PC_Out <= temp;

end Behavioral;

