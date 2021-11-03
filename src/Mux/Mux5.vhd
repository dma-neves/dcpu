library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5 is
Port(
	I0, I1, I2, I3, I4_7 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC_VECTOR(2 downto 0);
	
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end Mux5;

architecture Behavioral of Mux5 is

component Mux4
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Mux2
Port(
	I0, I1 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC;
	
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal o0_3 : STD_LOGIC_VECTOR(15 downto 0);
signal sel_s : STD_LOGIC_VECTOR(1 downto 0);

begin

sel_s(0) <= sel(0);
sel_s(1) <= sel(1);

O03: Mux4 port map (I0, I1, I2, I3, sel_s, o0_3);
O_f: Mux2 port map (o0_3, I4_7, sel(2), o);

end Behavioral;

