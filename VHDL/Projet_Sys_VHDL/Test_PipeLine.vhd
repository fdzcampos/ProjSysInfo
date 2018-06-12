--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:53:37 05/18/2018
-- Design Name:   
-- Module Name:   /home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/Test_PipeLine.vhd
-- Project Name:  Projet_Sys_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PipeLine
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_PipeLine IS
END Test_PipeLine;
 
ARCHITECTURE behavior OF Test_PipeLine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PipeLine
    PORT(
         CLK : IN  std_logic;
         entr0_in : IN  std_logic_vector(15 downto 0);
         entr1_in : IN  std_logic_vector(15 downto 0);
         op_in : IN  std_logic_vector(7 downto 0);
         sortie_in : IN  std_logic_vector(15 downto 0);
         entr0_out : OUT  std_logic_vector(15 downto 0);
         entr1_out : OUT  std_logic_vector(15 downto 0);
         op_out : OUT  std_logic_vector(7 downto 0);
         sortie_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal entr0_in : std_logic_vector(15 downto 0) := (others => '0');
   signal entr1_in : std_logic_vector(15 downto 0) := (others => '0');
   signal op_in : std_logic_vector(7 downto 0) := (others => '0');
   signal sortie_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal entr0_out : std_logic_vector(15 downto 0);
   signal entr1_out : std_logic_vector(15 downto 0);
   signal op_out : std_logic_vector(7 downto 0);
   signal sortie_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PipeLine PORT MAP (
          CLK => CLK,
          entr0_in => entr0_in,
          entr1_in => entr1_in,
          op_in => op_in,
          sortie_in => sortie_in,
          entr0_out => entr0_out,
          entr1_out => entr1_out,
          op_out => op_out,
          sortie_out => sortie_out
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

		-- test operations with unsigned numbers
      entr0_in <= x"0001";
		entr1_in <= x"0001";
		op_in <= x"01";
		sortie_in <= x"0001";
		
		wait for 1200 ns;	
		-- test operations with unsigned numbers
      entr0_in <= x"0002";
		entr1_in <= x"0004";
		op_in <= x"05";
		sortie_in <= x"0006";

      -- insert stimulus here 

      wait;
   end process;

END;
