--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:11:26 05/28/2018
-- Design Name:   
-- Module Name:   /home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/Test_Decoder.vhd
-- Project Name:  Projet_Sys_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
--use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
 
ENTITY Test_Decoder IS
END Test_Decoder;
 
ARCHITECTURE behavior OF Test_Decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         entr0 : OUT  std_logic_vector(15 downto 0);
         entr1 : OUT  std_logic_vector(15 downto 0);
         sortie : OUT  std_logic_vector(15 downto 0);
         op : OUT  std_logic_vector(7 downto 0);
         inst_di : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inst_di : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal entr0 : std_logic_vector(15 downto 0);
   signal entr1 : std_logic_vector(15 downto 0);
   signal sortie : std_logic_vector(15 downto 0);
   signal op : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          entr0 => entr0,
          entr1 => entr1,
          sortie => sortie,
          op => op,
          inst_di => inst_di
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      inst_di <= x"020F0506";
		
		wait for 200 ns;
		
		inst_di <= x"07080307";
		
		wait for 300 ns;
		
		inst_di <= x"08000901";
		

      -- insert stimulus here 

      wait;
   end process;

END;
