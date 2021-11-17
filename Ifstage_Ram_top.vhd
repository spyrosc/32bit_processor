----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:01 03/13/2018 
-- Design Name: 
-- Module Name:    Ifstage_Ram_top - Behavioral 
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

entity Ifstage_Ram_top is
port (     sel_mux_epc_in: in  STD_LOGIC;
           sel_mux_excep_in : in  STD_LOGIC_VECTOR (1 downto 0);
           epc_in_data: in std_logic_vector(31 downto 0);
			  epc_out_data : out std_logic_vector(31 downto 0);
           PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_Sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Instr : out std_logic_vector(31 downto 0);
			  Mem_WrEn  : in std_logic;
			  ALU_MEM_ADDR : in std_logic_vector(31 downto 0);
           data_din : in std_logic_vector(31 downto 0);
           MEM_DataOut  : out std_logic_vector(31 downto 0)
);
end Ifstage_Ram_top;

architecture Behavioral of Ifstage_Ram_top is

signal Sum1024_sig  : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal Pc_out_sig,data_out_mux_excep_sig ,data_mux_out_epc,sum_epc_sig:std_logic_vector(31 downto 0);

component RAM is
 port (
 clk : in std_logic;
 inst_addr : in std_logic_vector(10 downto 0);
 inst_dout : out std_logic_vector(31 downto 0);
 data_we : in std_logic;
 data_addr : in std_logic_vector(10 downto 0);
 data_din : in std_logic_vector(31 downto 0);
 data_dout : out std_logic_vector(31 downto 0)
 );
 end component;
 
component IFSTAGE is
Port (     
           mux4_in: in  STD_LOGIC_VECTOR (31 downto 0);
           PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_Sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Pc_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;
 
 
component Adder34 is
 Port ( 
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Athrisma : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;


component mux_10_4bit is
port(     data1 : in  STD_LOGIC_VECTOR (31 downto 0);
          data2 : in  STD_LOGIC_VECTOR (31 downto 0);
			 data3 : in  STD_LOGIC_VECTOR (31 downto 0);
			 data4 : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC_VECTOR (1 downto 0);
          Data_out : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end component;



component mux3_pc is
port(     data1 : in  STD_LOGIC_VECTOR (31 downto 0);
          data2 : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC;
          Data_out : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end component;
 


begin

Ram_top:RAM
 port map (
 clk => Clk,
 inst_addr=> data_out_mux_excep_sig(12 downto 2),
 inst_dout =>Instr,
 data_we =>Mem_WrEn ,
 data_addr =>Sum1024_sig(12 downto 2),
 data_din =>data_din,
 data_dout =>MEM_DataOut 
 );
 

Ifstage_top:IFSTAGE 
Port map ( 
           mux4_in=>data_out_mux_excep_sig,
           PC_Immed =>PC_Immed,
           PC_Sel =>PC_Sel,
           PC_LdEn =>PC_LdEn,
           Reset =>Reset,
           Clk =>Clk,
           Pc_out =>Pc_out_sig
			  );
 

 Adder1024:Adder34
 Port map( 
           A =>ALU_MEM_ADDR,
           B =>"00000000000000000001000000000000",
           Athrisma =>Sum1024_sig
			  );

--sum_epc_sig<=epc_in_data + "00000000000000000000000000001000";
			 
mux_epx:  mux3_pc 
port map(     data1 =>epc_in_data,
          data2 =>Pc_out_sig,
          sel =>sel_mux_epc_in,
          Data_out =>data_mux_out_epc
			 );
			  
			  
			  
mux_exception: mux_10_4bit 
port map (     
          data1 => data_mux_out_epc,        
          data2 =>"00000000000000000000000100000000",
			 data3=> "00000000000000000000001000000000",
			 data4 =>"00000000000000000000001100000000",
          sel =>sel_mux_excep_in,               
          Data_out =>data_out_mux_excep_sig
			 );

epc_out_data<=data_mux_out_epc;


end Behavioral;

