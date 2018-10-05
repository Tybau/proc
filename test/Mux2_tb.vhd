library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux_tb is
end entity Mux_tb;

architecture behavior of Mux_tb is
	signal COM_i : std_logic;
	signal A_i, B_i : std_logic_vector(31 downto 0);
	signal S_i : std_logic_vector(31 downto 0);
	begin
		MUX_I : entity work.Mux2 port map(
			COM => COM_i, A => A_i, B => B_i, S => S_i
		);
		process
		begin
			COM_i <= '0';
			A_i <= x"00000001";
			B_i <= x"00000002";
			wait for 10 ns;

			COM_i <= '1';
			A_i <= x"00000001";
			B_i <= x"00000002";
			wait for 10 ns;
		end process;
end architecture behavior;
