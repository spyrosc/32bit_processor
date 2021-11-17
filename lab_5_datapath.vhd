----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:34 05/04/2018 
-- Design Name: 
-- Module Name:    lab_5_datapath - Behavioral 
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

entity lab_5_datapath is
Port ( RST : in STD_LOGIC;
       CLK : in  STD_LOGIC);
			  
end lab_5_datapath;

architecture Behavioral of lab_5_datapath is

component exception_module is
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
end component;



component mux3_pc is
port(     data1 : in  STD_LOGIC_VECTOR (31 downto 0);
          data2 : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC;
          Data_out : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end component;

component register_epc is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
			
           WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIC_VECTOR (31 downto 0)
	
			  );
			  
			  
end component;


component Register_B1 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;



component mini_Control is
Port (  
			  RST : in STD_LOGIC;
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Control_Out : out  STD_LOGIC_VECTOR (1 downto 0)
			  );

end component;
component Stall_module is
 Port (    opcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  Rs_1: in  STD_LOGIC_VECTOR (4 downto 0);
			  Rt_Dec_Ex :in  STD_LOGIC_VECTOR (4 downto 0);
			  rt :in  STD_LOGIC_VECTOR (4 downto 0);
			  sel :out  STD_LOGIC;
			  sel_1:out  STD_LOGIC;
			  sel_2:out  STD_LOGIC);
end component;

component Register_4 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC ;
           WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIc
			 				
			  );
			  
			  
end component;


component mux_Stall is
Port ( 
           Din1 : in  STD_LOGIC;
           Din2 : in  STD_LOGIC;
           Sel2 : in  STD_LOGIC;
           Dout : out  STD_LOGIC
			  );
end component;

component Control_Module is
    Port (   CLK : in  STD_LOGIC;
	        instr_Out : out  STD_LOGIC_VECTOR (31 downto 0);
			  flag: in  STD_LOGIC;
			  RST : in STD_LOGIC;
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Control_Out : out  STD_LOGIC_VECTOR (17 downto 0);
			  opcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  Rs_1: in  STD_LOGIC_VECTOR (4 downto 0);
			  Rt_Dec_Ex :in  STD_LOGIC_VECTOR (4 downto 0);
			  rt :in  STD_LOGIC_VECTOR (4 downto 0);
			  Control_RT_RD : out  STD_LOGIC );
end component;

component Register_Control is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (17 downto 0);
           WE : in  STD_LOGIC;
			  Excep : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (17 downto 0)
			  );
end component;

component mux_4x1 is
port(     data1 : in  STD_LOGIC_VECTOR (31 downto 0);
          data2 : in  STD_LOGIC_VECTOR (31 downto 0);
			 data3 : in  STD_LOGIC_VECTOR (31 downto 0);
			 data4 : in  STD_LOGIC_VECTOR (31 downto 0);
          sel : in  STD_LOGIC_VECTOR (1 downto 0);
          Data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


Component ALUSTAGE is
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
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
			  rf_write_reg :  in  STD_LOGIC_VECTOR (4 downto 0);
           Clk : in  STD_LOGIC;
			  Reset: in  STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
			  Writedata: out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
end Component;

Component Ifstage_Ram_top is
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
end Component;

Component Register_2_32 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Data2 :in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data2_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;
Component Register_2 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Data2 :in  STD_LOGIC_VECTOR (4 downto 0);
			  WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data2_out : out  STD_LOGIC_VECTOR (4 downto 0)	
			
			  );		  
			  
			  
end Component;


 Component Register_5 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Data2 :in  STD_LOGIC_VECTOR (4 downto 0);
			  Data3 :in  STD_LOGIC_VECTOR (4 downto 0);
			  Data4 :in  STD_LOGIC_VECTOR (4 downto 0);
			  Data5 :in  STD_LOGIC_VECTOR (5 downto 0);
			  WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data2_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Data3_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Data4_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Data5_out : out  STD_LOGIC_VECTOR (5 downto 0)
			
			
			  );
end Component;


