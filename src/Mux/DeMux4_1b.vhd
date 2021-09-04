library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DeMux4_1b is
Port(
	d : in STD_LOGIC;
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	
	I0, I1, I2, I3 : out STD_LOGIC
);
end DeMux4_1b;

architecture Behavioral of DeMux4_1b is

begin

I0 <= d and ( not sel(0) ) and ( not sel(1) );
I1 <= d and sel(0) and ( not sel(1) );
I2 <= d and ( not sel(0) ) and sel(1);
I3 <= d and sel(0) and sel(1);

end Behavioral;

