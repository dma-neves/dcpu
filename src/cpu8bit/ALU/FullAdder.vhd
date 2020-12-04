library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is

Port(
	carryIn : IN STD_LOGIC;
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	
	result : OUT STD_LOGIC;
	carryOut : OUT STD_LOGIC
);

end FullAdder;

architecture Behavioral of FullAdder is

signal result_0, carry_0, carry_1 : STD_LOGIC;

begin

result_0 <= a xor b;
carry_0 <= a and b;

carry_1 <= result_0 and carryIn;
result <= result_0 xor carryIn;

carryOut <= carry_0 or carry_1;

end Behavioral;

