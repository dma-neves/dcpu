library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DeMux4 is
Port(
	d : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	
	I0, I1, I2, I3 : out STD_LOGIC_VECTOR(7 downto 0)
);
end DeMux4;

architecture Behavioral of DeMux4 is

begin

I0(0) <= d(0) and (not sel(0)) and (not sel(1));
I0(1) <= d(1) and (not sel(0)) and (not sel(1));
I0(2) <= d(2) and (not sel(0)) and (not sel(1));
I0(3) <= d(3) and (not sel(0)) and (not sel(1));
I0(4) <= d(4) and (not sel(0)) and (not sel(1));
I0(5) <= d(5) and (not sel(0)) and (not sel(1));
I0(6) <= d(6) and (not sel(0)) and (not sel(1));
I0(7) <= d(7) and (not sel(0)) and (not sel(1));

I1(0) <= d(0) and sel(0) and (not sel(1));
I1(1) <= d(1) and sel(0) and (not sel(1));
I1(2) <= d(2) and sel(0) and (not sel(1));
I1(3) <= d(3) and sel(0) and (not sel(1));
I1(4) <= d(4) and sel(0) and (not sel(1));
I1(5) <= d(5) and sel(0) and (not sel(1));
I1(6) <= d(6) and sel(0) and (not sel(1));
I1(7) <= d(7) and sel(0) and (not sel(1));

I2(0) <= d(0) and (not sel(0)) and sel(1);
I2(1) <= d(1) and (not sel(0)) and sel(1);
I2(2) <= d(2) and (not sel(0)) and sel(1);
I2(3) <= d(3) and (not sel(0)) and sel(1);
I2(4) <= d(4) and (not sel(0)) and sel(1);
I2(5) <= d(5) and (not sel(0)) and sel(1);
I2(6) <= d(6) and (not sel(0)) and sel(1);
I2(7) <= d(7) and (not sel(0)) and sel(1);

I3(0) <= d(0) and sel(0) and sel(1);
I3(1) <= d(1) and sel(0) and sel(1);
I3(2) <= d(2) and sel(0) and sel(1);
I3(3) <= d(3) and sel(0) and sel(1);
I3(4) <= d(4) and sel(0) and sel(1);
I3(5) <= d(5) and sel(0) and sel(1);
I3(6) <= d(6) and sel(0) and sel(1);
I3(7) <= d(7) and sel(0) and sel(1);

end Behavioral;

