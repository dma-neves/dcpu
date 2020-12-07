
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DeMux16_1b is
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : out STD_LOGIC
);
end DeMux16_1b;

architecture Behavioral of DeMux16_1b is

component DeMux4_1b
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	
	I0, I1, I2, I3 : out STD_LOGIC
);
end component;

signal d0, d1, d2, d3 : STD_LOGIC;
signal sel_h : STD_LOGIC_VECTOR(1 downto 0);
signal sel_l : STD_LOGIC_VECTOR(1 downto 0);

begin

sel_l(0) <= sel(0);
sel_l(1) <= sel(1);

sel_h(0) <= sel(2);
sel_h(1) <= sel(3);

DEMUX_H_0: DeMux4_1b port map (d, sel_h, d0, d1, d2, d3);

DEMUX_L_0: DeMux4_1b port map (d0, sel_l, I0, I1, I2, I3);
DEMUX_L_1: DeMux4_1b port map (d1, sel_l, I4, I5, I6, I7);
DEMUX_L_2: DeMux4_1b port map (d2, sel_l, I8, I9, I10, I11);
DEMUX_L_3: DeMux4_1b port map (d3, sel_l, I12, I13, I14, I15);

end Behavioral;

