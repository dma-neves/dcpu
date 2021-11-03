library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Not_16 is

Port(
	a : in STD_LOGIC_VECTOR(15 downto 0);
	not_a : out STD_LOGIC_VECTOR(15 downto 0)
);

end Not_16;

architecture Behavioral of Not_16 is
begin

not_a(0) <= not a(0);
not_a(1) <= not a(1);
not_a(2) <= not a(2);
not_a(3) <= not a(3);
not_a(4) <= not a(4);
not_a(5) <= not a(5);
not_a(6) <= not a(6);
not_a(7) <= not a(7);
not_a(8) <= not a(8);
not_a(9) <= not a(9);
not_a(10) <= not a(10);
not_a(11) <= not a(11);
not_a(12) <= not a(12);
not_a(13) <= not a(13);
not_a(14) <= not a(14);
not_a(15) <= not a(15);

end Behavioral;

