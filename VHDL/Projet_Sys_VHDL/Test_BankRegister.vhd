--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:12:38 05/18/2018
-- Design Name:   
-- Module Name:   /home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/Test_BankRegister.vhd
-- Project Name:  Projet_Sys_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bancoreg
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
 
ENTITY Test_BankRegister IS
END Test_BankRegister;
 
ARCHITECTURE behavior OF Test_BankRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bancoreg
    PORT(
         select_lw1 : IN  std_logic_vector(3 downto 0);
         select_lw2 : IN  std_logic_vector(3 downto 0);
         select_wr : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         wr_en : IN  std_logic;
         wr_data : IN  std_logic_vector(15 downto 0);
         data_out1 : OUT  std_logic_vector(15 downto 0);
         data_out2 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal select_lw1 : std_logic_vector(3 downto 0) := (others => '0');
   signal select_lw2 : std_logic_vector(3 downto 0) := (others => '0');
   signal select_wr : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal wr_data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal data_out1 : std_logic_vector(15 downto 0);
   signal data_out2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bancoreg PORT MAP (
          select_lw1 => select_lw1,
          select_lw2 => select_lw2,
          select_wr => select_wr,
          clk => clk,
          rst => rst,
          wr_en => wr_en,
          wr_data => wr_data,
          data_out1 => data_out1,
          data_out2 => data_out2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		rst <= '1';
		
		select_lw1 <= x"0";
		select_lw2 <= x"1";
		
		wait for 100 ns;	
		wr_en <= '1';
		select_wr <= x"1";
		wr_data <= x"CAFE";
		
		wait for 100 ns;	
		wr_en <= '1';
		select_wr <= x"0";
		wr_data <= x"BEBE";

		
		
		
		
		
      
		

      -- insert stimulus here 

      wait;
   end process;

END;
