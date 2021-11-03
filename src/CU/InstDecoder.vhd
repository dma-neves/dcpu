library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstDecoder is
Port(
	inst : in STD_LOGIC_VECTOR(15 downto 0);

	add_RX_RY,
	sub_RX_RY,
	ssp_V,
	inc_RX,
	dec_RX,
	neg_RX,
	not_RX,
	and_RX_RY,
	or_RX_RY,
	lod_V_ADR,
	str_V_mADR,
	lod_mADR_RX,
	str_RX_mADR,
	lod_RX_ADR,
	lod_ACR_RX,
	lod_ACR_ADR,
	str_ACR_mADR,
	str_IC_mADR,
	jmp_ADR,
	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	hlt : out STD_LOGIC
);
end InstDecoder;

architecture Behavioral of InstDecoder is

component DeMux32_1b is
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(4 downto 0);
	
	o : out STD_LOGIC_VECTOR(31 downto 0)
);
end component;

signal dm_d : STD_LOGIC;
signal dm_o : STD_LOGIC_VECTOR(31 downto 0);

begin

-- TODO: Check dm_d
dm_d <= (not inst(5)) and (not inst(6)) and (not inst(7));

DM32: DeMux32_1b port map (
	d => dm_d, 
	sel => inst(4 downto 0),
	o => dm_o
);

add_RX_RY <= dm_o(0);
sub_RX_RY <= dm_o(1);
ssp_V <= dm_o(2);
inc_RX <= dm_o(3);
dec_RX <= dm_o(4);
neg_RX <= dm_o(5);
not_RX <= dm_o(6);
and_RX_RY <= dm_o(7);
or_RX_RY <= dm_o(8);
lod_V_ADR <= dm_o(9);
str_V_mADR <= dm_o(10);
lod_mADR_RX <= dm_o(11);
str_RX_mADR <= dm_o(12);
lod_RX_ADR <= dm_o(13);
lod_ACR_RX <= dm_o(14);
lod_ACR_ADR <= dm_o(15);
str_ACR_mADR <= dm_o(16);
str_IC_mADR <= dm_o(17);
jmp_ADR <= dm_o(18);
jmp_X <= dm_o(19);
jmpz_X <= dm_o(20);
jmpn_X <= dm_o(21);
jmpo_X <= dm_o(22);
hlt <= dm_o(23);

end Behavioral;

