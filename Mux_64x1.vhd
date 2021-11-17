----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:58 03/06/2018 
-- Design Name: 
-- Module Name:    Mux_64x1 - Behavioral 
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

entity Mux_64x1 is
Port ( 
           DataIN_MUX32x5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel2 : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Mux_64x1;

architecture Behavioral of Mux_64x1 is

signal MUX_DATA_S :STD_LOGIC_VECTOR (31 downto 0);

begin

with sel2 select
			Dout <= 	  DataIN_MUX32x5 when '0',
						  Din  			 when '1',
						  Din 			 when others;





end Behavioral;

