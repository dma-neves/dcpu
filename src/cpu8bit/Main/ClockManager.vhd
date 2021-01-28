
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockManager is
Port(
	clk : in STD_LOGIC;
	clk_out : out STD_LOGIC
);
end ClockManager;

architecture Behavioral of ClockManager is

begin

clk_out <= clk;

end Behavioral;

