----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:58:02 03/06/2018 
-- Design Name: 
-- Module Name:    Mux_32x5 - Behavioral 
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

entity Mux_32x5 is

Port ( Reg_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_4 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_6 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_8 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_9 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_10 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_11 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_12 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_13 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_14 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_15 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_16 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_17 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_18 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_19 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_20 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_21 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_22 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_23 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_24 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_25 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_26 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_27 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_28 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_29 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (4 downto 0);
           MUX32x5_Out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );

end Mux_32x5;

architecture Behavioral of Mux_32x5 is




begin
with Sel select
 MUX32x5_Out <= Reg_0	when "00000",
				  Reg_1	when "00001",
				  Reg_2	when "00010",
				  Reg_3	when "00011",
				  Reg_4	when "00100",
				  Reg_5	when "00101",
				  Reg_6	when "00110",
				  Reg_7  when "00111",
				  Reg_8  when "01000",
				  Reg_9  when "01001",
				  Reg_10 when "01010",
				  Reg_11 when "01011",
				  Reg_12 when "01100",
				  Reg_13 when "01101",
				  Reg_14 when "01110",
				  Reg_15 when "01111",
				  Reg_16 when "10000",
				  Reg_17 when "10001",
				  Reg_18 when "10010",
				  Reg_19 when "10011",
				  Reg_20 when "10100",
				  Reg_21 when "10101",
				  Reg_22 when "10110",
				  Reg_23 when "10111",
				  Reg_24 when "11000",
				  Reg_25 when "11001",
				  Reg_26 when "11010",
				  Reg_27 when "11011",
				  Reg_28 when "11100",
				  Reg_29 when "11101",
				  Reg_30 when "11110",
				  Reg_31 when "11111",
				  Reg_0  when others;


end Behavioral;

