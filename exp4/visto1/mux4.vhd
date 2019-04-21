library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
    Port ( s : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           w : out  STD_LOGIC);
end mux4;

architecture multiplexador4 of mux4 is

signal a, b, c, e: STD_LOGIC;

begin

	a <= d(0) and (not s(1)) and (not s(0));
	b <= d(1) and (not s(1)) and s(0);
	c <= d(2) and s(1) and (not s(0));
	e <= d(3) and s(1) and s(0);
	w <= a or b or c or e;

end multiplexador4;

