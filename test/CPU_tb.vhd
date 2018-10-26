library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CPU_tb is 
end entity;

architecture RTL of CPU_tb is
	signal s_clk, s_rst: std_logic := '0';
begin
	process
	begin
		s_clk <= '1';
		wait for 1 ns;
		s_clk <= '0';
		wait for 1 ns;
	end process;

	e_CPU: entity work.CPU port map (
		clk => s_clk,
		rst => s_rst
	);
end architecture;	
