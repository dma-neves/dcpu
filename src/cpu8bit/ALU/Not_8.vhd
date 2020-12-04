library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Not_8 is

Port(
	a : in STD_LOGIC_VECTOR(7 downto 0);
	not_a : out STD_LOGIC_VECTOR(7 downto 0)
);

end Not_8;

architecture Behavioral of Not_8 is
begin

not_a(0) <= not a(0);
not_a(1) <= not a(1);
not_a(2) <= not a(2);
not_a(3) <= not a(3);
not_a(4) <= not a(4);
not_a(5) <= not a(5);
not_a(6) <= not a(6);
not_a(7) <= not a(7);

end Behavioral;

