library ieee;
use ieee.std_logic_1164.all;

entity reg32_tb is
end entity;

architecture tb of reg32_tb is
	signal s_data_in: std_logic_vector(31 downto 0);
	signal s_rst, s_clk: std_logic;
	signal s_we: std_logic;
	signal s_data_out: std_logic_vector(31 downto 0);
begin
	e_reg32: entity work.reg32 port map(
		data_in => s_data_in,
		rst => s_rst,
		clk => s_clk,
		we => s_we,
		data_out => s_data_out
	);

	bench: process
	begin
		-- Reset
		s_rst <= '1';
		s_we <= '0';
		s_data_in <= (others => '0');
		wait for 2 ns;

		-- Set value
		s_rst <= '0';
		s_data_in <= x"1234abcd";
		s_we <= '1';
		wait for 2 ns;

		-- Read value
		s_we <= '0';
		wait for 2 ns;
		assert s_data_out = x"1234abcd" report "Error" severity error;
		
		report "Finished";
		wait;
	end process;

	p_clk: process
	begin
		s_clk <= '0';
		wait for 1 ns;

		s_clk <= '1';
		wait for 1 ns;
	end process;
	
end architecture;
