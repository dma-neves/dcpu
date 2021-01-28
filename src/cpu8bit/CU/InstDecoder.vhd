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

	lod_adr_RA,
	str_RA_adr,
	lod_adr_RB,
	str_RB_adr,
	lod_adr_RC,
	str_RC_adr,
	lod_ACR_RA,
	str_ACR_adr,
	lod_X_RA,

	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	hlt
	: out STD_LOGIC
);
end InstDecoder;

architecture Behavioral of InstDecoder is

begin

--"00000000"
add_RA_RB <=
(not inst(0)) and (not inst(1)) and (not inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000001"
add_RA_RC <=
(    inst(0)) and (not inst(1)) and (not inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000010"
add_RA_X <=
(not inst(0)) and (    inst(1)) and (not inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000011"
sub_RA_RB <=
(    inst(0)) and (    inst(1)) and (not inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000100"
sub_RA_RC <=
(not inst(0)) and (not inst(1)) and (    inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000101"
sub_RA_X <=
(    inst(0)) and (not inst(1)) and (    inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000110"
inc_RA <=
(not inst(0)) and (    inst(1)) and (    inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00000111"
dec_RA <=
(    inst(0)) and (    inst(1)) and (    inst(2)) and (not inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001000"
neg_RA <=
(not inst(0)) and (not inst(1)) and (not inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001001"
not_RA <=
(    inst(0)) and (not inst(1)) and (not inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001010"
and_RA_RB <=
(not inst(0)) and (    inst(1)) and (not inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001011"
and_RA_RC <=
(    inst(0)) and (    inst(1)) and (not inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001100"
or_RA_RB<=
(not inst(0)) and (not inst(1)) and (    inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001101"
or_RA_RC <=
(    inst(0)) and (not inst(1)) and (    inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001110"
lod_adr_RA <=
(not inst(0)) and (    inst(1)) and (    inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00001111"
str_RA_adr <=
(    inst(0)) and (    inst(1)) and (    inst(2)) and (    inst(3)) and 
(not inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010000"
lod_adr_RB <=
(not inst(0)) and (not inst(1)) and (not inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010001"
str_RB_adr <=
(    inst(0)) and (not inst(1)) and (not inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010010"
lod_adr_RC <=
(not inst(0)) and (    inst(1)) and (not inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010011"
str_RC_adr <=
(    inst(0)) and (    inst(1)) and (not inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010100"
lod_ACR_RA <=
(not inst(0)) and (not inst(1)) and (    inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010101"
str_ACR_adr <=
(    inst(0)) and (not inst(1)) and (    inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010110"
lod_X_RA <=
(not inst(0)) and (    inst(1)) and (    inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00010111"
jmp_X <=
(    inst(0)) and (    inst(1)) and (    inst(2)) and (not inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00011000"
jmpz_X <=
(not inst(0)) and (not inst(1)) and (not inst(2)) and (    inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00011001"
jmpn_X <=
(    inst(0)) and (not inst(1)) and (not inst(2)) and (    inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

--"00011010"
jmpo_X <=
(not inst(0)) and (    inst(1)) and (not inst(2)) and (    inst(3)) and 
(    inst(4)) and (not inst(5)) and (not inst(6)) and (not inst(7));

end Behavioral;

