library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-----------------------------------------------------------------------------------------
-- NOTES ON IMPLEMENTATION
--
-- only need to represent positive numbers, then unsigned type; 
-- need to represent negative numbers you need to use the signed type.
-- If you don't really care, because your pattern of bits is not a number 
-- or because your not doing any maths on it 
-- (you're merely transporting it from one place to another), 
-- then you're best off using std_logic_vector.
-----------------------------------------------------------------------------------------
entity ULA is
    port(
            entr0        :    in 	std_logic_vector(15 downto 0);
            entr1        :    in 	std_logic_vector(15 downto 0);
            select_op    :    in		std_logic_vector(7 downto 0);
            sortie       :    out 	std_logic_vector(15 downto 0);
            flag         :    out 	std_logic_vector(3 downto 0)
        );
end entity;

architecture a_ULA of ULA is
	signal resultat: 	std_logic_vector(15 downto 0);
	signal smult: 		std_logic_vector(31 downto 0);
begin
   resultat <=    	std_logic_vector(signed(entr0) + signed(entr1)) 				when select_op = x"00" else
							std_logic_vector(signed(entr0) - signed(entr1)) 				when select_op = x"01" else
							smult(15 downto 0) 														when select_op = x"02" else				--multiplication
							std_logic_vector(signed(entr0) / signed(entr1)) 				when select_op = x"03" AND entr1 /= x"0000" else
							entr0(14 downto 0)&'0'													when select_op = x"04" else				--shift left
							'0'&entr0(15 downto 1) 													when select_op = x"05" else				--shift right
							x"0000";

	smult 	<= 	std_logic_vector(signed(entr0) * signed(entr1));
                    
   flag(0)	<=		'1'    		when select_op = x"06" AND entr0 < entr1 else
						'0';
						
	flag(1) <=		'1' 			when select_op = x"01" AND entr0(15) = entr1(15) AND entr1(15) /= resultat(15) else
						'0' ;


	flag(2) <=		resultat(15);

   flag(3) <=		'1' when select_op = x"00" AND entr0(15) = entr1(15) AND entr0(15) /= resultat(15) else
						'1' when select_op = x"01" AND entr0(15) = entr1(15) AND entr1(15) /= resultat(15) else
						'1' when select_op = x"02" AND entr0(15) /= entr1(15) AND resultat(15) = '0' else
						'1' when select_op = x"03" AND entr0(15) /= entr1(15) AND resultat(15) = '0' else
						'0' ;
						
	sortie 	<= 	resultat(15 downto 0);
end architecture;

-- pour le flag:
-- f0 est Comparation
-- f1 est carry
-- f2 est negatif
-- f3 est overflow  
			-- overflow if entr0[3]=entr1[15] and entr0[15] != resultat[15] pour l'addition
