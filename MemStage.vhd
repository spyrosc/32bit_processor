----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:46 03/13/2018 
-- Design Name: 
-- Module Name:    MemStage - Behavioral 
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

entity MemStage is
port (     
           clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
			  inst_dout : out std_logic_vector(31 downto 0);
 );
end MemStage;

architecture Behavioral of MemStage is

signal Alu_addr_sig : STD_LOGIC_VECTOR (31 downto 0);


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
 
 
 Component Add is
 Port ( 
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Athrisma : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;
 
 

begin

Adder1024:Add
 Port map ( 
 
           A => ALU_MEM_Addr,
           B =>"00000000000000000000010000000000",
           Athrisma=>Alu_addr_sig 
);

ram_mem: RAM
  clk =>clk,
 inst_addr =>
 inst_dout =>
 data_we =>Mem_WrEn,
 data_addr =>
 data_din =>MEM_DataIn
 data_dout =>MEM_DataOut






end Behavioral;

