library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PipeLine is
    port(
				CLK				:    in 	std_logic;
            entr0_in       :    in 	std_logic_vector(15 downto 0);
            entr1_in       :    in 	std_logic_vector(15 downto 0);
            op_in    		:    in	std_logic_vector(7 downto 0);
            sortie_in      :    in 	std_logic_vector(15 downto 0);
				entr0_out      :    out	std_logic_vector(15 downto 0);
            entr1_out      :    out	std_logic_vector(15 downto 0);
            op_out    		:    out	std_logic_vector(7 downto 0);
            sortie_out     :    out	std_logic_vector(15 downto 0)
        );
end entity;


architecture a_PipeLine of PipeLine is

begin

	process
	begin
		wait until CLK'event and CLK='1';
		
		entr0_out <= entr0_in;
		entr1_out <= entr1_in;
		op_out <= op_in;
		sortie_out <= sortie_in;


	end process;
	


end architecture;
