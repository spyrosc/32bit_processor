----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:06 03/13/2018 
-- Design Name: 
-- Module Name:    Decoder_logic - Behavioral 
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

entity Decoder_logic is
 Port ( 
           Opp : in  STD_LOGIC_VECTOR (5 downto 0);
           Instr_15_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           Dec_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Decoder_logic;

architecture Behavioral of Decoder_logic is


signal temp_Dec_out : STD_LOGIC_VECTOR (31 downto 0);


begin


process(Instr_15_0,Opp,temp_Dec_out)
	begin
	--SignExtend(Imm)
	if((Opp="111000")OR(Opp="110000")OR(Opp="000011")OR(Opp="000111")OR(Opp="001111")OR(Opp="011111")OR(Opp="100000")) then   
		if(Instr_15_0(15)='0') then	
			temp_Dec_out(31 downto 16) <= "0000000000000000";
			temp_Dec_out(15 downto 0) <=Instr_15_0;
		else	
			temp_Dec_out(31 downto 16) <= "1111111111111111";
			temp_Dec_out(15 downto 0) <=Instr_15_0;
		end if;
		
		--Imm << 16 (zero-fill)
	elsif(Opp="111001") then 	
			temp_Dec_out(31 downto 16) <= Instr_15_0;
			temp_Dec_out(15 downto 0) <= "0000000000000000";
	
	--ZeroFill(Imm)
	elsif(Opp="110010")OR(Opp="110011")then 	
			temp_Dec_out(31 downto 16) <= "0000000000000000";
			temp_Dec_out(15 downto 0) <=Instr_15_0;
			
			--(SignExtend(Imm) << 2)
	elsif(Opp="111111")OR(Opp="000000")OR(Opp="000001") then  
			if(Instr_15_0(15)='0') then	
			temp_Dec_out(31 downto 18) <= "00000000000000";
			temp_Dec_out(17 downto 2) <=Instr_15_0;
			temp_Dec_out(1 downto 0) <="00";
		   else	
			temp_Dec_out(31 downto 18) <= "11111111111111";
			temp_Dec_out(17 downto 2) <=Instr_15_0;
			temp_Dec_out(1 downto 0) <="00";
	       end if;
	
	end if;
	
end process;

Dec_out <= temp_Dec_out;


end Behavioral;

