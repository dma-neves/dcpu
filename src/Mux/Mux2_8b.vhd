library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2_8b is
Port(
	I0, I1 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(7 downto 0)
);
end Mux2_8b;

architecture Behavioral of Mux2_8b is

signal I0_s, I1_s : STD_LOGIC_VECTOR(7 downto 0);

begin

I0_s(0) <= I0(0) and (not sel);
I0_s(1) <= I0(1) and (not sel);
I0_s(2) <= I0(2) and (not sel);
I0_s(3) <= I0(3) and (not sel);
I0_s(4) <= I0(4) and (not sel);
I0_s(5) <= I0(5) and (not sel);
I0_s(6) <= I0(6) and (not sel);
I0_s(7) <= I0(7) and (not sel);

I1_s(0) <= I1(0) and sel;
I1_s(1) <= I1(1) and sel;
I1_s(2) <= I1(2) and sel;
I1_s(3) <= I1(3) and sel;
I1_s(4) <= I1(4) and sel;
I1_s(5) <= I1(5) and sel;
I1_s(6) <= I1(6) and sel;
I1_s(7) <= I1(7) and sel;

o(0) <= I0_s(0) or I1_s(0);
o(1) <= I0_s(1) or I1_s(1);
o(2) <= I0_s(2) or I1_s(2);
o(3) <= I0_s(3) or I1_s(3);
o(4) <= I0_s(4) or I1_s(4);
o(5) <= I0_s(5) or I1_s(5);
o(6) <= I0_s(6) or I1_s(6);
o(7) <= I0_s(7) or I1_s(7);

end Behavioral;

