----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:23 05/18/2018 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity reg16bits is
	 port( clk 		: in 	std_logic;
		   rst 		: in 	std_logic;
		   wr_en 	: in 	std_logic;
		   data_in 	: in 	std_logic_vector(15 downto 0);
		   data_out : out std_logic_vector(15 downto 0)
	);
end entity;

architecture a_reg16bits of reg16bits is
	signal reg: std_logic_vector(15 downto 0);
begin
	process(clk,rst,wr_en) -- acionado se houver mudança em clk, rst ou wr_en
	begin
		if rst='0' then
			reg <= x"0000";
		elsif wr_en='1' then
			if rising_edge(clk) then
				reg <= data_in;
			end if;
		end if;
	end process;

	data_out <= reg; -- conexao direta, fora do processo
end architecture;

