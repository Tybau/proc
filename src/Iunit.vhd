library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Iunit is
	port(
		clk: in std_logic;
		offset: in std_logic_vector(23 downto 0);
		nPCsel: in std_logic;
		instruction: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of Iunit is
	signal ext_offset : std_logic_vector(31 downto 0);
	signal pc, pc_save : std_logic_vector(31 downto 0) := (others => '0');
	signal y_off : std_logic_vector(31 downto 0) := (others => '0');
	signal n_off : std_logic_vector(31 downto 0) := (others => '0');
begin
	pc_ext : entity work.Ext generic map(bw => 24) port map(
		E => offset,
		S => ext_offset
	);

	mux : entity work.Mux2 port map(
		COM => nPCsel,
		A => n_off,
		B => y_off,
		S => pc
	);

	memory : entity work.memory port map(
		clk => clk,
		data_in => (others => '0'),
		addr => pc_save (5 downto 0),
		wr_en => '0',
		data_out => instruction
	);

	n_off <= std_logic_vector(signed(pc_save) + 1);
	y_off <= std_logic_vector(signed(pc_save) + 1 + signed(ext_offset));

	process(clk)
	begin
		if rising_edge(clk) then
			pc_save <= pc;
		end if;
	end process;
end architecture;
