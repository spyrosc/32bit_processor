----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:55 03/12/2018 
-- Design Name: 
-- Module Name:    ALUSTAGE - Behavioral 
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

entity ALUSTAGE is
Port ( 
           RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  ALU_Zero_out: out  STD_LOGIC;
			  Alu_FW_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  Ex_Mem_out : in  STD_LOGIC_VECTOR (31 downto 0);
			  Alu_FW_SelA : in  STD_LOGIC_VECTOR (1 downto 0);
			  Mem_WB_out : in  STD_LOGIC_VECTOR (31 downto 0)
			  );

end ALUSTAGE;


architecture Behavioral of ALUSTAGE is

signal tempMUX_2_ALUSTAGE,signal_muxFW_Data_out,signal_muxFW_Data_out2 : STD_LOGIC_VECTOR (31 downto 0);
signal tempZero :  STD_LOGIC;
signal tempCout :  STD_LOGIC;
signal tempOvf :  STD_LOGIC;


Component ALU is
Port ( 
	        A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC
			  );
end Component;

Component MUX_32x1 is
Port ( 
        Din0 : in  STD_LOGIC_VECTOR (31 downto 0);
		  Din1 : in  STD_LOGIC_VECTOR (31 downto 0);
		  sel : in  STD_LOGIC;
		  MuxOut : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
end Component;

Component mux_4x1 is
port(     data1 : in  STD_LOGIC_VECTOR (31 downto 0);
          data2 : in  STD_LOGIC_VECTOR (31 downto 0);
			 data3 : in  STD_LOGIC_VECTOR (31 downto 0);
			 data4 : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC_VECTOR (1 downto 0);
          Data_out : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end Component;


begin

MUX_ALUSTAGE:MUX_32x1
Port map(  
           Din0 => RF_B,
           Din1 => Immed,
           sel => ALU_Bin_sel,
           MuxOut =>tempMUX_2_ALUSTAGE 
			  );
			  
ALU_stage:ALU
Port map(  
           A => signal_muxFW_Data_out2,
           B => signal_muxFW_Data_out,
           Op => ALU_func,
           Output => ALU_out,
           Zero => ALU_Zero_out,
           Cout => tempCout,
           Ovf => tempOvf
			  );
			  
			  
			  
mux_FWB : mux_4x1
Port map(
          data1 =>tempMUX_2_ALUSTAGE ,--muxRfB
          data2 =>Ex_Mem_out,
			 data3 =>Mem_WB_out,
			 data4 =>"00000000000000000000000000000000",
			   sel =>Alu_FW_Sel,
       Data_out =>signal_muxFW_Data_out
);


mux_FWA : mux_4x1
Port map(
          data1 =>RF_A ,
          data2 =>Ex_Mem_out,
			 data3 =>Mem_WB_out,
			 data4 =>"00000000000000000000000000000000",
			   sel =>Alu_FW_SelA,
       Data_out =>signal_muxFW_Data_out2
);


end Behavioral;

