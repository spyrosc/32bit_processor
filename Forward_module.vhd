----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:56 05/08/2018 
-- Design Name: 
-- Module Name:    Forward_module - Behavioral 
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

entity Forward_module is
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
end Forward_module;

architecture Behavioral of Forward_module is

signal FWA_sig,FWB_sig: STD_LOGIC_VECTOR (1 downto 0);

begin

	 process(Ex_Mem_RF_WrEN,Rd_Ex_Mem,Rs_Dec_Ex,Rt_Dec_Ex,FWA_sig,FWB_sig,Mem_WB_RF_WrEN,Rd_Mem_WB)
		begin
         if(Ex_Mem_RF_WrEN='1' and Rd_Ex_Mem=Rs_Dec_Ex) then 
          FWA_sig<="00";
			 elsif(Mem_WB_RF_WrEN='1' and Rd_Mem_WB=Rs_Dec_Ex) then 
			 FWA_sig<="00";
			 else
			 FWA_sig<="00";
			 end if;
			 if(Ex_Mem_RF_WrEN='1' and Rd_Ex_Mem=Rt_Dec_Ex) then 
			 FWB_sig<="00";
			 elsif(Mem_WB_RF_WrEN='1' and Rd_Mem_WB=Rt_Dec_Ex) then 
			 FWB_sig<="00";
			 else
			 FWB_sig<="00";
          end if;

end process;

FwA<=FWA_sig;
FwB<=FWB_sig;

end Behavioral;

