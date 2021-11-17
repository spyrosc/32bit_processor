----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:00 05/04/2018 
-- Design Name: 
-- Module Name:    Control_datapath - Behavioral 
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


entity Control_datapath is
  Port ( 
			  RST : in STD_LOGIC;
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Control_Out : out  STD_LOGIC_VECTOR (12 downto 0));
           CLK : in  STD_LOGIC;
end Control_datapath;

architecture Behavioral of Control_datapath is

component Control_Module is
    Port ( 
			  RST : in STD_LOGIC;
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Control_Out : out  STD_LOGIC_VECTOR (12 downto 0));
			  
end component ;


component Register_Control is
Port (     CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (12 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (12 downto 0));
end component;


begin

controlModule : Control_Module
port map (
           RST =>RST,
			  Instr =>Instr,
           Control_Out =>singal_Control_in
			  );
			  
register_Control_1
port map(
			  CLK =>CLK,
           RST =>RST,
           Data =>singal_Control_in,
           WE =>'1',
           Dout =>singal_Control_Out);
			  
register_Control_2
port map(
			  CLK =>CLK,
           RST =>RST,
           Data =>singal_Control_in,
           WE =>'1',
           Dout =>singal_Control_Out);			  



end Behavioral;

