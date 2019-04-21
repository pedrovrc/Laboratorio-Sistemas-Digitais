library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity visto_2 is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC);
end visto_2;

architecture visto_2_op of visto_2 is
signal a,b,c,e: STD_LOGIC;
begin
	a <= D(0) and (not S(1)) and (not S(0));
	b <= D(1) and (not S(1)) and S(0);
	c <= D(2) and S(1) and (not S(0));
	e <= D(3) and S(1) and S(0);
	Y <= a or b or c or e;
end visto_2_op;

