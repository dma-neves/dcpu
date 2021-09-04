library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop is

Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);

end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin

	process (D, En, R) begin
	 if(R = '1') then
		Q <= '0';
	 elsif (En'event and En = '1') then
		Q <= D;
	 end if;
	end process; 

end Behavioral;