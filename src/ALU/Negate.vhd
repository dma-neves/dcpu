library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Negate is

Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	neg_a : out STD_LOGIC_VECTOR(7 downto 0);
	overflow : out STD_LOGIC
);

end Negate;

architecture Behavioral of Negate is

component Not_8
Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	not_a : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component Adder
Port(
	a : IN STD_LOGIC_VECTOR(7 downto 0);
	b : IN STD_LOGIC_VECTOR(7 downto 0);
	
	result : OUT STD_LOGIC_VECTOR(7 downto 0);
	carryOut : OUT STD_LOGIC
);
end component;

signal not_a : STD_LOGIC_VECTOR(7 downto 0);

begin

N: Not_8 port map(a, not_a);
S: Adder port map(not_a, "00000001", neg_a, overflow);

end Behavioral;

