library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And_8 is

Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	b : in STD_LOGIC_VECTOR(7 downto 0);
	
	a_and_b : out STD_LOGIC_VECTOR(7 downto 0)
);

end And_8;

architecture Behavioral of And_8 is

begin

a_and_b(0) <= a(0) and b(0);
a_and_b(1) <= a(1) and b(1);
a_and_b(2) <= a(2) and b(2);
a_and_b(3) <= a(3) and b(3);
a_and_b(4) <= a(4) and b(4);
a_and_b(5) <= a(5) and b(5);
a_and_b(6) <= a(6) and b(6);
a_and_b(7) <= a(7) and b(7);

end Behavioral;

