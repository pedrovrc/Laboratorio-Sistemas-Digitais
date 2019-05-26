library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convsemaforo7seg is
  port( RYGsemaforo : in STD_LOGIC_VECTOR(2 downto 0);
        num7seg : out STD_LOGIC_VECTOR(7 downto 0) );
end convsemaforo7seg;

architecture convsemaforo7seg_arch of convsemaforo7seg is

begin
	with RYGsemaforo select
		num7seg <= "10000000" when "100",
					  "00000010" when "010",
					  "00010000" when "001",
					  "00000000" when others;

end convsemaforo7seg_arch;

