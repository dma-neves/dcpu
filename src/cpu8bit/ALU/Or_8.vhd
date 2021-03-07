library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_8 is

Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	b : in STD_LOGIC_VECTOR(7 downto 0);
	
	a_and_b : out STD_LOGIC_VECTOR(7 downto 0)
);

end Or_8;

architecture Behavioral of Or_8 is

begin

a_and_b(0) <= a(0) or b(0);
a_and_b(1) <= a(1) or  b(1);
a_and_b(2) <= a(2) or  b(2);
a_and_b(3) <= a(3) or  b(3);
a_and_b(4) <= a(4) or  b(4);
a_and_b(5) <= a(5) or  b(5);
a_and_b(6) <= a(6) or  b(6);
a_and_b(7) <= a(7) or  b(7);

end Behavioral;

