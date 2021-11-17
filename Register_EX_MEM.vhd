----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:28:59 03/06/2018 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity Register_MEM_EX is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Data2 :in  STD_LOGIC_VECTOR (31 downto 0);
			  Data3 :in  STD_LOGIC_VECTOR (31 downto 0);
			  Data4 :in  STD_LOGIC_VECTOR (31 downto 0);
--			  Data5 :in  STD_LOGIC_VECTOR (31 downto 0);
--			  Data6 :in  STD_LOGIC_VECTOR (31 downto 0);
--			  Data7 :in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data2_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data3_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data4_out : out  STD_LOGIC_VECTOR (31 downto 0)
--			  Data5_out : out  STD_LOGIC_VECTOR (31 downto 0);
--			  Data6_out : out  STD_LOGIC_VECTOR (31 downto 0);
--			  Data7_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
			  
end Register_MEM_EX;

architecture Behavioral of Register_MEM_EX is

signal Data_sig1: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
signal Data_sig2: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
signal Data_sig3: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
signal Data_sig4: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
--signal Data_sig5: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
--signal Data_sig6: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
--signal Data_sig7: STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
begin

	
process
	begin
	
	wait until CLK 'event and CLK = '1' ;
	
	if (RST='1') then
		Data_sig1 <= "00000000000000000000000000000000";
		Data_sig2 <= "00000000000000000000000000000000";
		Data_sig3 <= "00000000000000000000000000000000";
		Data_sig4 <= "00000000000000000000000000000000";
--		Data_sig5 <= "00000000000000000000000000000000";
--		Data_sig6 <= "00000000000000000000000000000000";
--		Data_sig7 <= "00000000000000000000000000000000";
		
	elsif (WE='1') then
		Data_sig1 <= Data1;
		Data_sig2 <= Data2;
		Data_sig3 <= Data3;
		Data_sig4 <= Data4;
		--Data_sig5 <= Data5;
		--Data_sig6 <= Data6;
		--Data_sig7 <= Data7;
		
	
	
	end if;
	end process;
	
 Data1_out<=Data_sig1;
  Data2_out<=Data_sig2;
   Data3_out<=Data_sig3;
	 Data4_out<=Data_sig4;
	--  Data5_out<=Data_sig5;
	 --  Data6_out<=Data_sig6;
	---	 Data7_out<=Data_sig7;
		 
		 
end Behavioral;



