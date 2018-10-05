library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port (
		OP : in std_logic_vector(1 downto 0);
		A, B : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0);
		N : out std_logic
	);
end entity ALU;

architecture behavior of ALU is
	signal R : std_logic_vector(31 downto 0);
	begin
		process(OP, A, B)
		begin
			case OP is
				when "00" => R <= std_logic_vector(signed(A) + signed(B)); 	-- ADD
				when "01" => R <= B; 		-- B
				when "10" => R <= std_logic_vector(signed(A) - signed(B)); 	-- SUB
				when "11" => R <= A; 		-- A
				when others => report "unreachable" severity failure;
			end case;
			N <= R(31);
			S <= R;
		end process;
end architecture behavior;
