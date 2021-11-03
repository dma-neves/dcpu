library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity isZero is
Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
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
(not a(7)) and
(not a(8)) and
(not a(9)) and
(not a(10)) and
(not a(11)) and
(not a(12)) and
(not a(13)) and
(not a(14)) and
(not a(15));


end Behavioral;

