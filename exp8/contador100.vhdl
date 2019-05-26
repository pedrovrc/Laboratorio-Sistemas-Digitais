library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador100 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        load : in STD_LOGIC;
        dezload : in STD_LOGIC_VECTOR(3 downto 0);
        uniload : in STD_LOGIC_VECTOR(3 downto 0);
        dezena : out STD_LOGIC_VECTOR(3 downto 0);
        unidade : out STD_LOGIC_VECTOR(3 downto 0) );
end contador100;

architecture contador100_arch of contador100 is

component contador10 is
  Port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        rci : in STD_LOGIC;
        load : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Q : out STD_LOGIC_VECTOR(3 downto 0);
        rco : out STD_LOGIC );
end component;

signal fio1, fio2: STD_LOGIC;

begin
	UNIDADES: contador10 port map(clock, reset, enable, enable,
											load, uniload, unidade, fio1);
	DEZENAS: contador10 port map(clock, reset, enable, fio1,
										  load, dezload, dezena, fio2);

end contador100_arch;


