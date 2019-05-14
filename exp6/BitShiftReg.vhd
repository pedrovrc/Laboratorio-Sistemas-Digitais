library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BitShiftReg is
    Port (CLK, RST, LOAD, dir, L, R: in  STD_LOGIC;
          D : in  STD_LOGIC_VECTOR (3 downto 0);
			 Q: out STD_LOGIC_VECTOR (3 downto 0));
end BitShiftReg;

architecture arch of BitShiftReg is

component FlipFlopJK is
    Port (J, K, CLK, PRST, CLR: in STD_LOGIC;
			 Q: out STD_LOGIC);
end component;

begin
	process(CLK, RST, LOAD, dir)
		variable Qbuf: STD_LOGIC_VECTOR (3 downto 0);
	begin
		if rising_edge(CLK) then
			if RST = '1' then		-- reseta
				Q <= "0000";
				Qbuf := "0000";
				
			elsif LOAD = '1' then	-- carrega entrada D
				Q <= D;
				Qbuf:= D;
				
			else
				if dir = '0' then		-- move p/ esquerda
					Q <= Qbuf(2) & Qbuf(1) & Qbuf(0) & L;
					Qbuf := Qbuf(2) & Qbuf(1) & Qbuf(0) & L;
					
				elsif dir = '1' then		-- move p/ direita
					Q <= R & Qbuf(3) & Qbuf(2) & Qbuf(1);
					Qbuf := R & Qbuf(3) & Qbuf(2) & Qbuf(1);

				end if;
			end if;
		end if;
	end process;
end arch;

