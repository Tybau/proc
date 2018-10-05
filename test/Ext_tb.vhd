library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Ext_tb is
end entity Ext_tb;

architecture behavior of Ext_tb is
	signal E_i : std_logic_vector(15 downto 0);
	signal S_i : std_logic_vector(31 downto 0);
	begin
		MUX_I : entity work.Ext generic map(bw => 16) port map(
			E => E_i, S => S_i
		);
		process
		begin
			E_i <= x"F345";
			wait for 10 ns;

			E_i <= x"0345";
			wait for 10 ns;
		end process;
end architecture behavior;
