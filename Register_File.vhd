----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:04 03/06/2018 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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

entity Register_File is
Port (     Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);

end Register_File;

architecture Behavioral of Register_File is

signal Decoder_out_sig :STD_LOGIC_VECTOR (31 downto 0);   

signal AND_Gate_sig : STD_LOGIC_VECTOR (31 downto 0);     

signal sel_mux_sig : STD_LOGIC;        
signal sel_mux2_sig : STD_LOGIC;     

signal Mux32x5_Out1_sig : STD_LOGIC_VECTOR (31 downto 0);  
signal Mux32x5_Out2_sig : STD_LOGIC_VECTOR (31 downto 0);  

signal Reg_Out_0 : STD_LOGIC_VECTOR (31 downto 0); 
signal Reg_Out_1 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_2 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_3 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_4 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_5 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_6 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_7 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_8 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_9 : STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_10 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_11 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_12 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_13 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_14 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_15 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_16 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_17 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_18 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_19 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_20 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_21 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_22 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_23 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_24 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_25 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_26 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_27 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_28 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_29 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_30 :  STD_LOGIC_VECTOR (31 downto 0);
signal Reg_Out_31 :  STD_LOGIC_VECTOR (31 downto 0);


----------------------------------------------------------------------------------------------

Component Decoder_5x32 is
    Port ( Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Decoder_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component Register_B1 is
		Port ( 
		     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component Mux_32x5 is
    Port ( Reg_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_4 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_6 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_8 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_9 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_10 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_11 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_12 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_13 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_14 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_15 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_16 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_17 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_18 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_19 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_20 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_21 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_22 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_23 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_24 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_25 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_26 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_27 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_28 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_29 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_31 : in  STD_LOGIC_VECTOR (31 downto 0);
           SEL : in  STD_LOGIC_VECTOR (4 downto 0);
           MUX32x5_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component Mux_64x1 is
    Port ( 
	        DataIN_MUX32x5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel2 : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Component;

Component Compare_module is
 Port ( 
           WriteEn : in  STD_LOGIC;
           AddRead : in  STD_LOGIC_VECTOR (4 downto 0);
           AddWrite : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel2 : out  STD_LOGIC
			  );
end Component;


begin



Decoder : Decoder_5x32
Port map(
         Awr => Awr,
		   Decoder_Out => Decoder_out_sig
			);
		
		

AND_Gate_sig(0) <= '0';
AND_Gate_sig(1) <= (WrEn) AND (Decoder_out_sig(1));
AND_Gate_sig(2) <= (WrEn) AND (Decoder_out_sig(2));
AND_Gate_sig(3) <= (WrEn) AND (Decoder_out_sig(3));
AND_Gate_sig(4) <= (WrEn) AND (Decoder_out_sig(4));
AND_Gate_sig(5) <= (WrEn) AND (Decoder_out_sig(5));
AND_Gate_sig(6) <= (WrEn) AND (Decoder_out_sig(6));
AND_Gate_sig(7) <= (WrEn) AND (Decoder_out_sig(7));
AND_Gate_sig(8) <= (WrEn) AND (Decoder_out_sig(8));
AND_Gate_sig(9) <= (WrEn) AND (Decoder_out_sig(9));
AND_Gate_sig(10) <= (WrEn) AND (Decoder_out_sig(10));
AND_Gate_sig(11) <= (WrEn) AND (Decoder_out_sig(11));
AND_Gate_sig(12) <= (WrEn) AND (Decoder_out_sig(12));
AND_Gate_sig(13) <= (WrEn) AND (Decoder_out_sig(13));
AND_Gate_sig(14) <= (WrEn) AND (Decoder_out_sig(14));
AND_Gate_sig(15) <= (WrEn) AND (Decoder_out_sig(15));
AND_Gate_sig(16) <= (WrEn) AND (Decoder_out_sig(16));
AND_Gate_sig(17) <= (WrEn) AND (Decoder_out_sig(17));
AND_Gate_sig(18) <= (WrEn) AND (Decoder_out_sig(18));
AND_Gate_sig(19) <= (WrEn) AND (Decoder_out_sig(19));
AND_Gate_sig(20) <= (WrEn) AND (Decoder_out_sig(20));
AND_Gate_sig(21) <= (WrEn) AND (Decoder_out_sig(21));
AND_Gate_sig(22) <= (WrEn) AND (Decoder_out_sig(22));
AND_Gate_sig(23) <= (WrEn) AND (Decoder_out_sig(23));
AND_Gate_sig(24) <= (WrEn) AND (Decoder_out_sig(24));
AND_Gate_sig(25) <= (WrEn) AND (Decoder_out_sig(25));
AND_Gate_sig(26) <= (WrEn) AND (Decoder_out_sig(26));
AND_Gate_sig(27) <= (WrEn) AND (Decoder_out_sig(27));
AND_Gate_sig(28) <= (WrEn) AND (Decoder_out_sig(28));
AND_Gate_sig(29) <= (WrEn) AND (Decoder_out_sig(29));
AND_Gate_sig(30) <= (WrEn) AND (Decoder_out_sig(30));
AND_Gate_sig(31) <= (WrEn) AND (Decoder_out_sig(31));
		
		


Register0 : Register_B1				
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(0),
       Dout =>  Reg_Out_0 );
		 
Register1 : Register_B1			 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(1),
       Dout =>  Reg_Out_1 );
		 
Register2 : Register_B1	
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  =>AND_Gate_sig(2),
       Dout =>  Reg_Out_2 );
		 
Register3 : Register_B1	
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(3),
       Dout =>  Reg_Out_3 );
		 
