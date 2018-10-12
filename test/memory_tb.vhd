library ieee;
use ieee.std_logic_1164.all;

entity memory_tb is
end entity;

architecture test of memory_tb is
	signal s_clk: std_logic := '0';
	signal s_data_in: std_logic_vector(31 downto 0) := (others => '0');
	signal s_addr: std_logic_vector(5 downto 0) := (others => '0');
	signal s_wr_en: std_logic := '0';
	signal s_data_out: std_logic_vector(31 downto 0) := (others => '0');
begin
	memory: entity work.memory port map(
		clk => s_clk,
		data_in => s_data_in,
		wr_en => s_wr_en,
		addr => s_addr,
		data_out => s_data_out
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
		s_wr_en <= '0';
		s_addr <= "010001";
		wait for 2 ns;
		assert s_data_out = x"00000030" report "Error 1" severity error;

		-- Ecriture dans le registre x"9"
		s_wr_en <= '1';
		s_addr <= "001001";
		s_data_in <= x"aaaaaaaa";
		wait for 2 ns;

		-- Lecture du registre x"9"
		s_wr_en <= '0';
		s_addr <= "001001";
		wait for 2 ns;
		assert s_data_out = x"aaaaaaaa" report "Error 2" severity error;

		report "Finished";
		wait;
	end process;
end architecture;

