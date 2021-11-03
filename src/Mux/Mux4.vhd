library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux4 is
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end Mux4;

architecture Behavioral of Mux4 is

component Mux2
Port(
	I0, I1 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(15 downto 0)	
);
end component;

signal o_01, o_23 : STD_LOGIC_VECTOR(15 downto 0);

begin

O0 : Mux2 port map (I0, I1, sel(0), o_01);
O1 : Mux2 port map (I2, I3, sel(0), o_23);
O2 : Mux2 port map (o_01, o_23, sel(1), o); 

end Behavioral;

