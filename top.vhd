

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



entity sklop is
	port(	
		
		--clk12M	: in std_logic; --27M clock
--		--SCK		: in std_logic; --serial clock
--		--CSn		: in std_logic; --device select
--		--MOSI	: in std_logic; --serial Data input
		
		rst		: in std_logic;
		detectors	: in std_logic_vector(2 downto 0);
		
		oclk		: out std_logic;
		owakeup		: out std_logic;
		omatch		: out std_logic;
		
		--heartbeat	: out std_logic; --Debug
		--MISO		: out std_logic; --serial Data output
		REDn		: out std_logic; --Red
		BLUn		: out std_logic; --Blue
		GRNn		: out std_logic; --Green
		IR_LEDn		: out std_logic --IR/torch LED output
		
		--BARCODEn	: out std_logic  -- New Barcode LED - JC TEST
		
		);
end sklop;



architecture RTL of sklop is
	
	signal izlaz : std_logic;
	signal gori : std_logic;
	
	signal sclk : std_logic;
	
	
	COMPONENT  SB_LFOSC   
		port(
			CLKLF : out std_logic;
			CLKLFEN  :in std_logic;
			CLKLFPU : in std_logic
			);
	end COMPONENT;
	
	
	
begin  ------------------------------------------------------------
	
	
	--sclk <= '0';
	-- niskofrekvencijski (10khz) izvor takta
	KLOK: SB_LFOSC
	port map (
		CLKLF => sclk,
		CLKLFEN => '1',
		CLKLFPU => '1'
	);

	
	-------------------------------------------------------
	
	
	
end architecture RTL;


