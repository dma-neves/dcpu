library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenState_sm is
Port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	
	S0, S1, S2, S3, S4, S5, S6 : out STD_LOGIC
);
end SevenState_sm;

architecture Behavioral of SevenState_sm is

component DFlipFlop is
Port(
	D, En, R : in STD_LOGIC;
	Q : OUT STD_LOGIC
);
end component;

component DFlipFlopRA is
	Port(
		D, En, R : in STD_LOGIC;
		Q : OUT STD_LOGIC
	);
end component;

signal
DFFS_D, DFFS_Q,
DFF0_D, DFF0_Q,
DFF1_D, DFF1_Q,
DFF2_D, DFF2_Q,
DFF3_D, DFF3_Q,
DFF4_D, DFF4_Q,
DFF5_D, DFF5_Q,
DFF6_D, DFF6_Q : STD_LOGIC;

begin

DFFS_D <= '0';
DFF0_D <= DFF6_Q or DFFS_Q;
DFF1_D <= DFF0_Q;
DFF2_D <= DFF1_Q;
DFF3_D <= DFF2_Q;
DFF4_D <= DFF3_Q;
DFF5_D <= DFF4_Q;
DFF6_D <= DFF5_Q;

DFFS: DFlipFlopRA port map (DFFS_D, clk, reset, DFFS_Q);
DFF0: DFlipFlop port map (DFF0_D, clk, reset, DFF0_Q);
DFF1: DFlipFlop port map (DFF1_D, clk, reset, DFF1_Q);
DFF2: DFlipFlop port map (DFF2_D, clk, reset, DFF2_Q);
DFF3: DFlipFlop port map (DFF3_D, clk, reset, DFF3_Q);
DFF4: DFlipFlop port map (DFF4_D, clk, reset, DFF4_Q);
DFF5: DFlipFlop port map (DFF5_D, clk, reset, DFF5_Q);
DFF6: DFlipFlop port map (DFF6_D, clk, reset, DFF6_Q);

S0 <= DFF0_Q;
S1 <= DFF1_Q;
S2 <= DFF2_Q;
S3 <= DFF3_Q;
S4 <= DFF4_Q;
S5 <= DFF5_Q;
S6 <= DFF6_Q;

end Behavioral;

