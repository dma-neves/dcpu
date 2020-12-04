library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder is

Port(
	a : IN STD_LOGIC_VECTOR(7 downto 0);
	b : IN STD_LOGIC_VECTOR(7 downto 0);
	
	result : OUT STD_LOGIC_VECTOR(7 downto 0);
	carryOut : OUT STD_LOGIC
);

end Adder;

architecture Behavioral of Adder is

component FullAdder
Port(
	carryIn : IN STD_LOGIC;
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	
	result : OUT STD_LOGIC;
	carryOut : OUT STD_LOGIC
);
end component;

signal co_0, co_1, co_2, co_3, co_4, co_5, co_6, co_7 : STD_LOGIC;

begin

S0 : FullAdder port map ('0', a(0), b(0), result(0), co_0);
S1: FullAdder port map (co_0, a(1), b(1), result(1), co_1);
S2: FullAdder port map (co_1, a(2), b(2), result(2), co_2);
S3: FullAdder port map (co_2, a(3), b(3), result(3), co_3);
S4: FullAdder port map (co_3, a(4), b(4), result(4), co_4);
S5: FullAdder port map (co_4, a(5), b(5), result(5), co_5);
S6: FullAdder port map (co_5, a(6), b(6), result(6), co_6);
S7: FullAdder port map (co_6, a(7), b(7), result(7), co_7);

carryOut <= co_7;

end Behavioral;

