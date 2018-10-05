library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port (
		OP : in std_logic_vector(1 downto 0);
		A, B : in integer;
		S : out integer;
		N : out std_logic
	);
end entity ALU;

architecture behavior of ALU is
	signal R : integer;
	begin
		process(OP, A, B)
		begin
			case OP is
				when "00" => R <= A + B; 	-- ADD
				when "01" => R <= B; 		-- B
				when "10" => R <= A - B; 	-- SUB
				when "11" => R <= A; 		-- A
				when others => report "unreachable" severity failure;
			end case;
			if R > 0 then
				N <= '1';
			else
				N <= '0';
			end if;
			S <= R;
		end process;
end architecture behavior;
