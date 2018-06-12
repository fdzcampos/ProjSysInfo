--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:19:48 06/01/2018
-- Design Name:   
-- Module Name:   /home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/Test_Processor.vhd
-- Project Name:  Projet_Sys_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processor
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Processor IS
END Test_Processor;
 
ARCHITECTURE behavior OF Test_Processor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         inst_a : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic;
   signal RST : std_logic;
   signal inst_a : std_logic_vector(7 downto 0) := (others => '0');

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor PORT MAP (
          CLK => CLK,
          RST => RST,
          inst_a => inst_a
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		rst <= '1';

     	inst_a <= x"00";			-- afc
		
		wait for 200 ns;
		
		inst_a <= x"01";			-- copy
		
		wait for 300 ns;
		
		-- ATTENTION DANS LE SUJET LES OP POUR LES OPERATIONS SONT DIFFERENTS QUE POUR NOUS;
		-- ÇA POSSE PAS UN PROBLEME AU NIVEAU DES CALCULS MAIS IL FAUT LE SAVOIR POUR LES OPS DU PROCESSEUR

		inst_a <= x"02";			-- afc reg1 = 000A
		inst_a <= x"03";			-- afc reg2 = 0002
		inst_a <= x"04";			-- add reg2 = reg2 + reg1
		inst_a <= x"05";			-- afc reg1 = 000A
		
		wait for 400 ns;
		
		inst_a <= x"06";
		
		wait for 500 ns;
		
		inst_a <= x"07";		

		
      wait;
   end process;

END;
