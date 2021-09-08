LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RAM64_test IS
END RAM64_test;

ARCHITECTURE behavior OF RAM64_test IS

COMPONENT RAM64
PORT(
    adr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    En : IN STD_LOGIC;
    R : IN STD_LOGIC;
    rw : IN STD_LOGIC;
    DI : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    DO : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

--Inputs
signal adr : STD_LOGIC_VECTOR(4 DOWNTO 0) := (others => '0');
signal En : STD_LOGIC := '0';
signal R : STD_LOGIC := '0';
signal rw : STD_LOGIC := '0';
signal DI : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');

--Outputs
signal DO : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: RAM64 PORT MAP (
    adr => adr,
    En => En,
    R => R,
    rw => rw,
    DI => DI,
    DO => DO
);

-- Stimulus process
stim_proc: process
begin
    En <= '0';
    wait for 10 ns;
    adr <= "00010";
    DI <= "01111000";
    rw <= '1';
    wait for 10 ns;
    En <= '1';
    wait for 10 ns;
    En <= '0';
    wait for 10 ns;
    adr <= "00000";
    DI <= "00000000";
    rw <= '0';
    wait for 10 ns;
    adr <= "00010";
    wait for 10 ns;
end process;
   
END;
