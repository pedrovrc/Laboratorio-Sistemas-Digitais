library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador10 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        rci : in STD_LOGIC;
        load : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Q : out STD_LOGIC_VECTOR(3 downto 0);
        rco : out STD_LOGIC );
end contador10;

architecture contador10_arch of contador10 is
	type estado is (ZERO, UM, DOIS, TRES, QUATRO,
						 CINCO, SEIS, SETE, OITO, NOVE);
	signal EstadoAtual, ProxEstado, CarregaEstado: estado;

begin

	with D select
		CarregaEstado <= ZERO when "0000",
							  UM when "0001",
							  DOIS when "0010",
							  TRES when "0011",
							  QUATRO when "0100",
							  CINCO when "0101",
							  SEIS when "0110",
							  SETE when "0111",
							  OITO when "1000",
							  NOVE when "1001",
							  ZERO when others;

	ProcSinc: process(clock)
	begin
		if rising_edge(clock) then
			EstadoAtual <= ProxEstado;
		end if;
	end process ProcSinc;
	
	ProcComb: process(EstadoAtual, reset, enable, rci, load, CarregaEstado)
	begin
		case EstadoAtual is
			
			when ZERO =>
				Q <= "0000";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= UM;
				else ProxEstado <= ZERO;
				end if;
				
			when UM =>
				Q <= "0001";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= DOIS;
				else ProxEstado <= UM;
				end if;
				
			when DOIS =>
				Q <= "0010";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= TRES;
				else ProxEstado <= DOIS;
				end if;
				
			when TRES =>
				Q <= "0011";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= QUATRO;
				else ProxEstado <= TRES;
				end if;
				
			when QUATRO =>
				Q <= "0100";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= CINCO;
				else ProxEstado <= QUATRO;
				end if;
				
			when CINCO =>
				Q <= "0101";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= SEIS;
				else ProxEstado <= CINCO;
				end if;
				
			when SEIS =>
				Q <= "0110";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= SETE;
				else ProxEstado <= SEIS;
				end if;
				
			when SETE =>
				Q <= "0111";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= OITO;
				else ProxEstado <= SETE;
				end if;
				
			when OITO =>
				Q <= "1000";
				rco <= '1';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= NOVE;
				else ProxEstado <= OITO;
				end if;
				
			when NOVE =>
				Q <= "1001";
				rco <= '0';
				if reset = '1' then ProxEstado <= ZERO;
				elsif load = '1' then ProxEstado <= CarregaEstado;
				elsif not(enable) = '1' and not(rci) = '1' then ProxEstado <= ZERO;
				else ProxEstado <= NOVE;
				end if;
				
		end case;
	end process ProcComb;
end contador10_arch;


