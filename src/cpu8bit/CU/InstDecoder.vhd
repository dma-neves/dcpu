library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstDecoder is
Port(
	inst : in STD_LOGIC_VECTOR(7 downto 0);
	
	add_RA_RB,
	add_RA_RC,
	add_RA_X,
	sub_RA_RB,
	sub_RA_RC,
	sub_RA_X,
	inc_RA,
	dec_RA,
	neg_RA,
	not_RA,
	and_RA_RB,
	and_RA_RC,
	or_RA_RB,
	or_RA_RC,	
	
	lod_X_RA,
	lod_X_RB,
	lod_X_RC,
	lod_X_ADR,
	
	lod_X_mADR,
	lod_adr_ADR,
	
	lod_mADR_RA,
	str_RA_mADR,
	lod_mADR_RB,
	str_RB_mADR,
	lod_mADR_RC,
	str_RC_mADR,
	
	lod_ACR_RA,
	lod_ACR_ADR,
	str_ACR_mADR,

	jmp_adr,
	jmpz_adr,
	jmpn_adr,
	jmpo_adr,
	hlt
	: out STD_LOGIC
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

dm_d <= (not inst(5)) and (not inst(6)) and (not inst(7));

DM32: DeMux32_1b port map (
	d => dm_d, 
	sel => inst(4 downto 0),
	o => dm_o
);

add_RA_RB <= dm_o(0);
add_RA_RC <= dm_o(1);
add_RA_X <= dm_o(2);
sub_RA_RB <= dm_o(3);
sub_RA_RC <= dm_o(4);
sub_RA_X <= dm_o(5);
inc_RA <= dm_o(6);
dec_RA <= dm_o(7);
neg_RA <= dm_o(8);
not_RA <= dm_o(9);
and_RA_RB <= dm_o(10);
and_RA_RC <= dm_o(11);
or_RA_RB <= dm_o(12);
or_RA_RC <= dm_o(13);	
lod_X_RA <= dm_o(14);
lod_X_RB <= dm_o(15);
lod_X_RC <= dm_o(16);
lod_X_ADR <= dm_o(17);
lod_X_mADR <= dm_o(18);
lod_adr_ADR <= dm_o(19);
lod_mADR_RA <= dm_o(20);
str_RA_mADR <= dm_o(21);
lod_mADR_RB <= dm_o(22);
str_RB_mADR <= dm_o(23);
lod_mADR_RC <= dm_o(24);
str_RC_mADR <= dm_o(25);
lod_ACR_RA <= dm_o(26);
lod_ACR_ADR <= dm_o(27);
str_ACR_mADR <= dm_o(28);
jmp_adr <= dm_o(29);
jmpz_adr <= dm_o(30);
jmpn_adr <= dm_o(31);
	
jmpo_adr <= 
(not inst(0)) and (not inst(1)) and (not inst(2)) and (not inst(3)) and
(not inst(4)) and (    inst(5)) and (not inst(6)) and (not inst(7));

hlt <= 
(    inst(0)) and (not inst(1)) and (not inst(2)) and (not inst(3)) and
(not inst(4)) and (    inst(5)) and (not inst(6)) and (not inst(7));

end Behavioral;

