library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BitShiftReg is
    Port (clk, RST, LOAD, dir, L, R: in  STD_LOGIC;
          D : in  STD_LOGIC_VECTOR (3 downto 0);
			 Q: out STD_LOGIC_VECTOR (3 downto 0));
end BitShiftReg;

architecture arch of BitShiftReg is

component FlipFlopJK is
    Port (J, K, clk, PRST, CLR: in STD_LOGIC;
			 Q: out STD_LOGIC);
end component;

begin
	process(clk, RST, LOAD, dir, L, R)
	begin
		if rising_edge(clk) then
			if RST = '1' then Q <= "0000";
			elsif LOAD = '1' then Q <= D;
			else
				-- implementacao do bitshifter aqui
			end if;
		end if;
	end process;
end arch;

