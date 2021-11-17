----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:36 05/04/2018 
-- Design Name: 
-- Module Name:    Control_Module - Behavioral 
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






entity Control_Module is
    Port ( 
	        CLK: in STD_LOGIC;
			  RST : in STD_LOGIC;
			  flag: in STD_LOGIC;
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
			  Control_RT_RD : out  STD_LOGIC;
			  opcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  Rs_1: in  STD_LOGIC_VECTOR (4 downto 0);
			  Rt_Dec_Ex :in  STD_LOGIC_VECTOR (4 downto 0);
			  rt :in  STD_LOGIC_VECTOR (4 downto 0);
            instr_Out : out  STD_LOGIC_VECTOR (31 downto 0);
           Control_Out : out  STD_LOGIC_VECTOR (17 downto 0)
);
			  
end Control_Module;

architecture Behavioral of Control_Module is

signal RF_WrEn,MEM_WrEn,ALU_Bin_sel,RF_B_sel,Pc_sel,Pc_Ldn,MEM_In_Sel,MEM_Out_Sel,RF_WrData_Sel,flag_load : STD_LOGIC;
signal ALU_Func : STD_LOGIC_VECTOR (3 downto 0);
signal Func,Instr1 : STD_LOGIC_VECTOR (5 downto 0);
signal muxA_sel : STD_LOGIC_VECTOR (1 downto 0);
signal signal1_instr_Out : STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
signal signal_instr_Out : STD_LOGIC_VECTOR (31 downto 0);
begin

		
	process(Instr,RST,RF_WrEn,MEM_WrEn,ALU_Bin_sel,RF_B_sel,flag_load, Pc_sel,Pc_Ldn,MEM_In_Sel,MEM_Out_Sel,RF_WrData_Sel,opcode,muxA_sel,ALU_Func,Rs_1,Rt_Dec_Ex,rt,flag)
	begin
--process(CLK)
--	begin
	--if rising_edge(CLK) then	 
	
	    
		
   
	
			if (RST='1') then
			Pc_Sel			<= '0';
			
			RF_WrEn			<= '0';
			RF_WrData_Sel	<= '0';
			RF_B_sel		   <= '0';
			ALU_Func	      <= "0000";
			ALU_Bin_sel		<= '0';
			MEM_WrEn			<= '0';
			Pc_Ldn <= '0';
			
		
			
		else
			--if(flag='0') then 
			--Pc_Ldn <= '1';
			
		
--			 elsif((opcode="001111") and (Rs_1=Rt_Dec_Ex  or Rt_Dec_Ex=rt ))then			--nop
--			        RF_WrEn <= '0';      
--						MEM_WrEn <= '0';
--						Pc_Ldn <= '0';
						
				if (Instr(31 downto 26) = "111000") then -- li
						RF_WrEn <= '1';
						RF_WrData_Sel <= '1';      
						MEM_WrEn <= '0';
						ALU_Func <= "0000";
						ALU_Bin_sel <= '1';
						RF_B_sel <= '0';
						Pc_Sel <= '0';
					signal_instr_Out <=Instr;
					   muxA_sel <="00";
						Pc_Ldn <= '1';
						flag_load<='0'; 
				elsif (Instr(31 downto 26) = "100000") then -- add
						RF_WrEn <= '1';
						RF_WrData_Sel <='1';       
						MEM_WrEn <= '0';
						ALU_Func <= "0000";
						ALU_Bin_sel <= '0'; 
						--RF_B_sel <= '0';				
						Pc_Sel <= '0';	
						muxA_sel <="01";
					signal_instr_Out <=Instr;
						Pc_Ldn <= '1';
						flag_load<='0'; 
				elsif (Instr(31 downto 26)= "001111") then 
						RF_WrEn <= '1';
						RF_WrData_Sel <= '0';   
						MEM_WrEn <= '0';
						muxA_sel <="01";
						ALU_Func <= "0000";
						ALU_Bin_sel <= '1';
						RF_B_sel <= '0';
						Pc_Sel <= '0';
						signal_instr_Out <=Instr;
						Pc_Ldn <= '1';
						flag_load<='1';
				elsif (Instr(31 downto 26)= "011111") then -- sw
					 	flag_load<='0'; 
					  muxA_sel <="01";
						RF_WrEn <= '0';
						RF_WrData_Sel <= '0';     
						MEM_WrEn <= '1';
						ALU_Func <= "0000";
						ALU_Bin_sel <= '1';
						
						Pc_Sel <= '0';
						signal_instr_Out <=Instr;
						Pc_Ldn <= '1';
	         else 
				     flag_load<='0'; 
				 	   RF_WrEn <= '0';
						RF_WrData_Sel <= '0';      
						MEM_WrEn <= '0';
						ALU_Func <= "1111";
						ALU_Bin_sel <= '1';
						RF_B_sel <= '0';
						Pc_Sel <= '0';
					   signal_instr_Out <=Instr;
					   muxA_sel <="00";
						Pc_Ldn <= '1';
				
				
				end if;
				
						
		end if;

	
	end process;
	
	Control_Out(0) <= '0';
	Control_Out(1) <=Pc_Ldn;	
	Control_Out(2) <= RF_WrEn;
	Control_Out(3) <= RF_WrData_Sel;
	Control_Out(4) <= RF_B_sel;
	Control_Out(8 downto 5) <= ALU_Func;
	Control_Out(9) <= ALU_Bin_sel;
	Control_Out(10) <= MEM_WrEn;
   Control_Out(12 downto 11)<=muxA_sel;
	Control_Out(13)<=flag_load; 
   Control_Out(17 downto 14)<="0000";
	instr_Out<= signal_instr_Out;

end Behavioral;


