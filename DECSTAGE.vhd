----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:14:27 03/12/2018 
-- Design Name: 
-- Module Name:    DECSTAGE - Behavioral 
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

entity DECSTAGE is
Port ( 
           CLK : in  STD_LOGIC;
           Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
			  rf_write_reg :  in  STD_LOGIC_VECTOR (4 downto 0);
			  Reset: in  STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
			  Writedata: out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0)
			  );

end DECSTAGE;


architecture Behavioral of DECSTAGE is

signal tempMUX_2_RF  : STD_LOGIC_VECTOR (31 downto 0);
signal tempOutMux_RF : STD_LOGIC_VECTOR (4 downto 0);
signal temp_Immed_out:  STD_LOGIC_VECTOR (31 downto 0);


Component Mux_5x1 is
 Port ( 
           RF_B_sel : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out  STD_LOGIC_VECTOR (4 downto 0)
			  );
end Component;

Component Register_File is
Port (     
             CLK : in  STD_LOGIC;
           Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           RST : in  STD_LOGIC
			  );
end Component;

Component Mux_WrData is
Port ( 
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           WrDATA_sel : in STD_LOGIC;
           WrDATA : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;

Component Decoder_logic is
Port ( 
           Opp : in  STD_LOGIC_VECTOR (5 downto 0);
           Instr_15_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           Dec_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;




begin

MUX_instr:Mux_5x1
Port map ( 
           RF_B_sel=> RF_B_sel,
           A => Instr(15 downto 11),
           B => Instr(20 downto 16),
           Output=> tempOutMux_RF
			  );


RF_lab1:Register_File
Port map(
          Ard1 => Instr(25 downto 21),
          Ard2 => tempOutMux_RF ,
          Awr => rf_write_reg,
          Dout1 => RF_A,
          Dout2 => RF_B,
          Din => tempMUX_2_RF,
          WrEn=> RF_WrEn,
          CLK => CLK,
          RST => Reset
			 );
			 
Mux_DATA:Mux_WrData			--alu--0,mem--1 
Port map(  
           ALU_out => ALU_out,
           MEM_out => MEM_out,
           WrDATA_sel => RF_WrData_sel,
           WrDATA =>tempMUX_2_RF 
			  );
			 

DEC:Decoder_logic
Port map( 
          Opp =>Instr(31 downto 26),
          Instr_15_0 =>Instr(15 downto 0),
          Dec_out => temp_Immed_out 
			 );
			  

Immed<=temp_Immed_out;
 Writedata<=tempMUX_2_RF;
end Behavioral;

