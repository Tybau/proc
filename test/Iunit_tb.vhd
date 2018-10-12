library ieee;
use ieee.std_logic_1164.all;

entity Iunit_tb is
end entity;

architecture rtl of Iunit_tb is
	signal s_clk: std_logic;
	signal s_offset: std_logic_vector(23 downto 0);
	signal s_nPCsel: std_logic;
	signal s_instruction: std_logic_vector(31 downto 0)

begin
	e_Iunit: entity work.Iunit port map(
		clk => s_clk,
		offset => s_offset,
		nPCsel => s_nPCsel,
		instruction => s_instruction
	);

	bench: process
	begin
		-- Next instruction
		-- start from mem0
		s_nPCsel <= '0';
		s_offset <= (others => '0');
		wait for 2 ns;
		assert s_instruction = x"0" report "Error 1" severity error;

		-- Offset to get mem15
		s_nPCsel <= '1';
		s_offset <= x"d";
		wait for 2 ns;
		assert s_instruction = x"30" report "Error 2" severity error;

		-- Offset to go back t mem1
		s_nPCsel <= '1';
		s_offset <= x"fffffff3";
		wait for 2 ns;
		assert s_instruction = x"0" report "Error 2" severity error;
		
	end process;

	p_clk: process
	begin
		s_clk <= '0';
		wait for 1 ns;

		s_clk <= '1';
		wait for 1 ns;
	end process;
end architecture;
