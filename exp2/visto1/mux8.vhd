library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8 is
    Port ( s : in  STD_LOGIC_VECTOR (2 downto 0);
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC);
end mux8;

architecture multiplexador of mux8 is

begin
	y <=  d(0) when (s(0)='0' and s(1)='0' and s(2)='0') else
			d(1) when (s(0)='0' and s(1)='0' and s(2)='1') else
			d(2) when (s(0)='0' and s(1)='1' and s(2)='0') else
			d(3) when (s(0)='0' and s(1)='1' and s(2)='1') else
			d(4) when (s(0)='1' and s(1)='0' and s(2)='0') else
			d(5) when (s(0)='1' and s(1)='0' and s(2)='1') else
			d(6) when (s(0)='1' and s(1)='1' and s(2)='0') else
			d(7) when (s(0)='1' and s(1)='1' and s(2)='1') else
			'0';  

end multiplexador;

