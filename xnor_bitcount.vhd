

--	Made by: Ante Oreškoviæ - 2017
--	For use on Lattice iCE40UL development board
--	


library ice;   
use ice.all;
library IEEE;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_signed.all;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity xnor_count_3x8 is
    generic (
		SIGNAL_LENGTH:		integer := 32,;
		KERNERL_ROW_1:	std_logic_vector(7 downto 0) := B"00000000";
		KERNERL_ROW_2:	std_logic_vector(7 downto 0) := B"00000000";
		KERNERL_ROW_3:	std_logic_vector(7 downto 0) := B"00000000"
    );
    port (
        input_1: in std_logic_vector;
        input_2: in std_logic_vector;
        input_3: in std_logic_vector;
        output: out std_logic_vector
    );
end;

architecture behavior of mux_4x1 is
begin
    
end;