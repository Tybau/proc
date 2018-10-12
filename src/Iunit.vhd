library ieee;
use ieee.std_logic_1164.all;

entity Iunit is
	port(
		offset: in std_logic_vector(23 downto 0);
		nPCsel: in std_logic;
		instruction: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of Iunit is
begin
end architecture;
