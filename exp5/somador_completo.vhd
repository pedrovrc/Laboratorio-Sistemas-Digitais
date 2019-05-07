library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_completo is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end somador_completo;

architecture Behavioral of somador_completo is

signal e, f, g: STD_LOGIC;

begin

	s <= a xor b xor cin;
	e <= a and b;
	f <= a and cin;
	g <= b and cin;
	cout <= e or f or g;

end Behavioral;

