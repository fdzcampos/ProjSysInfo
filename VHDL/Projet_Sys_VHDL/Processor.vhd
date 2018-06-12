----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:01 06/01/2018 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
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

use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
	port(	CLK		:    	in 	std_logic;
			RST		:    	in 	std_logic;
			inst_a	:  	in std_logic_vector(7 downto 0)
	);
end Processor;

architecture Behavioral of Processor is
	component PipeLine is
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
	end component;
	
	component Decoder is
		port( entr0	 	: out std_logic_vector(15 downto 0);	--registre pour la sortie 1
				entr1	 	: out std_logic_vector(15 downto 0);	--registre pour la sortie 2
				sortie 	: out std_logic_vector(15 downto 0);	--registre pour ecriture
				op		 	: out std_logic_vector(7 downto 0); 		--Operateur
				inst_di	: in std_logic_vector(31 downto 0)		--Instruction
		  
		);
	end component;
	
	component bancoreg is
		port( select_lw1	: in std_logic_vector(3 downto 0);	--registre pour la sortie 1
				select_lw2	: in std_logic_vector(3 downto 0);	--registre pour la sortie 2
				select_wr	: in std_logic_vector(3 downto 0);	--registre pour ecriture
				clk			: in std_logic;				
				rst			: in std_logic;
				wr_en			: in std_logic;							--ENABLE pour ecriture
				wr_data		: in std_logic_vector(15 downto 0); --Donnee pour ecriture
				data_out1	: out std_logic_vector(15 downto 0);--Sortie 1
				data_out2	: out std_logic_vector(15 downto 0) --Sortie 2
			  
		);
	end component;
	
	component ULA is 
		port(
            entr0        :    in 	std_logic_vector(15 downto 0);
            entr1        :    in 	std_logic_vector(15 downto 0);
            select_op    :    in		std_logic_vector(7 downto 0);
            sortie       :    out 	std_logic_vector(15 downto 0);
            flag         :    out 	std_logic_vector(3 downto 0)
        );
	end component;
	
	component bram16 is 
		port(
				sys_clk : in  std_logic;
            sys_rst : in  std_logic;
				we 	  : in  std_logic;
				do 	  : in  std_logic_vector(15 downto 0);
				a	 	  : in std_logic_vector(15 downto 0);
				di 	  : out std_logic_vector(15 downto 0)
        );
	end component;
	
	component ROM is
		port(	
				adress : in std_logic_vector (7 downto 0);
				data   : out std_logic_vector (31 downto 0)
		);
	end component;
	
	-- SIGNAL DECODER
	signal dec_sortie, dec_entr0, dec_entr1 :  std_logic_vector(15 downto 0);
	signal dec_op : 									 std_logic_vector(7 downto 0);
	
	-- SIGNAL PIPELINE LIDI
	signal entr0_lidi, entr1_lidi, sortie_lidi :  std_logic_vector(15 downto 0);
	signal op_lidi : 									 std_logic_vector(7 downto 0);
	
	-- SIGNAL PIPELINE DIEX
	signal entr1_in_diex, entr0_diex, entr1_diex, sortie_diex :  std_logic_vector(15 downto 0);
	signal op_diex : 									 std_logic_vector(7 downto 0);
	
	-- SIGNAL PIPELINE EXMEN
	signal entr0_exMen, entr1_exMen, sortie_exMen, sortie_in_exMen :  std_logic_vector(15 downto 0);
	signal op_exMen : 									 std_logic_vector(7 downto 0);
	
	-- SIGNAL PIPELINE MENRE
	signal entr0_menRe, entr1_menRe, sortie_menRe, sortie_in_menRe :  std_logic_vector(15 downto 0);
	signal op_menRe : 									 std_logic_vector(7 downto 0);
	signal sortie_mux_menre : std_logic_vector(15 downto 0);
	
	-- SIGNAL BANCOREG
	signal wr_en_br : std_logic;
	signal data_out1_br, data_out2_br : std_logic_vector(15 downto 0);
	
	-- SIGNAL ULA
	signal sortie_ula : std_logic_vector(15 downto 0);
	signal sortie_mux_ula : std_logic_vector(15 downto 0);
   signal flag_ula : std_logic_vector(3 downto 0);
	
	-- SIGNAL RAM
	signal data_we : std_logic;
	signal data_do, data_a, data_di : std_logic_vector(15 downto 0);
	
	--SIGNAL ROM
	signal data_dec : std_logic_vector(31 downto 0);
	
