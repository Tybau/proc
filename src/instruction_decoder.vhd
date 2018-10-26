library ieee;
use ieee.std_logic_1164.all;

entity instruction_decoder is
	port(
		instruction: in std_logic_vector(31 downto 0);
        psr_out: in std_logic_vector(31 downto 0);

		-- Params
		n_pc_sel: out std_logic;
		reg_wr: out std_logic;
		alu_ctr: out std_logic_vector(1 downto 0);
		psr_en: out std_logic;
		mem_wr: out std_logic;
		wr_src: out std_logic;
		alu_src: out std_logic;

		-- Registers
		rw, ra, rb: out std_logic_vector(3 downto 0);
		offset: out std_logic_vector(23 downto 0);
		immediate: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of instruction_decoder is
	type enum_instruction is (NOP, MOV, ADDi, ADDr, CMP, LDR, STR, BAL, BLT);
	signal instr_courante: enum_instruction;
begin
	process(instruction)
	begin
		if(instruction(27 downto 26) = "00") then
			-- Traitement de donnees
			case instruction(24 downto 21) is
				when "0100" =>
					-- ADD
					case instruction(25) is
						when '1' => instr_courante <= ADDi;
						when '0' => instr_courante <= ADDr;
						when others => instr_courante <= NOP;
					end case;
				when "1101" =>
					-- MOV
					instr_courante <= MOV;
				when "1010" =>
					-- CMP
					instr_courante <= CMP;
				when others =>
					instr_courante <= NOP;
			end case;

		elsif(instruction(27 downto 26) = "01") then
			-- Memoire
			case instruction(20) is
				when '1' => instr_courante <= LDR;
				when '0' => instr_courante <= STR;
				when others => instr_courante <= NOP;
			end case;
		elsif(instruction(27 downto 26) = "10") then
			-- Branch
			case instruction(31 downto 28) is
				when "1110" => instr_courante <= BAL;
				when "1011" => instr_courante <= BLT;
				when others => instr_courante <= NOP;
			end case;
		end if;
	end process;

	process(instr_courante, instruction)
	begin
		rw <= (others => '0');
		ra <= (others => '0');
		rb <= (others => '0');
		offset <= (others => '0');
		immediate <= (others => '0');

		case instr_courante is
			when ADDi =>
				n_pc_sel <= '0';
				reg_wr <= '1';
				alu_src <= '1';
				alu_ctr <= "00";
				psr_en <= '1';
				mem_wr <= '0';
				wr_src <= '0';

				rw <= instruction(15 downto 12);
				ra <= instruction(19 downto 16);
				immediate <= instruction(7 downto 0);
			when ADDr =>
				n_pc_sel <= '0';
				reg_wr <= '1';
				alu_src <= '0';
				alu_ctr <= "00";
				psr_en <= '1';
				mem_wr <= '0';
				wr_src <= '0';

				rw <= instruction(15 downto 12);
				ra <= instruction(19 downto 16);
				rb <= instruction(3 downto 0);
			when BAL =>
				n_pc_sel <= '1';
				reg_wr <= '0';
				alu_src <= '0';
				alu_ctr <= "11";
				psr_en <= '0';
				mem_wr <= '0';
				wr_src <= '0';

				offset <= instruction(23 downto 0);
			when BLT =>
				n_pc_sel <= psr_out(3);
				reg_wr <= '0';
				alu_src <= '0';
				alu_ctr <= "11";
				psr_en <= '0';
				mem_wr <= '0';
				wr_src <= '0';

				offset <= instruction(23 downto 0);
			when CMP =>
				n_pc_sel <= '0';
				reg_wr <= '0';
				alu_src <= '1';
				alu_ctr <= "10";
				psr_en <= '1';
				mem_wr <= '0';
				wr_src <= '0';

				immediate <= instruction(7 downto 0);
				ra <= instruction(19 downto 16);
			when LDR =>
				n_pc_sel <= '0';
				reg_wr <= '1';
				alu_src <= '1';
				alu_ctr <= "00";
				psr_en <= '0';
				mem_wr <= '0';
				wr_src <= '1';

				immediate <= instruction(7 downto 0);
				rw <= instruction(15 downto 12);
				ra <= instruction(19 downto 16);
			when MOV =>
				n_pc_sel <= '0';
				reg_wr <= '1';
				alu_src <= '1';
				alu_ctr <= "01";
				psr_en <= '0';
				mem_wr <= '0';
				wr_src <= '0';

				immediate <= instruction(7 downto 0);
				rw <= instruction(15 downto 12);
			when STR =>
				n_pc_sel <= '0';
				reg_wr <= '0';
				alu_src <= '1';
				alu_ctr <= "00";
				psr_en <= '0';
				mem_wr <= '1';
				wr_src <= '0';

				immediate <= instruction(7 downto 0);
				rb <= instruction(15 downto 12);	-- Data IN
				ra <= instruction(19 downto 16);
			when others =>
		end case;
	end process;
end architecture;
