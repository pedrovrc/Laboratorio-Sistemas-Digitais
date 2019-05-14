library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlopJK is
    Port (J, K, clk, PRST, CLR: in  STD_LOGIC;
			 Q: out STD_LOGIC);
end FlipFlopJK;

architecture arch of FlipFlopJK is
signal JK: STD_LOGIC_VECTOR(1 downto 0);

begin
	JK <= J & K;
	process(clk, PRST, CLR)
		variable Qbuf: STD_LOGIC;
	begin
		if rising_edge(clk) then
			case JK is
				when "01" => Qbuf := '0';
				when "10" => Qbuf := '1';
				when "11" => Qbuf := not(Qbuf);
				when others => Qbuf := Qbuf;
			end case;
		end if;
		if PRST = '1' then Qbuf := '1'; end if;
		if CLR = '1' then Qbuf := '0'; end if;
		Q <= Qbuf;
	end process;
end arch;

