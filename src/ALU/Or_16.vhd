library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_16 is

Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	b : in STD_LOGIC_VECTOR(15 downto 0);
	
	a_and_b : out STD_LOGIC_VECTOR(15 downto 0)
);

end Or_16;

architecture Behavioral of Or_16 is

begin

a_and_b(0) <= a(0) or b(0);
a_and_b(1) <= a(1) or  b(1);
a_and_b(2) <= a(2) or  b(2);
a_and_b(3) <= a(3) or  b(3);
a_and_b(4) <= a(4) or  b(4);
a_and_b(5) <= a(5) or  b(5);
a_and_b(6) <= a(6) or  b(6);
a_and_b(7) <= a(7) or  b(7);
a_and_b(8) <= a(8) or  b(8);
a_and_b(9) <= a(9) or  b(9);
a_and_b(10) <= a(10) or  b(10);
a_and_b(11) <= a(11) or  b(11);
a_and_b(12) <= a(12) or  b(12);
a_and_b(13) <= a(13) or  b(13);
a_and_b(14) <= a(14) or  b(14);
a_and_b(15) <= a(15) or  b(15);

end Behavioral;

