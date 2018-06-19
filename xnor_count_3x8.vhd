

--	Made by: Ante Ore�kovi� - 2017
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
		KERNERL_ROW_1:	std_logic_vector(7 downto 0) := B"11111111";
		KERNERL_ROW_2:	std_logic_vector(7 downto 0) := B"11111111";
		KERNERL_ROW_3:	std_logic_vector(7 downto 0) := B"11111111"
    );
    port (
		clk:	in std_logic;
        input1: in std_logic;
        input2: in std_logic;
        input3: in std_logic;
        output: out std_logic
    );
end;

architecture behavior of xnor_count_3x8 is


    signal bitcount1 : integer := 0;
    signal bitcount2 : integer := 0;
    signal bitcount3 : integer := 0;

    signal total : integer;

    function bitcount(s : std_logic_vector) return integer is
        variable temp : natural := 0;
    begin
        for i in s'range loop
            if s(i) = '1' then temp := temp + 1; 
            end if;
        end loop;

        return temp;
    end function bitcount;

    signal row1 : std_logic_vector(7 downto 0) := B"00000000";
    signal row2 : std_logic_vector(7 downto 0) := B"00000000";
    signal row3 : std_logic_vector(7 downto 0) := B"00000000";

    signal result1 : std_logic_vector(7 downto 0);
    signal result2 : std_logic_vector(7 downto 0);
    signal result3 : std_logic_vector(7 downto 0);

begin

    in1:
        process(clk)
        begin
            if (rising_edge(clk)) then
                row1 <=  input1 & row1(7 downto 1);
            end if;
        end process;

    in2:
        process(clk)
        begin
            if (rising_edge(clk)) then
                row2 <=  input2 & row2(7 downto 1);
            end if;
        end process;

    in3:
        process(clk)
        begin
            if (rising_edge(clk)) then
                row3 <=  input3 & row2(7 downto 1);
            end if;
        end process;
    
    
    result1 <= KERNERL_ROW_1 xnor row1;
    result2 <= KERNERL_ROW_2 xnor row2;
    result3 <= KERNERL_ROW_3 xnor row3;


    count1:
        process(clk)
        begin
        if rising_edge(clk) then
            bitcount1 <= bitcount(result1);
        end if;
        end process;

    count2:
        process(clk)
        begin
        if (rising_edge(clk)) then
            bitcount2 <= bitcount(result2);
        end if;
        end process;

    count3:
        process(clk)
        begin
        if (rising_edge(clk)) then
            bitcount3 <= bitcount(result1);
        end if;
        end process;

    total <= bitcount1 + bitcount2 + bitcount3;

    output_result:
        process(clk)
            begin
            if (rising_edge(clk)) then
                if total > 18 then
                    output <= '1';
                else
                    output <= '0';
                end if;
            end if;
        end process;
        
end;