Register4 : Register_B1	
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(4),
       Dout =>  Reg_Out_4 );
		 
Register5 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(5),
       Dout =>  Reg_Out_5 );
		 
Register6 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(6),
       Dout =>  Reg_Out_6 );
		 
Register7 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(7),
       Dout =>  Reg_Out_7 );
		 
Register8 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(8),
       Dout =>  Reg_Out_8 );
		 
Register9 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(9),
       Dout =>  Reg_Out_9 );
		 
Register10 : Register_B1
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(10),
       Dout =>  Reg_Out_10 );
		
Register11 : Register_B1		
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(11),
       Dout =>  Reg_Out_11 );
		 
Register12 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  =>AND_Gate_sig(12),
       Dout => Reg_Out_12 );
		 
Register13 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(13),
       Dout =>  Reg_Out_13 );
		 
Register14 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(14),
       Dout =>  Reg_Out_14 );
		 
Register15 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(15),
       Dout =>  Reg_Out_15 );
		 
Register16 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(16),
       Dout =>  Reg_Out_16 );
		 
Register17 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(17),
       Dout =>  Reg_Out_17 );
		 
Register18 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(18),
       Dout =>  Reg_Out_18 );
		 
Register19 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(19),
       Dout =>  Reg_Out_19 );
		 
Register20 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(20),
       Dout =>  Reg_Out_20 );
		 
Register21 : Register_B1
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(21),
       Dout =>  Reg_Out_21 );
		 
Register22 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(22),
       Dout =>  Reg_Out_22 );
		 
Register23 : Register_B1
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(23),
       Dout =>  Reg_Out_23 );
		 
Register24 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE => AND_Gate_sig(24),
       Dout =>  Reg_Out_24 );
		 
Register25 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(25),
       Dout =>  Reg_Out_25 );
		 
Register26 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(26),
       Dout =>  Reg_Out_26 );
		 
Register27 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(27),
       Dout =>  Reg_Out_27 );
		 
Register28 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(28),
       Dout =>  Reg_Out_28 );
		 
Register29 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(29),
       Dout =>  Reg_Out_29 );
		 
Register30 : Register_B1		 
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(30),
       Dout =>  Reg_Out_30 );
		 
Register31 : Register_B1
Port map( CLK => CLK,
       RST  => RST,
       Data => Din,
       WE  => AND_Gate_sig(31),
       Dout =>  Reg_Out_31 );
		 


