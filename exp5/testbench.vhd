library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbench is
	Port (result_somador, result_golden : in STD_LOGIC_VECTOR (4 downto 0);
			iteradorA, iteradorB : out STD_LOGIC_VECTOR (3 downto 0));
end testbench;

architecture arch of testbench is

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

begin
	process
		variable contador1, contador2 : STD_LOGIC_VECTOR (3 downto 0);
	begin
	
		report "-----Iniciando Teste-----" severity NOTE;
		
		contador1 := "0000";
		contador2 := "0000";

		for i in 0 to 15 loop
			for j in 0 to 15 loop
			
				iteradorA <= contador1;
				iteradorB <= contador2;				
				wait for 200 ns;
				
				assert (result_somador = result_golden) report "Falhou: i = " & integer'image(i) &
				" j = " & integer'image(j) severity ERROR;
				
				contador2 := contador2 + 1;
				
			end loop;
			
			contador1 := contador1 + 1;
			
		end loop;
		
		report "-----Teste finalizado-----" severity NOTE;
		
		wait;
		
	end process;
end arch;

