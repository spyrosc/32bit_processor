----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:33:01 03/26/2018 
-- Design Name: 
-- Module Name:    Lab_3_Top - Behavioral 
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

entity processor is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end processor;


architecture Behavioral of processor is

signal temp_Instr : STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
signal temp_Zero : STD_LOGIC := '0';
signal temp_PC_sel : STD_LOGIC := '0';
signal temp_RF_B_sel : STD_LOGIC := '0';
signal temp_PC_LdEn : STD_LOGIC := '0';
signal temp_RF_WrEn : STD_LOGIC := '0';
signal temp_ALU_Bin_sel : STD_LOGIC := '0';
signal temp_RF_WrData_sel : STD_LOGIC_VECTOR (1 downto 0) := "00"; 
signal temp_ALU_func : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal temp_MEM_WrEn : STD_LOGIC := '0';
signal temp_MEM_in_SEL : STD_LOGIC := '0';
signal temp_MEM_out_SEL : STD_LOGIC := '0';





Component DataPath_Top is    
Port (
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           RF_WrEn : in  STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           MEM_WrEn : in  STD_LOGIC;
           MEM_in_Sel : in  STD_LOGIC;
           MEM_out_Sel : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end Component;

Component Control_Stage is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Zero_equals : in  STD_LOGIC;
           PC_sel : out  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           ALU_Bin_sel : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           MEM_WrEn : out  STD_LOGIC;
           MEM_in_SEL : out  STD_LOGIC;
           MEM_out_SEL : out  STD_LOGIC);
end Component;




begin 
DataPath_Top_1 : DataPath_Top
Port map(  CLK => CLK,
           RST => RST,
           PC_sel => temp_PC_sel,
           PC_LdEn => temp_PC_LdEn,
           RF_B_sel => temp_RF_B_sel,
           RF_WrEn => temp_RF_WrEn,
           RF_WrData_sel => temp_RF_WrData_sel,
           ALU_Bin_sel => temp_ALU_Bin_sel,
           ALU_func => temp_ALU_func,
           MEM_WrEn => temp_MEM_WrEn,
           MEM_in_Sel => temp_MEM_in_SEL,
           MEM_out_Sel => temp_MEM_out_SEL,
           Instr => temp_Instr,
           Zero =>temp_Zero );

CONTROL: Control_Stage
Port map ( CLK => CLK,
           RST => RST,
           Instr => temp_Instr,
           Zero_equals =>temp_Zero ,
           PC_sel => temp_PC_sel,
           RF_B_sel => temp_RF_B_sel,
           PC_LdEn => temp_PC_LdEn,
           RF_WrEn => temp_RF_WrEn,
           ALU_Bin_sel => temp_ALU_Bin_sel,
           RF_WrData_sel => temp_RF_WrData_sel,
           ALU_func => temp_ALU_func,
           MEM_WrEn => temp_MEM_WrEn,
           MEM_in_SEL => temp_MEM_in_SEL,
           MEM_out_SEL => temp_MEM_out_SEL);






end Behavioral;

