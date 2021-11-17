----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:44 03/06/2018 
-- Design Name: 
-- Module Name:    Compare_module - Behavioral 
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

entity Compare_module is
 Port ( 
           WriteEn : in  STD_LOGIC;
           AddRead : in  STD_LOGIC_VECTOR (4 downto 0);
           AddWrite : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel2 : out  STD_LOGIC);

end Compare_module;

architecture Behavioral of Compare_module is

signal sel_sig :STD_LOGIC;

begin


 Sel2 <= '1' when (AddWrite = AddRead) and (WriteEn = '1') and (AddWrite /= "00000") else '0';




end Behavioral;

