library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2_4b is
Port(
	I0, I1 : in STD_LOGIC_VECTOR(3 downto 0);
	sel : in STD_LOGIC;
	o : out STD_LOGIC_VECTOR(3 downto 0)
);
end Mux2_4b;

architecture Behavioral of Mux2_4b is

signal I0_s, I1_s : STD_LOGIC_VECTOR(3 downto 0);

begin

I0_s(0) <= I0(0) and (not sel);
I0_s(1) <= I0(1) and (not sel);
I0_s(2) <= I0(2) and (not sel);
I0_s(3) <= I0(3) and (not sel);

I1_s(0) <= I1(0) and sel;
I1_s(1) <= I1(1) and sel;
I1_s(2) <= I1(2) and sel;
I1_s(3) <= I1(3) and sel;

o(0) <= I0_s(0) or I1_s(0);
o(1) <= I0_s(1) or I1_s(1);
o(2) <= I0_s(2) or I1_s(2);
o(3) <= I0_s(3) or I1_s(3);

end Behavioral;

