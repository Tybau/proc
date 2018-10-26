
library ieee;
use ieee.std_logic_1164.all;

entity Tunit_tb is
end entity;

architecture test of Tunit_tb is
	signal s_N, s_Z, s_C, s_V: std_logic := '0';
	signal s_clk, s_rst: std_logic := '0';
	signal ra, rb, rw: std_logic_vector(3 downto 0) := "0000";
	signal we: std_logic := '0';
	signal s_op: std_logic_vector(1 downto 0) := "00";
	signal s_wr_en: std_logic;
	signal s_imm: std_logic_vector(7 downto 0);
	signal s_imm_sel, s_mem_sel : std_logic;
	signal s_reg_sel: std_logic;
begin
	tunit: entity work.Tunit port map(
		clk => s_clk,
		rst => s_rst,
		ra => ra,
		rb => rb,
		rw => rw,
		reg_sel => s_reg_sel,
		we => we,
		op => s_op,
		wr_en => s_wr_en,
		imm => s_imm,
		imm_sel => s_imm_sel,
		mem_sel => s_mem_sel,
		N => s_N,
		Z => s_Z,
		C => s_C,
		V => s_V
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
		s_imm_sel <= '0';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		ra <= x"f";
		s_op <= "11";
		rw <= x"1";
		we <= '1';
		wait for 2 ns;

		-- R1 = R1 + R15
		s_imm_sel <= '0';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		ra <= x"1";
		rb <= x"f";
		s_op <= "00";
		rw <= x"1";
		we <= '1';
		wait for 2 ns;
--		we <= '1';
--		wait for 1 ns;

		-- R2 = R1 + R15
		s_imm_sel <= '0';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		ra <= x"1";
		rb <= x"f";
		s_op <= "00";
		rw <= x"2";
		we <= '1';
		wait for 2 ns;

		-- R3 = R1 - R15
		s_imm_sel <= '0';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		ra <= x"1";
		rb <= x"f";
		s_op <= "10";
		rw <= x"3";
		we <= '1';
		wait for 2 ns;

		-- R5 = R7 - R15
		s_imm_sel <= '0';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		ra <= x"7";
		rb <= x"f";
		s_op <= "10";
		rw <= x"5";
		we <= '1';
		wait for 2 ns;

		-- R6 = R15 + 42
		s_imm_sel <= '1';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		s_imm <= "00101010"; --42
		ra <= x"f";
		rb <= x"0";
		s_op <= "00";
		rw <= x"6";
		we <= '1';
		wait for 2 ns;

		-- R9 = R15 - 42
		s_imm_sel <= '1';
		s_mem_sel <= '0';
		s_wr_en <= '0';
		s_imm <= "00101010"; --42
		ra <= x"f";
		rb <= x"0";
		s_op <= "10";
		rw <= x"9";
		we <= '1';
		wait for 2 ns;

		-- M6 = R9
		s_imm_sel <= '0';
		s_mem_sel <= '0';
		s_wr_en <= '1';
		s_imm <= x"00";
		ra <= x"9";
		rb <= x"6";
		s_op <= "11";
		rw <= x"9";
		we <= '0';
		wait for 2 ns;

		-- R10 = M6
		s_imm_sel <= '0';
		s_mem_sel <= '1';
		s_wr_en <= '0';
		s_imm <= x"00";
		ra <= x"9";
		rb <= x"6";
		s_op <= "11";
		rw <= x"A";
		we <= '1';
		wait for 2 ns;

		report "Finished";
		wait;
	end process;
end architecture;
