----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:50 03/26/2018 
-- Design Name: 
-- Module Name:    DataPath_top - Behavioral 
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

entity DataPath_top is
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
			  
end DataPath_top;

architecture Behavioral of DataPath_top is


signal signal_Instr  : STD_LOGIC_VECTOR (31 downto 0);
signal signal_ALU_out :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Mem_out :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Mem_in  :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Byte_out  :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RF_A_out   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RF_B_out   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RFA_RegA_out   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RFB_RegB_out   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Immed  :  STD_LOGIC_VECTOR (31 downto 0);
   
     

Component ALUSTAGE is
Port ( 
           RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  ALU_Zero_out: out  STD_LOGIC
			  );
end Component;

Component Byte_Module is
Port (     Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;


Component DECSTAGE is
Port ( 
           Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset: in  STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
end Component;

Component Ifstage_Ram_top is
port (
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
end Component;

Component Register_B1 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Component  ;




begin

If_MEM_stage:Ifstage_Ram_top
Port map(
           PC_Immed => signal_Immed,
           PC_Sel =>PC_Sel,
           PC_LdEn =>PC_LdEn,
           Reset =>RST,
           Clk =>CLK,
			  Instr =>signal_Instr,
			  Mem_WrEn =>Mem_WrEn, 
			  ALU_MEM_ADDR =>signal_ALU_out,
           data_din =>signal_Mem_in,
           MEM_DataOut  =>signal_Mem_out);
			  
Dec_Stage:DECSTAGE
Port map ( 
           Instr => signal_Instr,
           RF_WrEn =>RF_WrEn,
           ALU_out =>signal_ALU_out,
           MEM_out =>signal_Byte_out,
           RF_WrData_sel =>RF_WrData_sel,
           RF_B_sel =>RF_B_sel,
           Clk =>CLK,
			  Reset =>RST,
           Immed =>signal_Immed,
           RF_A =>signal_RF_A_out,
           RF_B =>signal_RF_B_out);	

ALU_Stage:ALUSTAGE 
Port map( 
           RF_A => signal_RFA_RegA_out,
           RF_B =>signal_RFB_RegB_out,
           Immed =>signal_Immed,
           ALU_Bin_sel =>ALU_Bin_sel,
           ALU_func =>ALU_func,
           ALU_out =>signal_ALU_out,
			  ALU_Zero_out =>Zero);	
			  
			  
			  
RegisterA:Register_B1 
Port map ( 
           CLK => CLK,
           RST => RST,
           Data => signal_RF_A_out,
           WE => '1',
           Dout => signal_RFA_RegA_out);


RegisterB:Register_B1 
Port map ( 
           CLK => CLK,
           RST => RST,
           Data => signal_RF_B_out,
           WE => '1',
           Dout => signal_RFB_RegB_out);




Byte_module_1: Byte_Module 
Port map ( Din => signal_RFB_RegB_out,
           Sel => MEM_in_Sel,
           Dout =>signal_Mem_in);
			  
			  
			  
Byte_module_2: Byte_Module 
Port map ( Din => signal_Mem_out,
           Sel => MEM_out_Sel,
           Dout =>signal_Byte_out);	



Instr <=signal_Instr;

end Behavioral;

