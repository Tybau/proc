library ieee;
use ieee.std_logic_1164.all;

entity instruction_decoder is
	port(
		instruction: in std_logic_vector(31 downto 0);
		n_pc_sel: out std_logic;
		reg_wr: out std_logic;
		alu_src: out std_logic;
		alu_ctr: out std_logic_vector(1 downto 0);
		psr_en: out std_logic;
		mem_wr: out std_logic;
		wr_src: out std_logic
	);
end entity;

architecture behavior of instruction_decoder is
	type enum_instruction is (MOV, ADDi, ADDr, CMP, LDR, STR, BAL, BLT);
	signal instr_courante: enum_instruction;
begin
	process(instruction)
	begin
		if(instruction(27 downto 26) = "00") then
			-- Traitement de donnees
		elsif(instruction(27 downto 26) = "01") then
			-- Memoire
		elsif(instruction(27 downto 26) = "10") then
			-- Branch
		else
		end if;
	end process;
end architecture;