MUX32_1: Mux_32x5
 Port map( Reg_0 => Reg_Out_0,   
           Reg_1 => Reg_Out_1,
           Reg_2 => Reg_Out_2,
           Reg_3 => Reg_Out_3,
           Reg_4 => Reg_Out_4,
           Reg_5 => Reg_Out_5,
           Reg_6 => Reg_Out_6,
           Reg_7 => Reg_Out_7,
           Reg_8 => Reg_Out_8,
           Reg_9 => Reg_Out_9,
           Reg_10 => Reg_Out_10,
           Reg_11 => Reg_Out_11,
           Reg_12 => Reg_Out_12,
           Reg_13 => Reg_Out_13,
           Reg_14 => Reg_Out_14,
           Reg_15 => Reg_Out_15,
           Reg_16 => Reg_Out_16,
           Reg_17 => Reg_Out_17,
           Reg_18 => Reg_Out_18,
           Reg_19 => Reg_Out_19,
           Reg_20 => Reg_Out_20,
           Reg_21 => Reg_Out_21,
           Reg_22 => Reg_Out_22,
           Reg_23 => Reg_Out_23,
           Reg_24 => Reg_Out_24,
           Reg_25 => Reg_Out_25,
           Reg_26 => Reg_Out_26,
           Reg_27 => Reg_Out_27,
           Reg_28 => Reg_Out_28,
           Reg_29 => Reg_Out_29,
           Reg_30 => Reg_Out_30,
           Reg_31 => Reg_Out_31,
           Sel    => Ard1  ,
			  MUX32x5_Out => Mux32x5_Out1_sig);



MUX32_2: Mux_32x5
 Port map( Reg_0 => Reg_Out_0,
           Reg_1 => Reg_Out_1,
           Reg_2 => Reg_Out_2,
           Reg_3 => Reg_Out_3,
           Reg_4 => Reg_Out_4,
           Reg_5 => Reg_Out_5,
           Reg_6 => Reg_Out_6,
           Reg_7 => Reg_Out_7,
           Reg_8 => Reg_Out_8,
           Reg_9 => Reg_Out_9,
           Reg_10 => Reg_Out_10,
           Reg_11 => Reg_Out_11,
           Reg_12 => Reg_Out_12,
           Reg_13 => Reg_Out_13,
           Reg_14 => Reg_Out_14,
           Reg_15 => Reg_Out_15,
           Reg_16 => Reg_Out_16,
           Reg_17 => Reg_Out_17,
           Reg_18 => Reg_Out_18,
           Reg_19 => Reg_Out_19,
           Reg_20 => Reg_Out_20,
           Reg_21 => Reg_Out_21,
           Reg_22 => Reg_Out_22,
           Reg_23 => Reg_Out_23,
           Reg_24 => Reg_Out_24,
           Reg_25 => Reg_Out_25,
           Reg_26 => Reg_Out_26,
           Reg_27 => Reg_Out_27,
           Reg_28 => Reg_Out_28,
           Reg_29 => Reg_Out_29,
           Reg_30 => Reg_Out_30,
           Reg_31 => Reg_Out_31,
           Sel    => Ard2  ,
			  MUX32x5_Out => Mux32x5_Out2_sig);






Compare_module_1: Compare_module
Port map(  WriteEn => WrEn,
           AddRead => Ard1,
           AddWrite =>Awr,
           Sel2 =>sel_mux_sig );



Compare_module_2: Compare_module
Port map(  WriteEn => WrEn,
           AddRead => Ard2,
           AddWrite =>Awr,
           SEL2 =>sel_mux2_sig );

--Port Map gia MUX2:



Mux_64x1_1: Mux_64x1
Port map ( DataIN_MUX32x5 => Mux32x5_Out1_sig,
           Din => Din,
           Sel2 =>sel_mux_sig,
           Dout =>Dout1 );



Mux_64x1_2: Mux_64x1
Port map ( DataIN_MUX32x5 => Mux32x5_Out2_sig,
           Din => Din,
           Sel2=>sel_mux2_sig,
           Dout =>Dout2 );



end Behavioral;

