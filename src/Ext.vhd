library ieee;
use ieee.std_logic_1164.all;

entity Ext is
	generic (bw : integer := 32);
	port (
		E : in std_logic_vector(bw - 1 downto 0);
		S : out std_logic_vector(31 downto 0)
	);
end entity Ext;

architecture behavior of Ext is
	begin
		process(E)
		begin
			for i in 0 to bw - 1 loop
				S(i) <= E(i);
			end loop;
			for i in bw to 31 loop
				S(i) <= E(bw - 1);
			end loop;
		end process;
end architecture behavior;
