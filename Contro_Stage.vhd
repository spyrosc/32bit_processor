----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:27:22 03/26/2018 
-- Design Name: 
-- Module Name:    Contro_Stage - Behavioral 
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

entity Control_Stage is
Port (     CLK : in  STD_LOGIC;
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
end Control_Stage;


architecture Behavioral of Control_Stage is

TYPE FSM_State IS (Reset_state,arxiki_state,Wait_state,Opp_state,    --Arxikopoihseis kai elegxoi
						 State_ALF,State_AL_Func,State_AL_Final,               --Arithmetic and Logic
						 State_ALImmed,State_ALImmed_Func,State_ALImmed_Final, ----Arithmetic and Logic I-Format
						 State_Branch,State_Branch_Func,State_If_Zero,State_Branch_Final, --Branch
						 State_Load,State_LByte,State_LWord,State_Load_To_Reg,State_LFinal, --Load
						 State_Store,State_SFinal,         --Store
						 Final,State_MEM_save,State_SDelay,
						 State_U,                          --Unknown
						 State_Wait_for_Next, nop);
signal State : FSM_State;

signal temp_PC_sel : STD_LOGIC := '0';
signal temp_RF_B_sel : STD_LOGIC := '0';
signal temp_PC_LdEn : STD_LOGIC := '0';
signal temp_RF_WrEn : STD_LOGIC := '0';
signal temp_ALU_Bin_sel : STD_LOGIC := '0';
signal temp_MEM_WrEn : STD_LOGIC := '0';
signal temp_MEM_in_SEL : STD_LOGIC := '0';
signal temp_MEM_out_SEL : STD_LOGIC := '0';

signal temp_RF_WrData_sel : STD_LOGIC_VECTOR (1 downto 0) := "00"; 
signal temp_ALU_func : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal OpCode : STD_LOGIC_VECTOR(5 downto 0);
signal Func : STD_LOGIC_VECTOR(5 downto 0);
signal rd  : STD_LOGIC_VECTOR(4 downto 0);

begin

	OpCode <= Instr(31 downto 26);
	Func   <= Instr (5 downto 0);
   rd <=  Instr(20 downto 16);
	process
		begin
	
		wait until clk'event and clk = '1' ;
	
		if (RST='1') then
			State <= Reset_state;
		else
			case State is
			
				when Reset_state =>
				temp_PC_sel  <= '0'; 
				temp_PC_LdEn <= '0';
				temp_RF_B_sel<= '0';
				temp_RF_WrEn <= '0';
				temp_RF_WrData_sel <= "00";
				temp_ALU_Bin_sel  <= '0';
				temp_ALU_func	  	<= "0000";
				temp_MEM_WrEn		<= '0';
				temp_MEM_in_SEL	<= '0';
				temp_MEM_out_SEL	<= '0';
					
				State<=arxiki_state;
				
				
				when arxiki_state =>
				temp_PC_sel  <= '0'; 
				temp_PC_LdEn <= '0';
				temp_RF_B_sel<= '0';
				temp_RF_WrEn <= '0';
				temp_RF_WrData_sel <= "00";
				temp_ALU_Bin_sel  <= '0';
				temp_ALU_func	  	<= "0000";
				temp_MEM_WrEn		<= '0';
				temp_MEM_in_SEL	<= '0';
				temp_MEM_out_SEL	<= '0';
				
			
					
				State <= Wait_state;

				when Wait_state =>
					
					State <= Opp_state;
					
				when Opp_state =>
					If(Instr="00000000000000000000000000000000") then
				       State	<= nop;
					elsif (OpCode="111000" and rd="00000") or (OpCode="000011" and rd="00000") or (OpCode="000111" and rd="00000") or (OpCode="001111" and rd="00000") or (OpCode="011111" and rd="00000") then  
						 State	<= nop;-- den ginete na grapsoyme sto kataxwriti 0 (rd)
				   elsif OpCode = "100000" then
						State <= State_ALF;  ---praxis stin alu
					elsif (OpCode = "111000") or (OpCode = "111001") or (OpCode = "110000") or (OpCode = "110010") or (OpCode = "110011") then
						State <= State_ALImmed;  -- praxeis  Immed
					elsif (OpCode = "111111") or (OpCode = "000000") or (OpCode = "000001")  then
						State <= State_Branch;	--  diakladwsi
					elsif (OpCode = "000011") or (OpCode = "001111") then
						State <= State_Load;     --Load
					elsif (OpCode = "000111") or (OpCode = "011111") then
						State <= State_Store;     --Store
					else
						State <= State_U;    --Unknown
					end if;
				
				--Arithmetic And Logic Functions				
				when State_ALF =>
					temp_ALU_Bin_sel <= '0';  --gia na parw to RF_B anti tou Immed
					temp_RF_WrEn  <= '0';	  
					temp_MEM_WrEn <= '0';
					temp_PC_sel  <= '0';      --gia na parw to PC +4 
					temp_RF_B_sel <= '0';	  --gia na parw ta dedomena tou Rt ( R-Format)
					
					State <= State_AL_Func;
				
				when State_AL_Func =>
					temp_ALU_func <= Func(3 downto 0);  
					temp_RF_WrData_sel <= "00";	--Logw select apo MUX3 sto DECSTAGE (Din0 --> ALU_OUT)
					
					State <= State_AL_Final;
					
				when State_AL_Final =>
					temp_RF_WrEn  <= '1';      -- grafw stin RF
					temp_MEM_WrEn <= '0';
					temp_PC_LdEn  <= '1';		 --paw stin epomeni entoli
					temp_RF_B_sel <= '0';
													
					State <= Final;

				--Arithmetic And Logic with Immediate 
				when State_ALImmed =>
				   temp_PC_sel  <= '0';
					temp_ALU_Bin_sel <= '1';    --gia na parw to Immed anti tou RF_B
					temp_RF_WrEn  <= '1';       
					temp_MEM_WrEn <= '0';
					temp_PC_LdEn  <= '0';
					  
					
					if OpCode = "111000" OR OpCode = "111001" then  --li kai lui
						temp_RF_WrData_sel <= "11";   ----Logw select apo MUX3 sto DECSTAGE (Din3 --> Immed_Out)
						temp_RF_WrEn  		<= '1';
						State <= State_ALImmed_Final;
					elsif (Instr(31 downto 26) ="110000") then    --addi
						temp_ALU_func <= "0000";    --add
						temp_ALU_Bin_sel <= '1';    --gia na parw to Immed
						temp_RF_WrEn  	 <= '1';
						
						State <= State_ALImmed_Func;
					elsif Opcode ="110010" then  --andi
						temp_ALU_func <= "0010";  --and
						temp_ALU_Bin_sel <= '1';
						temp_RF_WrEn  	 <= '1';
						State <= State_ALImmed_Func;
					elsif Opcode ="110011" then    --ori
						temp_ALU_func <= "0011";    --or
						temp_ALU_Bin_sel <= '1';
						temp_RF_WrEn  	 <= '1';
						
						State <= State_ALImmed_Func;
					else
						State <= State_U;
					end if;
					
				when State_ALImmed_Func =>
					
					State <= State_ALImmed_Final;
					
				when State_ALImmed_Final =>
					temp_RF_WrData_sel <= "00";	--Logw select apo MUX3 sto DECSTAGE (Din0 --> ALU_OUT)
					temp_RF_WrEn  <= '0';
					temp_MEM_WrEn <= '0';
					temp_PC_LdEn  <= '1';
					temp_RF_B_sel <= '0'; 
					State <= Final;

				--Branch
				when State_Branch =>
					temp_ALU_Bin_sel <= '0';
					temp_RF_WrEn  <= '0';
					temp_MEM_WrEn <= '0';
					temp_PC_LdEn  <= '0';

					if(OpCode = "111111") then   --b : PC <- pc + 4 + signExtend(Imm) <<2 
						temp_PC_sel   <= '1';
						temp_PC_LdEn  <= '1';
					
						State <= State_Branch_Final;
					else
						temp_RF_B_sel <= '1';   --gia na parw to rd 
						                       --Afou meta 8a sigrinw RF[rs]==RF[rd]
						State <= State_Branch_Func;
					end if;
					
				when State_Branch_Func =>			--Prwta kanw afairesh
					temp_ALU_func <= "0001";  --sub
					
					State <= State_If_Zero;
					
				when State_If_Zero =>
					if (Zero_equals = '1' and OpCode = "000000") OR (Zero_equals = '0' and OpCode = "000001") then
						temp_PC_sel <= '1';
						temp_PC_LdEn<= '1';
					else
						temp_PC_sel <= '0';
						temp_PC_LdEn<= '1';
					end if;
					
					State <= State_Branch_Final;
					
				when State_Branch_Final =>
					temp_PC_sel <= '0';
					temp_PC_LdEn<= '0';
					
					State <= Final;
					
				--Load
				when State_Load =>
				 if (Instr(31 downto 26)="000011") then     --lb
				 	temp_ALU_Bin_sel   <= '1';   -- gia na parw to Immed
				   State <= State_LByte;
				 elsif (Instr(31 downto 26)="001111") then   --lw
				 	temp_ALU_Bin_sel   <= '1';
					State <= State_LWord;
				 else 
					State <= State_U;
				 end if; 
				
				when State_LByte =>
					temp_MEM_out_SEL	<= '1';   --kai na kanw load tin exodo tis Mnimis mesw tou S_L module
					temp_RF_WrData_sel <= "10";  --Logw select apo MUX3 sto DECSTAGE (Din2 --> MEM_OUT)  
					temp_ALU_func <= "0000";
					
					State <= State_Load_To_Reg;
					
				when State_LWord =>
					temp_MEM_out_SEL	<= '1'; 
					temp_RF_WrData_sel <= "10";   --Logw select apo MUX3 sto DECSTAGE (Din2 --> MEM_OUT)  
					temp_ALU_func <= "0000";
					
					State <= State_Load_To_Reg;
					
				when State_Load_To_Reg =>	
					temp_RF_WrData_sel <= "10";    --Logw select apo MUX3 sto DECSTAGE (Din2 --> MEM_OUT) 
					temp_RF_WrEn <= '1';
					
					State <= State_LFinal;
				
				when State_LFinal =>
					temp_RF_WrEn <= '0';
					temp_PC_LdEn <= '1';
					
					State <= State_MEM_save;
				
				--Store
				
				when State_Store =>
				  if (Instr(31 downto 26)="000111") then     --sb
				 	temp_ALU_Bin_sel   <= '1';  
					temp_RF_B_sel		 <= '1';  --Gia na parw rd afou thelw RF[rd]
					temp_ALU_func      <= "0000";
					temp_MEM_in_SEL	 <= '1';
					temp_MEM_WrEn 		 <= '1';
					
				   State <= State_SFinal;
				 elsif (Instr(31 downto 26)="011111") then    --sw
				 	temp_ALU_Bin_sel   <= '1';
					temp_RF_B_sel		<= '1';
					temp_ALU_func <= "0000";
					temp_MEM_in_SEL	<= '0';
					temp_MEM_WrEn 		<= '1';
					
					State <= State_SFinal;
				 else 
					State <= State_U;
				 end if; 

					
				when State_SFinal =>
				   temp_PC_LdEn  <= '1';
					
					State <= State_SDelay;
					
				when State_SDelay =>
					temp_PC_LdEn  <= '0';
					
					State <= arxiki_state;
					
				when Final =>
					temp_PC_sel  <= '0'; 
					temp_PC_LdEn <= '0';
					temp_RF_B_sel<= '0';
					temp_RF_WrEn <= '0';
					temp_RF_WrData_sel <= "00";
					temp_ALU_Bin_sel  <= '0';
					temp_ALU_func	  	<= "0000";
					temp_MEM_WrEn		<= '0';
					temp_MEM_in_SEL	<= '0';
					temp_MEM_out_SEL	<= '0';
					
					
					State <= arxiki_state;
					
				when State_MEM_save =>

					temp_MEM_WrEn <= '0';
					
					State <= arxiki_state;
					
				when State_U =>
					temp_PC_LdEn <= '1';
					
					State <= State_Wait_for_Next;	

				when State_Wait_for_Next =>
					temp_PC_LdEn <= '0';
				 
					State <= Final;
				 
				when nop =>
					temp_RF_WrEn	<='0';
					temp_MEM_WrEn  <='0';
					temp_PC_LdEn	<='1';
					temp_PC_sel  	<='0';
					
					State<= Final;
				 
				when others =>
					temp_PC_LdEn <= '1';
					
					State <= State_Wait_for_Next;
				
			end case;	
		end if;
	
	end process;
	
	PC_sel <= temp_PC_sel;
	RF_B_sel <= temp_RF_B_sel;
   PC_LdEn <= temp_PC_LdEn;
	RF_WrEn <= temp_RF_WrEn;
	ALU_Bin_sel <= temp_ALU_Bin_sel;
	RF_WrData_sel <= temp_RF_WrData_sel;         
	ALU_func <= temp_ALU_func;
   MEM_WrEn <= temp_MEM_WrEn;
	MEM_in_SEL <= temp_MEM_in_SEL;
	MEM_out_SEL <= temp_MEM_out_SEL;





end Behavioral;