Component Register_3 is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Data2 :in  STD_LOGIC_VECTOR (31 downto 0);
			  Data3 :in  STD_LOGIC_VECTOR (4 downto 0);			 
           WE : in  STD_LOGIC;
			  Data1_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data2_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Data3_out : out  STD_LOGIC_VECTOR (4 downto 0)
						
			  );
			  
			  
end Component;




Component Forward_module is
Port (  
           Rs_Dec_Ex: in  STD_LOGIC_VECTOR (4 downto 0);
			  Rt_Dec_Ex :in  STD_LOGIC_VECTOR (4 downto 0);
			  Rd_Ex_Mem :in  STD_LOGIC_VECTOR (4 downto 0);	
           Rd_Mem_WB :in  STD_LOGIC_VECTOR (4 downto 0);	
           Ex_Mem_RF_WrEN :in  STD_LOGIC;
           Mem_WB_RF_WrEN  :in  STD_LOGIC;
			  FwA: out STD_LOGIC_VECTOR (1 downto 0);
			  FwB: out STD_LOGIC_VECTOR (1 downto 0)
			  );
end Component;


Component aferesi 

 Port ( 
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Athrisma : out  STD_LOGIC_VECTOR (31 downto 0)
			  );

end Component;








signal signal_Instr,signal_Instr1  : STD_LOGIC_VECTOR (31 downto 0);
signal signal_ALU_out,signal_write_data :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Mem_out :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Mem_in  :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Byte_out  :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RF_A_out,signal_RF_A_out_wait,signal_RF_B_out_wait : STD_LOGIC_VECTOR (31 downto 0);
signal signal_RF_B_out   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RFA_RegA_out   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_RFB_Reg_out,signal_Alu_address   :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Immed,signal_inst,signal_Immed_out,signal_muxA_Data_out,signal_Alu_address_regWB,cause_out_sig,cause_data_sig  :  STD_LOGIC_VECTOR (31 downto 0);
signal signal_Control_Out_3,signal_Control_Out_2,signal_Control_Out_1,signal_Control_in : STD_LOGIC_VECTOR (17 downto 0);
signal signal_RT_RD_sel,ALU_Zero_out_signal,signal_Pc_Ldn_sel, signal_MEM_WrEn_sel, signal_RF_WrEn_sel,signal_stall_Mem_we,signal_stall_RF_WrEn:STD_LOGIC;
signal signal_muxA_sel :  STD_LOGIC_VECTOR (1 downto 0);
signal signal_RD_Reg_out,signal_RD_out ,signal_RD_Reg_out_regWB,signal_RT_out,signal_RS_out: STD_LOGIC_VECTOR (4 downto 0);
signal signal_mini_Control,FWA_sel_sig,FWB_sel_sig,mux_exception_sel_sig: STD_LOGIC_VECTOR (1 downto 0);
signal signal_opcode_out : STD_LOGIC_VECTOR (5 downto 0);
signal signal_flip,signal_flag,we_exception_s,mux_sel_sig_ram,ovf_exception_sig,out1_s,out2_s,mux_sel_epc_sig: STD_LOGIC;
signal  ram_epc_in_sig,epc_out_sig ,sum_epc_sig,sum_epc_sig1,data_epc_sig : STD_LOGIC_VECTOR (31 downto 0);


begin

If_MEM_stage:Ifstage_Ram_top
Port map(


          sel_mux_epc_in=>mux_sel_sig_ram,
           sel_mux_excep_in=> mux_exception_sel_sig,
           epc_in_data => epc_out_sig,
			  epc_out_data =>ram_epc_in_sig,
           PC_Immed => signal_Immed,
           PC_Sel =>'0',
           PC_LdEn =>signal_Control_Out_1(1) ,
           Reset =>RST,
           Clk =>CLK,
			  Instr =>signal_Instr,
			  Mem_WrEn =>signal_stall_Mem_we, 
			  ALU_MEM_ADDR =>signal_Alu_address,
           data_din =>signal_RFB_Reg_out,
           MEM_DataOut  =>signal_Mem_out
			  );
			  
			
			  
