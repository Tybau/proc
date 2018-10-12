library ieee;
use ieee.std_logic_1164.all;

entity alu_banc is
	port(
		clk, rst: in std_logic;
		ra, rb, rw: in std_logic_vector(3 downto 0);
		we: in std_logic;
		op: in std_logic_vector(1 downto 0);
		N, Z, C, V: out std_logic
	);
end entity;

architecture behavior of alu_banc is
	signal s_w: std_logic_vector(31 downto 0);
	signal s_rw: std_logic_vector(3 downto 0);
	signal s_we: std_logic := '0';
	signal s_a, s_b: std_logic_vector(31 downto 0);
begin
	Z <= '0';
	C <= '0';
	V <= '0';
	alu_i : entity work.ALU port map(
		OP => op,
		A => s_a,
		B => s_b,
		S => s_w,
		N => N
	);

	banc_registres: entity work.banc_registres port map(
		rst => rst,
		clk => clk,
		w => s_w,
		we => we,
		ra => ra,
		rb => rb,
		rw => rw,
		a => s_a,
		b => s_b
	);
end architecture;
