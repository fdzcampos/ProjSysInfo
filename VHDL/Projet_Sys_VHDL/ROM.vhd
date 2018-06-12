----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:30 05/28/2018 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
	port(	
			adress : in std_logic_vector (7 downto 0);
			data   : out std_logic_vector (31 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
	type array_instrs is array (0 to 30) of std_logic_vector(31 downto 0);
	signal instrs : array_instrs;
begin
	instrs <= ( x"0601CAFE", -- afc R1 <= CAFE 
					x"050201FE", -- copy R2 <= R1
					x"0601000A", -- afc R1 <= 000A
					x"06020002", -- afc R2 <= 0002
					x"00020201", -- add R2 <= R2 + R1
					x"0603CAFE", -- afc R3 <= CAFE
					x"08000103", -- store ram(0001) <= R3
					x"07040001", -- load R4 <= ram(0001)
					others => x"00000000");
	data <= instrs(conv_integer(adress));

end Behavioral;

