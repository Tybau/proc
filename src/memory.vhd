library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port(
		clk: in std_logic;
		data_in: in std_logic_vector(31 downto 0);
		addr: in std_logic_vector(5 downto 0);
		wr_en: in std_logic;
		data_out: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of memory is
	type table is array(63 downto 0) of std_logic_vector(31 downto 0);
	function init_banc return table is
		variable result: table;
	begin
		for i in 63 downto 0 loop
			result(i) := (others => '0');
		end loop;
		result(15) := x"00000030";
		return result;
	end init_banc;

	signal banc: table := init_banc;
begin
	-- Lecture
	data_out <= banc(to_integer(unsigned(addr)));

	-- Ecriture
	writing: process(clk)
	begin
		if(rising_edge(clk)) then
			if(wr_en = '1') then
				banc(to_integer(unsigned(addr))) <= data_in;
			end if;
		end if;
	end process;
end architecture;