begin

	rom1: ROM port map(		adress => inst_a,
									data => data_dec
	
	);

	dec: Decoder port map(	entr0 	=> dec_entr0, 
									entr1 	=> dec_entr1, 
									sortie 	=> dec_sortie, 
									op 		=> dec_op, 
									inst_di 	=> data_dec
							);
							
	LIDI: PipeLine port map(	CLK				=>    CLK,
										entr0_in       =>    dec_entr0,
										entr1_in       =>    dec_entr1,
										op_in    		=>    dec_op,
										sortie_in      =>    dec_sortie,
										entr0_out      =>    entr0_lidi,
										entr1_out      =>    entr1_lidi,					-- salida B de pipelineLIDI
										op_out    		=>    op_lidi,
										sortie_out     =>    sortie_lidi
								);

	DIEX: PipeLine port map(	CLK				=>    CLK,
										entr0_in       =>    entr0_lidi,
										entr1_in       =>    entr1_in_diex,
										op_in    		=>    op_lidi,
										sortie_in      =>    sortie_lidi,
										entr0_out      =>    entr0_diex,
										entr1_out      =>    entr1_diex,
										op_out    		=>    op_diex,
										sortie_out     =>    sortie_diex
								);
								
	EXMen: PipeLine port map(	CLK				=>    CLK,
										entr0_in       =>    entr0_diex,
										entr1_in       =>    sortie_mux_ula,
										op_in    		=>    op_diex,
										sortie_in      =>    sortie_in_exMen,
										entr0_out      =>    entr0_exMen,
										entr1_out      =>    entr1_exMen,
										op_out    		=>    op_exMen,
										sortie_out     =>    sortie_exMen
								);
								
	MenRE: PipeLine port map(	CLK				=>    CLK,
										entr0_in       =>    entr0_exMen,
										entr1_in       =>    entr1_exMen,
										op_in    		=>    op_exMen,
										sortie_in      =>    sortie_in_menRe,
										entr0_out      =>    entr0_menRe,
										entr1_out      =>    entr1_menRe,
										op_out    		=>    op_menRe,
										sortie_out     =>    sortie_menRe
							);
							
	BancReg: bancoreg port map(	select_lw1	=> 	entr1_lidi (3 downto 0), 			-- @A en la poly
											select_lw2	=> 	sortie_lidi(3 downto 0),			-- @B en la poly
											select_wr	=> 	entr0_menRe(3 downto 0),
											clk			=> 	CLK,		
											rst			=>		RST,
											wr_en			=> 	wr_en_br,
											wr_data		=> 	sortie_mux_menre, 					-- avant implementation mux c'etait entr1_menRe,
											data_out1	=> 	data_out1_br,							-- QA en la poly
											data_out2	=> 	data_out2_br							-- QB en la poly
	);
	
	unitaritlogic: ULA port map( entr0        =>    entr0_diex, 
										  entr1        =>    entr1_diex, 
										  select_op    =>     op_diex,
										  sortie       =>    sortie_ula,
										  flag         =>    flag_ula
	);
	
	ram: bram16 port map(	sys_clk => CLK,
									sys_rst => RST,
									we 	   => data_we,
									do 	   => entr1_exMen,
									a	 	   => data_a(14 downto 0) & '0',
									di 	   => data_di
	
	);
	
	wr_en_br <=		'1'    		when op_menRe = x"06" OR op_menRe = x"05" OR op_menRe = x"07" else
						'0';
						
	entr1_in_diex <= 	data_out1_br when op_lidi = x"05" OR op_lidi = x"08" else								-- entr1_in_diex salida primer mux
							entr1_lidi;
		
	
	sortie_mux_ula <= entr1_diex when op_diex = x"05" OR op_diex = x"06" OR op_diex = x"07" OR op_diex = x"08" else 			-- sortie_mux_ula salida segundo mux
					    	sortie_ula;
							
	sortie_mux_menre <= data_di when op_menRe = x"07" else
								entr1_menRe;
								
	data_a <= entr1_exMen when op_exMen = x"07" else
				 entr0_exMen;
				 
	data_we <= '1' when op_exMen = x"08" else 													--08 ES STORE:  @j,Ri	
				  '0';
				  

	-- 07 ES LOAD:	 Ri, [@j]
	

end Behavioral;

