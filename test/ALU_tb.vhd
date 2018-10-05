library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end entity ALU_tb;

architecture behavior of ALU_tb is
	signal OP_i : std_logic_vector(1 downto 0) := "00";
	signal A_i, B_i : std_logic_vector(31 downto 0);
	signal S_i : std_logic_vector(31 downto 0);
	signal N_i : std_logic;
	begin
		ALU_I : entity work.ALU port map(
			OP => OP_i, A => A_i, B => B_i, S => S_i, N => N_i
		);
		process
		begin
			OP_i <= "00";
			A_i <= x"00000001";
			B_i <= x"00000002";
			wait for 10 ns;

			OP_i <= "01";
			A_i <= x"00000005";
			B_i <= x"00000003";
			wait for 10 ns;

			OP_i <= "10";
			A_i <= x"00000005";
			B_i <= x"00000003";
			wait for 10 ns;

			OP_i <= "10";
			A_i <= x"00000003";
			B_i <= x"00000005";
			wait for 10 ns;

			OP_i <= "11";
			A_i <= x"00000003";
			B_i <= x"00000005";
			wait for 10 ns;

			wait;
		end process;
end architecture behavior;
