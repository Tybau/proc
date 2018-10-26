library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CPU is 
	port(
		clk: in std_logic;
		rst: in std_logic
	);
end entity;

architecture RTL of CPU is
	signal s_ra, s_rb, s_rw: std_logic_vector(3 downto 0);
	signal s_reg_sel: std_logic;
	signal s_we: std_logic;
	signal s_op: std_logic_vector(1 downto 0);
	signal s_wr_en: std_logic;
	signal s_mem_sel: std_logic;
	signal s_imm: std_logic_vector(7 downto 0);
	signal s_imm_sel: std_logic;
	signal s_N, s_C, s_Z, s_V: std_logic;
	signal s_offset: std_logic_vector(23 downto 0);
	signal s_nPCsel: std_logic;
	signal s_instruction: std_logic_vector(31 downto 0);
    signal s_psr_in: std_logic_vector(31 downto 0);
begin
	e_Tunit: entity work.Tunit port map(
		clk => clk,
		rst => rst,
		ra => s_ra,
		rb => s_rb,
		rw => s_rw,
		reg_sel => s_reg_sel,
		we => s_we,
		op => s_op,
		wr_en => s_wr_en,
		mem_sel => s_mem_sel,
		imm => s_imm,
		imm_sel => s_imm_sel,
		N => s_N,
		Z => s_Z,
		C => s_C,
		V => s_V
	);

	e_Iunit: entity work.Iunit port map(
		clk => clk,
		offset => s_offset,
		nPCsel => s_nPCsel,
		instruction => s_instruction
	);

    s_psr_in <= (31 downto 4 => '0') & (s_N & s_C & s_Z & s_V);
	e_Cunit: entity work.Cunit port map(
		instruction => s_instruction,
		psr_in => s_psr_in,
        clk => clk,
        rst => rst,

		-- Params
		n_pc_sel => s_nPCsel,
		reg_wr => s_we,
        alu_src => s_imm_sel,
		alu_ctr => s_op,
		mem_wr => s_wr_en,
		wr_src => s_mem_sel,
        reg_sel_mux_rb_rw => s_reg_sel,

		-- Registers
		rw => s_rw,
		ra => s_ra,
		rb => s_rb,
		offset => s_offset,
		immediate => s_imm
	);
end architecture;
	
