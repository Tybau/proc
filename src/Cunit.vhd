library ieee;
use ieee.std_logic_1164.all;

entity Cunit is
	port(
        clk, rst: in std_logic;
		instruction: in std_logic_vector(31 downto 0);
		psr_in: in std_logic_vector(31 downto 0);

		-- Params
		n_pc_sel: out std_logic;
		reg_wr: out std_logic;
		alu_ctr: out std_logic_vector(1 downto 0);
		mem_wr: out std_logic;
		wr_src: out std_logic;
		alu_src: out std_logic;

		-- Registers
		rw, ra, rb: out std_logic_vector(3 downto 0);
		offset: out std_logic_vector(23 downto 0);
		immediate: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of Cunit is
	signal s_psr_en: std_logic;
    signal s_psr_out: std_logic_vector(31 downto 0);
begin
	e_instruction_decoder: entity work.instruction_decoder port map(
		instruction => instruction,
        psr_out => s_psr_out,

		-- Params
		n_pc_sel => n_pc_sel,
		reg_wr => reg_wr,
		alu_src => alu_src,
		alu_ctr => alu_ctr,
		psr_en => s_psr_en,
		mem_wr => mem_wr,
		wr_src => wr_src,

		-- Registers
		rw => rw,
		ra => ra,
		rb => rb,
		offset => offset,
		immediate => immediate
	);
	
	e_psr: entity work.reg32 port map(
		data_in => psr_in,
		rst => rst,
		clk => clk,
		we => s_psr_en,
		data_out => s_psr_out
	);
end architecture;
