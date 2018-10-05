library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banc_registres is
	port(
		clk: in std_logic;
		w: in std_logic_vector(31 downto 0);
		we: in std_logic;
		rw: in std_logic_vector(3 downto 0);
		ra, rb: in std_logic_vector(3 downto 0);
		a, b: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of banc_registres is
	type table is array(15 downto 0) of std_logic_vector(31 downto 0);
	function init_banc return table is
		variable result: table;
	begin
		for i in 14 downto 0 loop
			result(i) := (others => '0');
		end loop;
		result(15) := x"00000030";
		return result;
	end init_banc;

	signal banc: table := init_banc;
begin
	-- Lecture
	a <= banc(to_integer(unsigned(ra)));
	b <= banc(to_integer(unsigned(rb)));

	-- Ecriture
	writing: process(clk)
	begin
		if(rising_edge(clk)) then
			if(we = '1') then
				banc(to_integer(unsigned(rw))) <= w;
			end if;
		end if;
	end process;
end architecture;
