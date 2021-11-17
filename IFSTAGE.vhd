----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:15 03/12/2018 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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

entity IFSTAGE is
Port (     
           mux4_in: in  STD_LOGIC_VECTOR (31 downto 0);
           PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_Sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Pc_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end IFSTAGE;

architecture Behavioral of IFSTAGE is

signal Sum1,Sum2,temp_PC_Out :  STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal temp_mux4_out :   STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal temp_MuxOut :   STD_LOGIC_VECTOR (31 downto 0):= (others => '0');



Component Add is
 Port ( 
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Athrisma : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;

Component PC is
 Port ( 
           Mux_IF_Out : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC_Out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;

Component RAM is
 port (
 clk : in std_logic;
 inst_addr : in std_logic_vector(10 downto 0);
 inst_dout : out std_logic_vector(31 downto 0);
 data_we : in std_logic;
 data_addr : in std_logic_vector(10 downto 0);
 data_din : in std_logic_vector(31 downto 0);
 data_dout : out std_logic_vector(31 downto 0)
 );
 end Component;
 
Component Mux_if_2x1 is
 Port ( 
           PC_Sel : in  STD_LOGIC;
           Adder_Imm : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder4 : in  STD_LOGIC_VECTOR (31 downto 0);
           MuxOut : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;




begin
--
--Adder1:Add
--Port map( 
--       A => PC_Immed,
--       B => Sum2,
--       Athrisma => Sum1
--		 );
--		 

Adder2:Add
Port map ( 
           A => mux4_in,
           B => "00000000000000000000000000000100",
           Athrisma => Sum2
			  );
			  
--Mux_if:Mux_if_2x1
--Port map( 
--          PC_Sel => PC_Sel,
--          Adder_Imm => Sum1,
--          Adder4 => Sum2,
--          MuxOut => temp_MuxOut
--			 );
--			 
			 
Pc_top:PC
Port map  (
           Mux_IF_Out =>Sum2,
           PC_LdEn => PC_LdEn,
           Reset => Reset,
           Clk => Clk,
           PC_Out=> temp_PC_Out
			  );			  
  

Pc_out<=temp_PC_Out;




end Behavioral;

