library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DeMux5 is
Port(
	d : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(2 downto 0);
	
	I0, I1, I2, I3, I4 : out STD_LOGIC_VECTOR(7 downto 0)
);
end DeMux5;

architecture Behavioral of DeMux5 is

component DeMux4 is
Port(
	d : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	
	I0, I1, I2, I3 : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal sel_l : STD_LOGIC_VECTOR(1 downto 0);
signal d_aux : STD_LOGIC_VECTOR(7 downto 0);

begin

sel_l(0) <= sel(0);
sel_l(1) <= sel(1);

d_aux(0) <= d(0) and (not sel(2));
d_aux(1) <= d(1) and (not sel(2));
d_aux(2) <= d(2) and (not sel(2));
d_aux(3) <= d(3) and (not sel(2));
d_aux(4) <= d(4) and (not sel(2));
d_aux(5) <= d(5) and (not sel(2));
d_aux(6) <= d(6) and (not sel(2));
d_aux(7) <= d(7) and (not sel(2));

DM4: DeMux4 port map (d_aux, sel_l, I0, I1, I2, I3);

I4(0) <= d(0) and sel(2);
I4(1) <= d(1) and sel(2);
I4(2) <= d(2) and sel(2);
I4(3) <= d(3) and sel(2);
I4(4) <= d(4) and sel(2);
I4(5) <= d(5) and sel(2);
I4(6) <= d(6) and sel(2);
I4(7) <= d(7) and sel(2);

end Behavioral;

