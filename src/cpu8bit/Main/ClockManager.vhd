
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockManager is
Port(
	clk, reset : in STD_LOGIC;
	run, step : in STD_LOGIC;
	
	clk_out : out STD_LOGIC
);
end ClockManager;

architecture Behavioral of ClockManager is


component DFlipFlop is
Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);
end component;

signal run_q : STD_LOGIC;

begin

RUN_DFF: DFlipFlop port map('1', run, reset, run_q);

clk_out <= (clk and run_q) or step;

end Behavioral;