Dec_Stage:DECSTAGE
Port map ( 
           Instr => signal_Instr1,
           RF_WrEn =>signal_stall_RF_WrEn,
           ALU_out =>signal_Alu_address_regWB,
			  rf_write_reg => signal_RD_Reg_out_regWB  ,
           MEM_out =>signal_Mem_out,
           RF_WrData_sel =>signal_Control_Out_3(3),
           RF_B_sel =>signal_mini_Control(0),
           Clk =>CLK,
			  Reset =>RST,
           Immed =>signal_Immed,
           RF_A =>signal_RF_A_out,
			  Writedata=>signal_write_data,
           RF_B =>signal_RF_B_out 
			  );	
			  
			  

			  
Reg_MEM_WB :Register_2 
	
	Port map (	  CLK =>CLK,
                 RST =>RST,
			        Data1 =>signal_Alu_address ,
			        Data2 => signal_RD_Reg_out ,
						WE =>'1',
			         Data1_out =>signal_Alu_address_regWB,
			         Data2_out =>signal_RD_Reg_out_regWB
			  );
			  
Reg_DEC_EX : Register_5
Port map ( 
           CLK =>CLK,
           RST =>RST,
           Data1 => signal_Immed,
			  Data2 => signal_Instr1(20 downto 16 ),--rd
			  Data3=>signal_Instr1(15 downto 11 ),--rt
			  Data4=>signal_Instr1(25 downto 21 ),--rs
			  Data5=>signal_Instr1(31 downto 26 ),--opcode
			  WE =>'1',
			  Data1_out =>signal_Immed_out,
			  Data2_out =>signal_RD_out,
			  Data3_out =>signal_RT_out,
			  Data4_out =>signal_RS_out,
			  Data5_out =>signal_opcode_out 
			  );

mux_A : mux_4x1
Port map(
          data1 => "00000000000000000000000000000000",
          data2 =>signal_RF_A_out_wait,
			 data3 =>"00000000000000000000000000000000",
			 data4 =>"00000000000000000000000000000000",
			   sel =>signal_Control_Out_1(12 downto 11),
       Data_out =>signal_muxA_Data_out
);



AlU_stage : ALUSTAGE 
Port map ( 
           RF_A =>signal_muxA_Data_out,
           RF_B =>signal_RF_B_out_wait,
           Immed => signal_Immed_out,
           ALU_Bin_sel =>signal_Control_Out_1(9),
           ALU_func=> signal_Control_Out_1(8 downto 5),
           ALU_out =>signal_ALU_out ,
			  ALU_Zero_out=>ALU_Zero_out_signal,
           Alu_FW_Sel =>FWB_sel_sig,
			  Ex_Mem_out =>signal_Alu_address,
			  Alu_FW_SelA =>FWA_sel_sig,
			  Mem_WB_out =>signal_write_data			  
			  );

mux_Stall_RF:mux_Stall
port map(  Din1 =>'0',
           Din2 =>signal_Control_Out_3(2),
           Sel2 =>'1',
           Dout =>signal_stall_RF_WrEn
);

mux_Stall_MEM:mux_Stall
port map(  Din1 =>'0',
           Din2 =>signal_Control_Out_2(10),
           Sel2 =>'1',
           Dout =>signal_stall_Mem_we
);



Register_EX_MEM: Register_3 
 Port map (
           CLK =>CLK,
           RST =>RST,
           Data1 => signal_ALU_out,
			  Data2 => signal_RF_B_out_wait,
			  Data3 =>signal_RD_out,
           WE =>'1',
			  Data1_out =>signal_Alu_address,
			  Data2_out =>signal_RFB_Reg_out,
           Data3_out	=>	signal_RD_Reg_out 
           
);
 

