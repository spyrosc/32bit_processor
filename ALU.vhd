----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:38 03/06/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC
			  );
end ALU;

architecture Behavioral of ALU is

signal tmp_sig : STD_LOGIC_VECTOR (31 downto 0);   
signal Cout_sig,Ovf_sig : STD_LOGIC;                         
                         
								 
begin
	process(A,B,Op,tmp_sig,Ovf_sig,Cout_sig)
	begin
	
	
	tmp_sig <= "00000000000000000000000000000000" ; 
	Cout_sig  <= '0';
	Ovf_sig   <= '0';
	
	if(Op="0000") then          
			tmp_sig <= A + B; 
			if(A(31) xor B(31))= '0' then-- overflow otan A kai B exoun idio prosimo  
				if(A(31) xor tmp_sig(31))='1' then
				Ovf_sig <= '1';
				Cout_sig <= not tmp_sig(31);
			   else
				Ovf_sig <= '0';
				Cout_sig <= A(31);
				end if;
			 else
				Ovf_sig <= '0';
				Cout_sig <= A(31);
			end if;
			
			
	elsif(Op="0001") then
			tmp_sig <= A - B;
			
			if(A(31) xor B(31))= '1' then-- overflow otan A kai B exoun diaforetiko prosimo 
				if(A(31) xor tmp_sig(31))='1' then
				Ovf_sig <= '1';
				Cout_sig <= A(31);
			   else
				Ovf_sig <= '0';
				Cout_sig <= A(31);
				end if;
			 else
				Ovf_sig <= '0';
				Cout_sig <= not tmp_sig(31);
			end if;
			
			
	elsif(Op="0010") then
			tmp_sig <= A nand B;  
			
	elsif(Op="0011") then
			tmp_sig <= A or B;  
			
	elsif(Op="0100") then
			tmp_sig <=  not(A);  
			
	elsif(Op="1000") then    ---Ari8mhtikh olis8hsh sta dexia
			tmp_sig(31) <= A(31);
			tmp_sig(30 downto 0) <= A(31 downto 1);
			
	elsif(Op="1001") then    ---Logikh olis8hsh sta dexia
			tmp_sig(31) <= '0';
			tmp_sig(30 downto 0) <= A(31 downto 1);
			
	elsif(Op="1010") then    ---Logikh olis8hsh sta aristera
			tmp_sig(31) <= '0';
			tmp_sig(31 downto 1) <= A(30 downto 0);
			
	elsif(Op="1100") then    ---Kukliko rotate sta aristera
			tmp_sig(31 downto 1) <= A(30 downto 0);
			tmp_sig(0) <= A(31);
			
	elsif(Op="1101") then    ---Kukliko rotate sta dexia
			tmp_sig(30 downto 0) <= A(31 downto 1);
			tmp_sig(31) <= A(0);
		
			elsif(Op="1111") then   
			tmp_sig <= "00000000000000000000000000000000" ;  
	else 
	
			tmp_sig <= "00000000000000000000000000000000" ;  
			
	end if;
			
	if tmp_sig(31 downto 0)=0 then      -- Zero
		Zero <= '1';
	else
		Zero <= '0';
	end if;
	
	
	
		Cout <=Cout_sig;
		Ovf  <=Ovf_sig;
		Output <= tmp_sig(31 downto 0);
	
		end process;
	
	end Behavioral;

