library ieee;
use ieee.std_logic_1164.all;

entity tb_banc_registres is
end entity;

architecture test of tb_banc_registres is
	signal s_clk: std_logic := '0';
	signal s_rst: std_logic := '0';
	signal s_w: std_logic_vector(31 downto 0) := (others => '0');
	signal s_ra, s_rb: std_logic_vector(3 downto 0) := (others => '0');
	signal s_rw: std_logic_vector(3 downto 0) := (others => '0');
	signal s_we: std_logic := '0';
	signal s_a, s_b: std_logic_vector(31 downto 0) := (others => '0');
begin
	banc_registres: entity work.banc_registres port map(
		rst => s_rst,
		clk => s_clk,
		w => s_w,
		we => s_we,
		ra => s_ra,
		rb => s_rb,
		rw => s_rw,
		a => s_a,
		b => s_b
	);

	p_clk: process
	begin
		s_clk <= '0';
		wait for 1 ns;
		
		s_clk <= '1';
		wait for 1 ns;
	end process;

	p_test: process
	begin
		-- Preparation de l'ecriture dans le registre x"a"
		s_we <= '0';
		s_w <= x"cccccccc";
		s_rw <= x"a";
		s_ra <= x"a";
		s_rb <= x"2";
		wait for 2 ns;
		assert s_a = x"00000000" report "Error 1" severity error;
		assert s_b = x"00000000" report "Error 2" severity error;

		-- Ecriture dans le registre x"a"
		s_we <= '1';
		wait for 2 ns;
		assert s_a = x"cccccccc" report "Error 3" severity error;
		assert s_b = x"00000000" report "Error 4" severity error;

		-- Ecriture dans le registre x"2"
		s_rw <= x"2";
		s_w <= x"33333333";
		wait for 2 ns;
		assert s_a = x"cccccccc" report "Error 5" severity error;
		assert s_b = x"33333333" report "Error 6" severity error;

		-- Fin de l'ecriture
		s_we <= '0';
		assert s_a = x"cccccccc" report "Error 7" severity error;
		assert s_b = x"33333333" report "Error 8" severity error;
		wait for 2 ns;

		report "Finished";
		wait;
	end process;
end architecture;

