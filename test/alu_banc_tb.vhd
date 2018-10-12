library ieee;
use ieee.std_logic_1164.all;

entity alu_banc_tb is
end entity;

architecture test of alu_banc_tb is
	signal s_N, s_Z, s_C, s_V: std_logic := '0';
	signal s_clk, s_rst: std_logic := '0';
	signal ra, rb, rw: std_logic_vector(3 downto 0) := "0000";
	signal we: std_logic := '0';
	signal s_op: std_logic_vector(1 downto 0) := "00";
begin
	alu_banc: entity work.alu_banc port map(
		clk => s_clk,
		rst => s_rst,
		op => s_op,
		N => s_N,
		Z => s_Z,
		C => s_C,
		V => s_V,
		ra => ra,
		rb => rb,
		rw => rw,
		we => we
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
		-- R1 = R15
		ra <= x"f";
		s_op <= "11";
		rw <= x"1";
		we <= '1';
		wait for 2 ns;

		-- R1 = R1 + R15
		ra <= x"1";
		rb <= x"f";
		s_op <= "00";
		rw <= x"1";
		we <= '1';
		wait for 2 ns;
--		we <= '1';
--		wait for 1 ns;

		-- R2 = R1 + R15
		ra <= x"1";
		rb <= x"f";
		s_op <= "00";
		rw <= x"2";
		we <= '1';
		wait for 2 ns;
		
		-- R3 = R1 - R15
		ra <= x"1";
		rb <= x"f";
		s_op <= "10";
		rw <= x"3";
		we <= '1';
		wait for 2 ns;

		-- R5 = R7 - R15
		ra <= x"7";
		rb <= x"f";
		s_op <= "10";
		rw <= x"5";
		we <= '1';
		wait for 2 ns;

		report "Finished";
		wait;
	end process;
end architecture;
