library ieee;
use ieee.std_logic_1164.all;

entity Mux2 is
	generic (
		N: integer := 32
	);
	port (
		COM : in std_logic;
		A, B : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)
	);
end entity Mux2;

architecture behavior of Mux2 is
	begin
		process(COM, A, B)
		begin
			case COM is
				when '0' => S <= A;
				when '1' => S <= B;
				when others => S <= (others => '0');
			end case;
		end process;
end architecture behavior;
