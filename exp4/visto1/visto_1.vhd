library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity visto_1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           x : out  STD_LOGIC;
           y : out  STD_LOGIC);
end visto_1;

architecture Behavioral of visto_1 is

component mux4 is
	Port ( s : in  STD_LOGIC_VECTOR (1 downto 0);
          d : in  STD_LOGIC_VECTOR (3 downto 0);
          w : out  STD_LOGIC);
end component;

signal zero, um: STD_LOGIC;
signal seletor: STD_LOGIC_VECTOR(1 downto 0);
signal selecao0: STD_LOGIC_VECTOR(3 downto 0);
signal selecao1: STD_LOGIC_VECTOR(3 downto 0);

begin
	zero <= c and not(c);	-- feito somente para
	um <= c or not(c);		-- usar como STD_LOGIC
	
	seletor <= (a, b);
	selecao0 <= (zero, c, not(c), um);
	selecao1 <= (um, not(c), zero, c);

	comp0: mux4 port map(seletor, selecao0, x);
	comp1: mux4 port map(seletor, selecao1, y);

end Behavioral;

