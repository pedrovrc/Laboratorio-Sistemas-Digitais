library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity modulo_topo is
end modulo_topo;

architecture arch of modulo_topo is

component somador_4bits is
	Port (A : in STD_LOGIC_VECTOR (3 downto 0);
			B : in STD_LOGIC_VECTOR (3 downto 0);
			S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component golden_model is 
	Port (A : in STD_LOGIC_VECTOR (3 downto 0);
			B : in STD_LOGIC_VECTOR (3 downto 0);
			S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component testbench is
	Port (result_somador : in STD_LOGIC_VECTOR (4 downto 0);
			result_golden : in STD_LOGIC_VECTOR (4 downto 0);
			iteradorA : out STD_LOGIC_VECTOR (3 downto 0);
			iteradorB : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a, b : STD_LOGIC_VECTOR (3 downto 0);
signal f_adder, f_gm : STD_LOGIC_VECTOR (4 downto 0);

begin

	U0: somador_4bits port map(a, b, f_adder);
	U1: golden_model port map(a, b, f_gm);
	U2: testbench port map(f_adder, f_gm, a, b);

end arch;
