library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity visto2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           e : in  STD_LOGIC;
           f : in  STD_LOGIC;
           g : in  STD_LOGIC;
           s : out  STD_LOGIC);
end visto2;

architecture Behavioral of visto2 is

component decoder4to16 is
	Port ( fourbits_in : in  STD_LOGIC_VECTOR (3 downto 0);
          sixteenbits_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux8 is
	Port ( seletor	: in  STD_LOGIC_VECTOR (2 downto 0);
          entradas : in  STD_LOGIC_VECTOR (7 downto 0);
          saida : out  STD_LOGIC);
end component;

signal decoder_in: STD_LOGIC_VECTOR(3 downto 0);
signal mux_in: STD_LOGIC_VECTOR(7 downto 0);
signal seletores: STD_LOGIC_VECTOR(2 downto 0);
signal fios: STD_LOGIC_VECTOR(15 downto 0);
signal zero, um, x1, x2, x4, x6: STD_LOGIC;

begin
	zero <= (a and not(a)); -- feito somente para
	um <= (a or not(a));		-- usar como STD_LOGIC
	
	decoder_in <= (a, b, c, d);

	comp0: decoder4to16 port map(decoder_in, fios);
	
	seletores <= (e, f, g);
	x1 <= fios(0) or fios(15);
	x2 <= fios(7);
	x4 <= fios(8) or fios(15);
	x6 <= fios(9) or fios(10);
	mux_in <= (zero, x1, x2, um, x4, zero, x6, um);
	
	comp1: mux8 port map(seletores, mux_in, s);

end Behavioral;

