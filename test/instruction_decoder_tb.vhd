library ieee;
use ieee.std_logic_1164.all;

entity instruction_decoder_tb is
end entity;

architecture rtl of instruction_decoder_tb is
	signal s_instruction: std_logic_vector(31 downto 0);
	signal s_n_pc_sel: std_logic;
	signal s_reg_wr: std_logic;
	signal s_alu_src: std_logic;
	signal s_alu_ctr: std_logic_vector(1 downto 0);
	signal s_psr_en: std_logic;
	signal s_mem_wr: std_logic;
	signal s_wr_src: std_logic;
	signal s_ra, s_rb, s_rw : std_logic_vector(3 downto 0);
	signal s_offset: std_logic_vector(23 downto 0);
	signal s_imm: std_logic_vector(7 downto 0);
begin
	instruction_decoder: entity work.instruction_decoder port map(
		instruction => s_instruction,
		n_pc_sel => s_n_pc_sel,
		reg_wr => s_reg_wr,
		alu_src => s_alu_src,
		alu_ctr => s_alu_ctr,
		psr_en => s_psr_en,
		mem_wr => s_mem_wr,
		wr_src => s_wr_src,
		rw => s_rw,
		ra => s_ra,
		rb => s_rb,
		offset => s_offset,
		immediate => s_imm
	);

	bench: process
	begin
		s_instruction <= x"E3A01020"; -- MOV R1,#0x20
		wait for 2 ns;

		s_instruction <= x"E3A02000"; -- MOV R2,#0x00
		wait for 2 ns;

		s_instruction <= x"E6110000"; -- LDR R0,0(R1)
		wait for 2 ns;

		s_instruction <= x"E0822000"; -- ADD R2,R2,R0
		wait for 2 ns;

		s_instruction <= x"E2811001"; -- ADD R1,R1,#1
		wait for 2 ns;

		s_instruction <= x"E351002A"; -- CMP R1,0x2A
		wait for 2 ns;

		s_instruction <= x"BAFFFFFB"; -- BLT loop
		wait for 2 ns;

		s_instruction <= x"E6012000"; -- STR R2,0(R1)
		wait for 2 ns;

		s_instruction <= x"EAFFFFF7"; -- BAL main
		wait for 2 ns;

		wait;
	end process;
end architecture;