exception_module_top: exception_module 
port map (
            RST=>RST,
				we_in=>signal_Control_Out_1(13),
				ovf_exception =>ovf_exception_sig,
				Instr=>signal_Instr,
				alu_out_exception =>signal_ALU_out,
				out_1 =>out1_s,
				out_2 =>out2_s,
				mux_sel=>mux_sel_sig_ram,
				we=>we_exception_s,
				mux_exception_sel =>mux_exception_sel_sig,
				mux_sel_epc=>mux_sel_epc_sig,
				cause_out =>cause_data_sig
				);





Epc_register:register_epc
Port map ( CLK =>CLK,
           RST =>RST,
           Data1 =>data_epc_sig,
           WE =>we_exception_s,
           Data1_out =>epc_out_sig);





cause_register: Register_B1
Port map ( CLK =>CLK,
           RST =>RST,
           Data =>cause_data_sig,
           WE =>we_exception_s,
           Dout =>cause_out_sig);

--sum_epc_sig <= ram_epc_in_sig    - "00000000000000000000000000000100";


--sum_epc_sig1 <=	ram_epc_in_sig     "11111111111111111111111111111100";	


adfdsb:aferesi 

 Port map( 
           A =>ram_epc_in_sig,
           B => "00000000000000000000000000000100",
           Athrisma=>sum_epc_sig1
			  );



mux_epx:  mux3_pc 
port map( data1 =>ram_epc_in_sig,
          data2 =>sum_epc_sig1,
          sel =>mux_sel_epc_sig,
          Data_out =>data_epc_sig
			 );






control : Control_Module 
    Port map ( 
          	 CLK =>CLK,
			  RST =>RST,
			  flag=>signal_flag,
			  Instr =>signal_Instr,
           Control_Out =>signal_Control_in,
			  Control_RT_RD=>signal_RT_RD_sel,
			  opcode =>signal_opcode_out,
			  Rs_1=>signal_Instr1(25 downto 21),
			  Rt_Dec_Ex =>signal_RT_out,
			  rt =>signal_Instr1(15 downto 11),
			  instr_Out=>signal_Instr1
);

register_Control_1 : Register_Control
port map(
           Excep=>out1_s,
			  CLK =>CLK,
           RST =>RST,
           Data =>signal_Control_in,
           WE =>'1',
           Dout =>signal_Control_Out_1
			  );

register_Control_2 : Register_Control
port map(
           Excep=>out2_s,
			  CLK =>CLK,
           RST =>RST,
           Data =>signal_Control_Out_1,
           WE =>'1',
           Dout =>signal_Control_Out_2
			  );
			  
			  
register_Control_3 : Register_Control
port map(
           Excep=>'0',
			  CLK =>CLK,
           RST =>RST,
           Data =>signal_Control_Out_2,
           WE =>'1',
           Dout =>signal_Control_Out_3
			  );


mini_Control_RT_RD : mini_Control
port map(
			  RST =>RST,
			  Instr =>signal_Instr1,
           Control_Out=>signal_mini_Control 
			  );


regex_mem:Register_2_32
Port map(     
           CLK =>CLK,
           RST =>RST,
           Data1=>signal_RF_A_out,
			  Data2=>signal_RF_B_out,
           WE=>'1',
			  Data1_out=>signal_RF_A_out_wait,
			  Data2_out=>signal_RF_B_out_wait
			  );
			  
			  
FW_module:Forward_module
Port map(  
           Rs_Dec_Ex=>signal_RS_out,
			  Rt_Dec_Ex=>signal_RT_out,
			  Rd_Ex_Mem=>signal_RD_Reg_out,
           Rd_Mem_WB =>signal_RD_Reg_out_regWB,
           Ex_Mem_RF_WrEN=>signal_Control_Out_2(2),
           Mem_WB_RF_WrEN=>signal_Control_Out_3(2),
			  FwA=>FWA_sel_sig,
			  FwB=>FWB_sel_sig
			  );


filp:Register_4 
Port map(     CLK=>CLK,
           RST=>RST,
           Data1 =>signal_Control_Out_1(1),
           WE =>'1',
			  Data1_out =>signal_flag
			 				
			  );
			  

			  

end Behavioral;

