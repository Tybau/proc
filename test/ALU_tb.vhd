library ieee;
use ieee.std_logic_1164.all;

entity ALU_tb is
end entity ALU_tb;

architecture behavior of ALU_tb is
	signal OP_i : std_logic_vector(1 downto 0);
	signal A_i, B_i : integer;
	signal S_i : integer;
	signal N_i : std_logic;
	begin
		ALU_I : entity work.ALU port map(
			OP => OP_i, A => A_i, B => B_i, S => S_i, N => N_i
		);
		process
		begin
			report "Test 1 :";
			OP_i <= "00";
			A_i <= 2;
			B_i <= 1;
			wait for 10 ns;
			assert S_i = 3 report "Erreur 1" severity error;

			wait;
		end process;
end architecture behavior;
