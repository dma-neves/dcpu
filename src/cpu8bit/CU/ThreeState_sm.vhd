library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeState_sm is
Port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	start : in STD_LOGIC;
	
	S0, S1, S2 : out STD_LOGIC
);
end ThreeState_sm;

architecture Behavioral of ThreeState_sm is

component DFlipFlop is
Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);
end component;

signal DFF0_D, DFF0_Q, DFF1_D, DFF1_Q, DFF2_D, DFF2_Q : STD_LOGIC;

begin

DFF0_D <= start or DFF2_Q;
DFF1_D <= DFF0_Q and (not start);
DFF2_D <= DFF1_Q;

DFF0: DFlipFlop port map (DFF0_D, clk, reset, DFF0_Q);
DFF1: DFlipFlop port map (DFF1_D, clk, reset, DFF1_Q);
DFF2: DFlipFlop port map (DFF2_D, clk, reset, DFF2_Q);

S0 <= DFF0_Q;
S1 <= DFF1_Q;
S2 <= DFF2_Q;

end Behavioral;

