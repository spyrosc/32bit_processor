----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:36:26 05/22/2018 
-- Design Name: 
-- Module Name:    mux2_pc - Behavioral 
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

entity mux2_pc is
end mux2_pc;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:55 05/21/2018 
-- Design Name: 
-- Module Name:    mux_10_4bit - Behavioral 
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



entity mux3_pc is
port(     data1 : in  STD_LOGIC_VECTOR (31 downto 0);
          data2 : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC;
          Data_out : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end mux3_pc;


architecture Behavioral of mux3_pc is

signal MUX_DATA_S : STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";

begin

with sel select
			MUX_DATA_S <=  data1 when '0',
						  data2  when '1',
						    data2 when others;
							
Data_out	<=	MUX_DATA_S;		
	
end Behavioral;






