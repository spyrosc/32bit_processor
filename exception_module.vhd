----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:31:52 05/21/2018 
-- Design Name: 
-- Module Name:    exception_module - Behavioral 
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

entity exception_module is
port(
ovf_exception,RST,we_in : in  STD_LOGIC;
Instr: in  STD_LOGIC_VECTOR (31 downto 0);
alu_out_exception : in  STD_LOGIC_VECTOR (31 downto 0);
out_1 : out   STD_LOGIC;
out_2 : out   STD_LOGIC;
mux_sel: out   STD_LOGIC;
we: out   STD_LOGIC;
mux_exception_sel  : out  STD_LOGIC_VECTOR (1 downto 0);
mux_sel_epc: out   STD_LOGIC;
cause_out : out  STD_LOGIC_VECTOR (31 downto 0));
end exception_module;

architecture Behavioral of exception_module is

signal out_sig,out1_s,out2_s,we_s,mux_sel_sig,mux_sel_epc_sig :STD_LOGIC;
signal cause_out_sig :STD_LOGIC_VECTOR (31 downto 0);
signal mux_exception_sel_sig: STD_LOGIC_VECTOR(1 downto 0);



begin

process(RST,ovf_exception,Instr,alu_out_exception,out_sig,out1_s,we_in,out2_s,we_s,mux_sel_sig,mux_sel_epc_sig,cause_out_sig,mux_exception_sel_sig )
begin

if(RST='1') then
cause_out_sig<= x"00000000";
mux_sel_sig<='1';
we_s<='0';
out2_s<='0';
out1_s<='0';
mux_exception_sel_sig<="00";
mux_sel_epc_sig<='0';
else

		 if (Instr(31 downto 26) = "111000")  then 
		cause_out_sig<= x"00000000";
		mux_sel_sig<='1';
		we_s<='0';
		out2_s<='0';
		out1_s<='0';
		mux_exception_sel_sig<="00";
		mux_sel_epc_sig<='0';

		elsif (Instr(31 downto 26) = "100000") then 
		cause_out_sig<= x"00000000";
		mux_sel_sig<='1';
		we_s<='0';
		out2_s<='0';
		out1_s<='0';
		mux_exception_sel_sig<="00";
		mux_sel_epc_sig<='0';

		elsif (Instr(31 downto 26)= "001111") then 
		cause_out_sig<= x"00000000";
		mux_sel_sig<='1';
		we_s<='0';
		out2_s<='0';
		out1_s<='0';
		mux_exception_sel_sig<="00";
		mux_sel_epc_sig<='0';

		elsif(Instr(31 downto 26) = "101010")then
		mux_sel_sig<='0';
		cause_out_sig<= x"00000000";
		we_s<='0';
		out2_s<='0';
		out1_s<='0';
		mux_exception_sel_sig<="00";
		mux_sel_epc_sig<='0';
		
		else
		mux_sel_sig<='1';
		mux_exception_sel_sig<="01";
		cause_out_sig <=x"00000111" ;
		out1_s<='0';
		out2_s<='0';
		mux_sel_epc_sig<='0';-- -4
		we_s<='1';
		end if;

		if (alu_out_exception > ("00000000000000000001000000000001") and we_in='1' )then
		mux_sel_sig<='1';
		mux_exception_sel_sig<="10";
		cause_out_sig <=x"00111000" ;
		out2_s<='1';
		out1_s<='0';
		mux_sel_epc_sig<='1';-- -8
		we_s<='1';

		elsif (ovf_exception='1')then
		mux_sel_sig<='1';
		mux_exception_sel_sig<="11";
		cause_out_sig <=x"11000000";
		out2_s<='1'; 
		out1_s<='0';
		we_s<='0';
		mux_sel_epc_sig<='1';-- -8

      end if ;


end if;
end process;

out_1 <= out1_s;
out_2 <= out2_s;
mux_sel <= mux_sel_sig;
we <= we_s;
mux_exception_sel<=  mux_exception_sel_sig;
mux_sel_epc <= mux_sel_epc_sig;
cause_out <= cause_out_sig;






end Behavioral;

