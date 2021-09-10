-- DFlipFlop that resets to '1'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlopRA is

Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);

end DFlipFlopRA;

architecture Behavioral of DFlipFlopRA is

begin

	process (D, En, R) begin
	 if(R = '1') then
		Q <= '1';
	 elsif (En'event and En = '1') then
		Q <= D;
	 end if;
	end process; 

end Behavioral;