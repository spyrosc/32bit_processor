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

entity mux_Stall is
Port ( 
            Din1 : in  STD_LOGIC;
           Din2 : in  STD_LOGIC;
           Sel2 : in  STD_LOGIC;
           Dout : out  STD_LOGIC
			  );
end mux_Stall;

architecture Behavioral of mux_Stall is


begin

with sel2 select
			Dout <= 	  Din1   when '0',
						  Din2  			 when '1',
						  Din1 			 when others;





end Behavioral;
