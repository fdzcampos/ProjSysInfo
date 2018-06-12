--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:42:56 05/04/2018
-- Design Name:   
-- Module Name:   /home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/Test_ULA.vhd
-- Project Name:  Projet_Sys_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ULA
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
USE ieee.numeric_std.ALL;
 
ENTITY Test_ULA IS
END Test_ULA;
 
ARCHITECTURE behavior OF Test_ULA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ULA
    PORT(
         entr0 : IN  std_logic_vector(15 downto 0);
         entr1 : IN  std_logic_vector(15 downto 0);
         select_op : IN  std_logic_vector(7 downto 0);
         sortie : OUT  std_logic_vector(15 downto 0);
         flag : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entr0 : std_logic_vector(15 downto 0) := (others => '0');
   signal entr1 : std_logic_vector(15 downto 0) := (others => '0');
   signal select_op : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal sortie : std_logic_vector(15 downto 0);
   signal flag : std_logic_vector(3 downto 0);
 
	-- ULA has no CLK its asynchronous
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ULA PORT MAP (
          entr0 => entr0,
          entr1 => entr1,
          select_op => select_op,
          sortie => sortie,
          flag => flag
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		-- test operations with unsigned numbers
      entr0 <= x"0001";
		entr1 <= x"0001";
		
		select_op <= x"00" after 200 ns; -- addition
		select_op <= x"01" after 300 ns; -- substraction
		select_op <= x"02" after 400 ns; 
		select_op <= x"03" after 500 ns;
		select_op <= x"04" after 600 ns;
		select_op <= x"05" after 700 ns;
		select_op <= x"06" after 800 ns;
		
		wait for 900ns;
		
		-- test operations with small signed numbers
      entr0 <= x"FFFE" ;
		entr1 <= x"FFFE" ;
		
		select_op <= x"00" after 1000 ns;
		select_op <= x"01" after 1100 ns;
		select_op <= x"02" after 1200 ns;
		select_op <= x"03" after 1300 ns;
		select_op <= x"04" after 1400 ns;
		select_op <= x"05" after 1500 ns;
		select_op <= x"06" after 1600 ns; 
		
		wait for 1700ns;
		
		-- test operations with big signed numbers check FLAGS
      entr0 <= x"0002" ;
		entr1 <= x"7FFE" ;
		
		select_op <= x"00" after 1000 ns;
		select_op <= x"01" after 1100 ns;
		select_op <= x"02" after 1200 ns;
		select_op <= x"03" after 1300 ns;
		select_op <= x"04" after 1400 ns;
		select_op <= x"05" after 1500 ns;
		select_op <= x"06" after 1600 ns; 
				


      wait;
   end process;

END;
