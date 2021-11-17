----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:09 03/12/2018 
-- Design Name: 
-- Module Name:    Mux_if_2x1 - Behavioral 
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

entity Mux_if_2x1 is
 Port ( 
           PC_Sel : in  STD_LOGIC;
           Adder_Imm : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder4 : in  STD_LOGIC_VECTOR (31 downto 0);
           MuxOut : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Mux_if_2x1;

architecture Behavioral of Mux_if_2x1 is

begin

with PC_Sel select
			MuxOut <= 	   Adder4 when '0',
								Adder_Imm  when '1',
								Adder4 when others; 


end Behavioral;

