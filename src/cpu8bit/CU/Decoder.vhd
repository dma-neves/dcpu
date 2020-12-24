library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
Port(
	inst : in STD_LOGIC_VECTOR(7 downto 0);
	En : in STD_LOGIC;
	
	add_RA_RB,
	add_RA_X,
	sub_RA_RB,
	sub_RA_X,
	inc_RA,
	dec_RA,
	neg_RA,
	not_RA,
	and_RA_RB,
	or_RA_RB,

	lod_adr_RA,
	str_RA_adr,
	lod_adr_RB,
	str_RB_adr,
	lod_adr_RC,
	str_RC_adr,
	lod_ACR_RA,
	str_ACR_adr,

	jmp_X,
	jmpz_X,
	jmpn_X,
	jmpo_X,
	hlt
	: out STD_LOGIC
);
end Decoder;

architecture Behavioral of Decoder is

signal e_inst : STD_LOGIC_VECTOR(7 downto 0);

begin

e_inst(0) <= inst(0) and En;
e_inst(1) <= inst(1) and En;
e_inst(2) <= inst(2) and En;
e_inst(3) <= inst(3) and En;
e_inst(4) <= inst(4) and En;
e_inst(5) <= inst(5) and En;
e_inst(6) <= inst(6) and En;
e_inst(7) <= inst(7) and En;

--"00000000"
add_RA_RB <= 
(not e_inst(0)) and (not e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000001"
add_RA_X <= 
(    e_inst(0)) and (not e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000010"
sub_RA_RB <= 
(not e_inst(0)) and (    e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000011"
sub_RA_X <= 
(    e_inst(0)) and (    e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000100"
inc_RA <= 
(not e_inst(0)) and (not e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000101"
dec_RA <= 
(    e_inst(0)) and (not e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000110"
neg_RA <= 
(not e_inst(0)) and (    e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00000111"
not_RA <= 
(    e_inst(0)) and (    e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001000"
and_RA_RB <= 
(not e_inst(0)) and (not e_inst(1)) and (not e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001001"
or_RA_RB <= 
(    e_inst(0)) and (not e_inst(1)) and (not e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001010"
lod_adr_RA <= 
(not e_inst(0)) and (    e_inst(1)) and (not e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001011"
str_RA_adr <= 
(    e_inst(0)) and (    e_inst(1)) and (not e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001100"
lod_adr_RB <= 
(not e_inst(0)) and (not e_inst(1)) and (    e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001101"
str_RB_adr <= 
(    e_inst(0)) and (not e_inst(1)) and (    e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001110"
lod_adr_RC <= 
(not e_inst(0)) and (    e_inst(1)) and (    e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00001111"
str_RC_adr <= 
(    e_inst(0)) and (    e_inst(1)) and (    e_inst(2)) and (    e_inst(3)) and 
(not e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010000"
lod_ACR_RA <= 
(not e_inst(0)) and (not e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010001"
str_ACR_adr <= 
(    e_inst(0)) and (not e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010010"
jmp_X <= 
(not e_inst(0)) and (    e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010011"
jmpz_X <= 
(    e_inst(0)) and (    e_inst(1)) and (not e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010100"
jmpn_X <= 
(not e_inst(0)) and (not e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010101"
jmpo_X <= 
(    e_inst(0)) and (not e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

--"00010110"
hlt <= 
(not e_inst(0)) and (    e_inst(1)) and (    e_inst(2)) and (not e_inst(3)) and 
(    e_inst(4)) and (not e_inst(5)) and (not e_inst(6)) and (not e_inst(7));

end Behavioral;

