----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:11 03/12/2018 
-- Design Name: 
-- Module Name:    fdsdfs - Behavioral 
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

entity Mux_WrData is
Port ( 
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           WrDATA_sel : in  STD_LOGIC;
           WrDATA : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Mux_WrData;

architecture Behavioral of Mux_WrData is

signal MUX_DATA_S : STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";

begin

with WrDATA_sel select
			MUX_DATA_S <=  ALU_out when '1',
						  MEM_out  when '0',
						   ALU_out  when others;
							
	WrDATA<=	MUX_DATA_S;					
end Behavioral;

