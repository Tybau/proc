library ieee;
use ieee.std_logic_1164.all;

entity Tunit is
	port(
		clk, rst: in std_logic;
		ra, rb, rw: in std_logic_vector(3 downto 0);
		we: in std_logic;
		op: in std_logic_vector(1 downto 0);
		wr_en: in std_logic;
		imm: in std_logic_vector(7 downto 0);
		imm_sel, mem_sel : in std_logic;
		N, Z, C, V: out std_logic
	);
end entity;

architecture behavior of Tunit is
	signal s_w: std_logic_vector(31 downto 0);
	signal s_rw: std_logic_vector(3 downto 0);
	signal s_we: std_logic := '0';
	signal s_a, s_b, s_b_alu: std_logic_vector(31 downto 0);
	signal s_ext_imm : std_logic_vector(31 downto 0);
	signal s_data_out : std_logic_vector(31 downto 0);
	signal s_alu : std_logic_vector(31 downto 0);
begin
	Z <= '0';
	C <= '0';
	V <= '0';
	alu_i : entity work.ALU port map(
		OP => op,
		A => s_a,
		B => s_b_alu,
		S => s_alu,
		N => N
	);

	ext : entity work.Ext generic map(bw => 8) port map(
		E => imm,
		S => s_ext_imm
	);

	mux1 : entity work.Mux2 port map(
		COM => imm_sel,
		A => s_b,
		B => s_ext_imm,
		S => s_b_alu
	);

	memory : entity work.memory port map(
		clk => clk,
		data_in => s_b,
		addr => s_alu (5 downto 0),
		wr_en => wr_en,
		data_out => s_data_out
	);

	mux2 : entity work.Mux2 port map(
		COM => mem_sel,
		A => s_alu,
		B => s_data_out,
		S => s_w
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
