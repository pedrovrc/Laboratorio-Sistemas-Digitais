library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_4bits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (4 downto 0));
end somador_4bits;

architecture arch of somador_4bits is

component somador_completo is
	Port (a : in STD_LOGIC;
			b : in STD_LOGIC;
			cin : in STD_LOGIC;
			s : out STD_LOGIC;
			cout : out STD_LOGIC);
end component;

signal c0, c1, c2, c3 : STD_LOGIC;

begin

	som1: somador_completo port map (A(0), B(0), '0', S(0), c0);
	som2: somador_completo port map (A(1), B(1), c0, S(1), c1);
	som3: somador_completo port map (A(2), B(2), c1, S(2), c2);
	som4: somador_completo port map (A(3), B(3), c2, S(3), c3);

	S(4) <= c3;

end arch;

