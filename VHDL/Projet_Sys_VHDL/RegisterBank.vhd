----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:43 05/18/2018 
-- Design Name: 
-- Module Name:    RegisterBank - Behavioral 
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

entity bancoreg is
	 port( select_lw1	: in std_logic_vector(3 downto 0);	-- registre pour la sortie 1
		    select_lw2	: in std_logic_vector(3 downto 0);	-- registre pour la sortie 2
		    select_wr	: in std_logic_vector(3 downto 0);	-- registre pour ecriture
		    clk			: in std_logic;				
		    rst			: in std_logic;
		    wr_en			: in std_logic;					   -- ENABLE pour ecriture
		    wr_data		: in std_logic_vector(15 downto 0); -- Donnee pour ecriture
		    data_out1	: out std_logic_vector(15 downto 0);-- Sortie 1
		    data_out2	: out std_logic_vector(15 downto 0) -- Sortie 2
		  
	);
end entity;

architecture a_bancoreg of bancoreg is
	component reg16bits is
		port(clk		: in std_logic;
		     rst		: in std_logic;
		     wr_en		: in std_logic;
		     data_in	: in std_logic_vector(15 downto 0);
		     data_out	: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal wr_en0, wr_en1, wr_en2, wr_en3, wr_en4, wr_en5, wr_en6, wr_en7, wr_en8, wr_en9, wr_en10, wr_en11, wr_en12, wr_en13, wr_en14, wr_en15: std_logic;	--para liberar o write de cada um separado
	signal data_out_reg0, data_out_reg1, data_out_reg2, data_out_reg3, data_out_reg4, data_out_reg5, data_out_reg6, data_out_reg7, data_out_reg8, data_out_reg9, data_out_reg10, data_out_reg11, data_out_reg12, data_out_reg13, data_out_reg14, data_out_reg15: std_logic_vector(15 downto 0);
	
	--type regs is array(16) of std_logic_vector...;
	--signal regs: regs;
	
begin
	--qa <= regs(conv_integer(select_lw1)) when ....
	
	reg0: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en0, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg0
							);
							
	reg1: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en1, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg1
							);
								
	reg2: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en2, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg2
							);
							
	reg3: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en3, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg3
							);	
							
	reg4: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en4, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg4
							);
							
	reg5: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en5, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg5
							);
	reg6: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en6, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg6
							);
							
	reg7: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en7, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg7
							);	

	reg8: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en8, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg8
							);
							
	reg9: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en9, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg9
							);	
							
	reg10: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en10, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg10
							);	
							
	reg11: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en11, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg11
							);	
							
	reg12: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en12, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg12
							);	
							
	reg13: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en13, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg13
							);	

	reg14: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en14, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg14
							);	
	
	reg15: reg16bits port map(	clk 	=> clk, 
								rst 			=> rst, 
								wr_en 		=> wr_en15, 
								data_in 		=> wr_data, 
								data_out 	=> data_out_reg15
							);	
	
	wr_en0 <= '0';
	wr_en1 <= wr_en when select_wr = "0001" else '0';
	wr_en2 <= wr_en when select_wr = "0010" else '0';
	wr_en3 <= wr_en when select_wr = "0011" else '0';
	wr_en4 <= wr_en when select_wr = "0100" else '0';
	wr_en5 <= wr_en when select_wr = "0101" else '0';
	wr_en6 <= wr_en when select_wr = "0110" else '0';
	wr_en7 <= wr_en when select_wr = "0111" else '0';
	wr_en8 <= wr_en when select_wr = "1000" else '0';
	wr_en9 <= wr_en when select_wr = "1001" else '0';
	wr_en10 <= wr_en when select_wr = "1010" else '0';
	wr_en11 <= wr_en when select_wr = "1011" else '0';
	wr_en12 <= wr_en when select_wr = "1100" else '0';
	wr_en13 <= wr_en when select_wr = "1101" else '0';
	wr_en14 <= wr_en when select_wr = "1110" else '0';
	wr_en15 <= wr_en when select_wr = "1111" else '0';
	
	data_out1 <= wr_data when wr_en = '1' and select_wr = select_lw1 else -- bypass
				 data_out_reg0 when select_lw1 = "0000" else
				 data_out_reg1 when select_lw1 = "0001" else
				 data_out_reg2 when select_lw1 = "0010" else
				 data_out_reg3 when select_lw1 = "0011" else
				 data_out_reg4 when select_lw1 = "0100" else
				 data_out_reg5 when select_lw1 = "0101" else
				 data_out_reg6 when select_lw1 = "0110" else
				 data_out_reg7 when select_lw1 = "0111" else
				 data_out_reg8 when select_lw1 = "1000" else
				 data_out_reg9 when select_lw1 = "1001" else
				 data_out_reg10 when select_lw1 = "1010" else
				 data_out_reg11 when select_lw1 = "1011" else
				 data_out_reg12 when select_lw1 = "1100" else
				 data_out_reg13 when select_lw1 = "1101" else
				 data_out_reg14 when select_lw1 = "1110" else
				 data_out_reg15 when select_lw1 = "1111" else
				 x"0000";
	
	data_out2 <= data_out_reg0 when select_lw2 = "000" else
				 data_out_reg1 when select_lw2 = "001" else
				 data_out_reg2 when select_lw2 = "010" else
				 data_out_reg3 when select_lw2 = "011" else
				 data_out_reg4 when select_lw2 = "100" else
				 data_out_reg5 when select_lw2 = "101" else
				 data_out_reg6 when select_lw2 = "110" else
				 data_out_reg7 when select_lw2 = "111" else
				 data_out_reg8 when select_lw2 = "1000" else
				 data_out_reg9 when select_lw2 = "1001" else
				 data_out_reg10 when select_lw2 = "1010" else
				 data_out_reg11 when select_lw2 = "1011" else
				 data_out_reg12 when select_lw2 = "1100" else
				 data_out_reg13 when select_lw2 = "1101" else
				 data_out_reg14 when select_lw2 = "1110" else
				 data_out_reg15 when select_lw2 = "1111" else
				 x"0000";
				
end architecture;

