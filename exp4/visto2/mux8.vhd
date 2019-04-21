library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8 is
    Port ( seletor : in  STD_LOGIC_VECTOR (2 downto 0);
           entradas : in  STD_LOGIC_VECTOR (7 downto 0);
           saida : out  STD_LOGIC);
end mux8;

architecture multiplexador8 of mux8 is

begin
	saida <=  entradas(0) when (seletor(0)='0' and seletor(1)='0' and seletor(2)='0') else
				 entradas(1) when (seletor(0)='0' and seletor(1)='0' and seletor(2)='1') else
				 entradas(2) when (seletor(0)='0' and seletor(1)='1' and seletor(2)='0') else
				 entradas(3) when (seletor(0)='0' and seletor(1)='1' and seletor(2)='1') else
				 entradas(4) when (seletor(0)='1' and seletor(1)='0' and seletor(2)='0') else
				 entradas(5) when (seletor(0)='1' and seletor(1)='0' and seletor(2)='1') else
				 entradas(6) when (seletor(0)='1' and seletor(1)='1' and seletor(2)='0') else
				 entradas(7) when (seletor(0)='1' and seletor(1)='1' and seletor(2)='1') else
				 '0';

end multiplexador8;

