library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MaquinaRefri is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           clock : in  STD_LOGIC;
           refri, quarto, metade : out  STD_LOGIC);
end MaquinaRefri;

architecture arch of MaquinaRefri is
	type estado is (INIT,
						 C25, C50, C75, C100, C125,	-- C = Coletou
						 D25, D50, D75);					-- D = Devolve
	signal EstadoAtual, ProxEstado: estado;

begin
	ProcSinc: process(clock)	-- memoria de estados
	begin
		if rising_edge(clock) then
			EstadoAtual <= ProxEstado;
		end if;
	end process ProcSinc;
	
	ProcComb: process(EstadoAtual, a)	-- logica de saida e estado seguinte
	begin
		case EstadoAtual is
			when INIT =>
				refri <= '0';
				quarto <= '0';
				metade <= '0';
				if a = "00" or a = "11" then
					ProxEstado <= INIT;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;

			when C25 =>
				refri <= '0';
				quarto <= '0';
				metade <= '0';
				if a = "00" then
					ProxEstado <= INIT;
				elsif a = "11" then
					ProxEstado <= D25;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;
				
			when C50 =>
				refri <= '0';
				quarto <= '0';
				metade <= '0';
				if a = "00" then
					ProxEstado <= INIT;
				elsif a = "11" then
					ProxEstado <= D50;
				elsif a = "01" then
					ProxEstado <= C75;
				else
					ProxEstado <= C100;
				end if;
				
			when C75 =>
				refri <= '0';
				quarto <= '0';
				metade <= '0';
				if a = "00" then
					ProxEstado <= INIT;
				elsif a = "11" then
					ProxEstado <= D75;
				elsif a = "01" then
					ProxEstado <= C100;
				else
					ProxEstado <= C125;
				end if;
				
			when C100 =>
				refri <= '1';
				quarto <= '0';
				metade <= '0';
				if a = "00" or a = "11" then
					ProxEstado <= INIT;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;
				
			when C125 =>
				refri <= '1';
				quarto <= '1';
				metade <= '0';
				if a = "00" or a = "11" then
					ProxEstado <= INIT;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;
				
			when D25 =>
				refri <= '0';
				quarto <= '1';
				metade <= '0';
				if a = "00" or a = "11" then
					ProxEstado <= INIT;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;
				
			when D50 =>
				refri <= '0';
				quarto <= '0';
				metade <= '1';
				if a = "00" or a = "11" then
					ProxEstado <= INIT;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;
				
			when D75 =>
				refri <= '0';
				quarto <= '1';
				metade <= '1';
				if a = "00" or a = "11" then
					ProxEstado <= INIT;
				elsif a = "01" then
					ProxEstado <= C25;
				else
					ProxEstado <= C50;
				end if;
				
		end case;
	end process;									  
end arch;

