library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity isNegative is
Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	isNeg : out STD_LOGIC
);
end isNegative;

architecture Behavioral of isNegative is

begin

isNeg <= a(7) and '1';

end Behavioral;

