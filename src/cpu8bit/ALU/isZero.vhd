library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity isZero is
Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	isZero : out STD_LOGIC
);
end isZero;

architecture Behavioral of isZero is

begin

isZero <= 
(not a(0)) and
(not a(1)) and
(not a(2)) and
(not a(3)) and
(not a(4)) and
(not a(5)) and
(not a(6)) and
(not a(7));

end Behavioral;

