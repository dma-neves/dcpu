
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity RAM64 is
Port(
	adr : in STD_LOGIC_VECTOR(4 downto 0);
	En : in STD_LOGIC;
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC_VECTOR(7 downto 0);
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end RAM64;

architecture Behavioral of RAM64 is

type RAM is array (0 to 63) of STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ram_block : RAM;

begin

process(adr, En, rw)
begin

	if (En'event and En = '1') then
	
		if rw = '1' then
			ram_block(to_integer(unsigned(adr))) <= DI;
		end if;
		
	end if;
	DO <= ram_block(to_integer(unsigned(adr)));

end process;

end Behavioral;

