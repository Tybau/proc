library ieee;
use ieee.std_logic_1164.all;

entity reg32 is
	port(
		data_in: in std_logic_vector(31 downto 0);
		rst, clk: in std_logic;
		we: in std_logic;
		data_out: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of reg32 is
	signal reg: std_logic_vector(31 downto 0);
begin
    data_out <= reg;

	process(clk)
	begin
		if(rst = '1') then
			reg <= (others => '0');
		elsif(rising_edge(clk)) then
			if(we = '1') then
				reg <= data_in;
			end if;
		end if;
	end process;
end architecture;
