-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 19.6.2018 12:25:02 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_xnor_count_3x8 is
end tb_xnor_count_3x8;

architecture tb of tb_xnor_count_3x8 is

    component xnor_count_3x8
        port (clk    : in std_logic;
              input1 : in std_logic;
              input2 : in std_logic;
              input3 : in std_logic;
              output : out std_logic);
    end component;

    signal clk    : std_logic;
    signal input1 : std_logic;
    signal input2 : std_logic;
    signal input3 : std_logic;
    signal output : std_logic;

    constant TbPeriod : time := 1 ms; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : xnor_count_3x8
    port map (clk    => clk,
              input1 => input1,
              input2 => input2,
              input3 => input3,
              output => output);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        input1 <= '1';
        input2 <= '1';
        input3 <= '1';

        -- EDIT Add stimuli here
        wait for 20 * TbPeriod;
		
		input1 <= '0';
        input2 <= '0';
        input3 <= '0'; 
		
		wait for 20 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_xnor_count_3x8 of tb_xnor_count_3x8 is
    for tb
    end for;
end cfg_tb_xnor_count_3x8;