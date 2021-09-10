
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity RAM64 is
Port(
	adr : in STD_LOGIC_VECTOR(5 downto 0);
	En : in STD_LOGIC;
	R : in STD_LOGIC;
	rw : in STD_LOGIC;
	DI : in STD_LOGIC_VECTOR(7 downto 0);
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end RAM64;

architecture Behavioral of RAM64 is

type RAM is array (0 to 63) of STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ram_block : RAM := (others => "00000000");

SIGNAL DO_aux : STD_LOGIC_VECTOR(7 downto 0);

begin

DO_aux <= ram_block(to_integer(unsigned(adr)));
DO(0) <= DO_aux(0) and En;
DO(1) <= DO_aux(1) and En;
DO(2) <= DO_aux(2) and En;
DO(3) <= DO_aux(3) and En;
DO(4) <= DO_aux(4) and En;
DO(5) <= DO_aux(5) and En;
DO(6) <= DO_aux(6) and En;
DO(7) <= DO_aux(7) and En;

process(rw)
begin

	if (rising_edge(rw)) then
	
		if rw = '1' then
			ram_block(to_integer(unsigned(adr))) <= DI;
		end if;
		
	end if;

end process;

end Behavioral;

