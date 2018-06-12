----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:53:53 05/28/2018 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
	port( entr0	 	: out std_logic_vector(15 downto 0);	--registre pour la sortie 1
		   entr1	 	: out std_logic_vector(15 downto 0);	--registre pour la sortie 2
		   sortie 	: out std_logic_vector(15 downto 0);	--registre pour ecriture
		   op		 	: out std_logic_vector(7 downto 0); 		--Operateur
		   
			inst_di	: in std_logic_vector(31 downto 0)		--Instruction
		  
	);
end Decoder;

architecture Behavioral of Decoder is

begin

	
	op <= inst_di(31 downto 24);
	
	entr0 <= inst_di(23 downto 8) when inst_di(31 downto 24) = x"8" OR inst_di(31 downto 24) = x"E" OR inst_di(31 downto 24) = x"F" else
				x"00"&inst_di(23 downto 16) ;
				
	entr1 <= x"00"&inst_di(7 downto 0) when inst_di(31 downto 24) = x"8" OR inst_di(31 downto 24) = x"E" OR inst_di(31 downto 24) = x"F" else
				x"00"&inst_di(15 downto 8) when inst_di(31 downto 24) = x"5" else
				inst_di(15 downto 0) ;
				
	sortie <= x"00"&inst_di(23 downto 16);
				
				
end Behavioral;

