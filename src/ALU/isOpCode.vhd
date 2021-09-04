library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity isOpCode is
Port(
	opc : in STD_LOGIC_VECTOR(2 downto 0); -- Actual opCode
	cmpOpc : in STD_LOGIC_VECTOR(2 downto 0); -- opCode to compare with
	
	ioc : out STD_LOGIC
);
end isOpCode;

architecture Behavioral of isOpCode is
begin

ioc <= (opc(0) xnor cmpOpc(0)) and (opc(1) xnor cmpOpc(1)) and (opc(2) xnor cmpOpc(2));

end Behavioral;

