library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity visto_1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end visto_1;

architecture visto_1_op of visto_1 is
signal e,f,g: STD_LOGIC;
begin
	s <= a xor b xor cin;
	e <= a and b;
	f <= a and cin;
	g <= b and cin;
	cout <= e or f or g;
end visto_1_op;

