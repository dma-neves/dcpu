library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
Port(
	I0, I1 : in STD_LOGIC_VECTOR(15 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(15 downto 0)
);
end Mux2;

architecture Behavioral of Mux2 is

signal I0_s, I1_s : STD_LOGIC_VECTOR(15 downto 0);

begin

I0_s(0) <= I0(0) and (not sel);
I0_s(1) <= I0(1) and (not sel);
I0_s(2) <= I0(2) and (not sel);
I0_s(3) <= I0(3) and (not sel);
I0_s(4) <= I0(4) and (not sel);
I0_s(5) <= I0(5) and (not sel);
I0_s(6) <= I0(6) and (not sel);
I0_s(7) <= I0(7) and (not sel);
I0_s(8) <= I0(8) and (not sel);
I0_s(9) <= I0(9) and (not sel);
I0_s(10) <= I0(10) and (not sel);
I0_s(11) <= I0(11) and (not sel);
I0_s(12) <= I0(12) and (not sel);
I0_s(13) <= I0(13) and (not sel);
I0_s(14) <= I0(14) and (not sel);
I0_s(15) <= I0(15) and (not sel);

I1_s(0) <= I1(0) and sel;
I1_s(1) <= I1(1) and sel;
I1_s(2) <= I1(2) and sel;
I1_s(3) <= I1(3) and sel;
I1_s(4) <= I1(4) and sel;
I1_s(5) <= I1(5) and sel;
I1_s(6) <= I1(6) and sel;
I1_s(7) <= I1(7) and sel;
I1_s(8) <= I1(8) and sel;
I1_s(9) <= I1(9) and sel;
I1_s(10) <= I1(10) and sel;
I1_s(11) <= I1(11) and sel;
I1_s(12) <= I1(12) and sel;
I1_s(13) <= I1(13) and sel;
I1_s(14) <= I1(14) and sel;
I1_s(15) <= I1(15) and sel;

o(0) <= I0_s(0) or I1_s(0);
o(1) <= I0_s(1) or I1_s(1);
o(2) <= I0_s(2) or I1_s(2);
o(3) <= I0_s(3) or I1_s(3);
o(4) <= I0_s(4) or I1_s(4);
o(5) <= I0_s(5) or I1_s(5);
o(6) <= I0_s(6) or I1_s(6);
o(7) <= I0_s(7) or I1_s(7);
o(8) <= I0_s(8) or I1_s(8);
o(9) <= I0_s(9) or I1_s(9);
o(10) <= I0_s(10) or I1_s(10);
o(11) <= I0_s(11) or I1_s(11);
o(12) <= I0_s(12) or I1_s(12);
o(13) <= I0_s(13) or I1_s(13);
o(14) <= I0_s(14) or I1_s(14);
o(15) <= I0_s(15) or I1_s(15);

end Behavioral;

