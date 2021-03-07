
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DeMux32_1b is
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(4 downto 0);
	
	o : out STD_LOGIC_VECTOR(31 downto 0)
);
end DeMux32_1b;

architecture Behavioral of DeMux32_1b is

component DeMux16_1b is
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(3 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : out STD_LOGIC
);
end component;

signal dm0_o, dm1_o : STD_LOGIC_VECTOR(15 downto 0);
signal dm0_d, dm1_d : STD_LOGIC;

begin

dm0_d <= d and (not sel(4));
dm1_d <= d and (sel (4));

DM16_0: DeMux16_1b port map (
	dm0_d, sel(3 downto 0), 
	dm0_o(0), dm0_o(1), dm0_o(2), dm0_o(3), dm0_o(4), dm0_o(5), dm0_o(6), dm0_o(7),
	dm0_o(8), dm0_o(9), dm0_o(10), dm0_o(11), dm0_o(12), dm0_o(13), dm0_o(14), dm0_o(15)
);

DM16_1: DeMux16_1b port map (
	dm1_d, sel(3 downto 0), 
	dm1_o(0), dm1_o(1), dm1_o(2), dm1_o(3), dm1_o(4), dm1_o(5), dm1_o(6), dm1_o(7),
	dm1_o(8), dm1_o(9), dm1_o(10), dm1_o(11), dm1_o(12), dm1_o(13), dm1_o(14), dm1_o(15)
);

o(15 downto 0) <= dm0_o;
o(31 downto 16) <= dm1_o;

end Behavioral;

