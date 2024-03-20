
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

--Convertorul functioneaza pe baza unui MUX 4:1

entity Convertor is
    Port(
    x : in	STD_LOGIC_VECTOR (5 downto 0);
	sel : in	STD_LOGIC_VECTOR (1 downto 0);
	m : out	STD_LOGIC_VECTOR (7 downto 0)
	);
end Convertor;

architecture Behavioral of Convertor is
    Signal m_output: STD_LOGIC_VECTOR(7 downto 0);
	begin
		m <= m_output;
		process(x, sel)
		begin
		
		case sel is
		  when "00" => --I0
		      m_output(7) <= '0';
		      m_output(6) <= '0';
		      m_output(5) <= x(5);
		      m_output(4) <= x(5) xor x(4);
		      m_output(3) <= x(4) xor x(3);
		      m_output(2) <= x(3) xor x(2);
		      m_output(1) <= x(2) xor x(1);
		      m_output(0) <= x(1) xor x(0);
		      
		 when "01" => --I1
		      m_output(7) <= '0';
		      m_output(6) <= '1';
		      m_output(5) <= not x(5);
		      m_output(4) <= x(5) xor x(4);
		      m_output(3) <= x(4) xor x(3);
		      m_output(2) <= x(3) xor x(2);
		      m_output(1) <= x(2) xor x(1);
		      m_output(0) <= x(1) xor x(0);
		      
		 when "10" => --I2
		      m_output(7) <= '1';
		      m_output(6) <= '1';
		      m_output(5) <= x(5);
		      m_output(4) <= x(5) xor x(4);
		      m_output(3) <= x(4) xor x(3);
		      m_output(2) <= x(3) xor x(2);
		      m_output(1) <= x(2) xor x(1);
		      m_output(0) <= x(1) xor x(0);
		      
		 when "11" => --I3
		      m_output(7) <= '1';
		      m_output(6) <= '0';
		      m_output(5) <= not x(5);
		      m_output(4) <= x(5) xor x(4);
		      m_output(3) <= x(4) xor x(3);
		      m_output(2) <= x(3) xor x(2);
		      m_output(1) <= x(2) xor x(1);
		      m_output(0) <= x(1) xor x(0);
		end case;
		
		end process;

	end Behavioral;
