----------------------------------------------------------------------------------
-- Company: UKAEA
-- Engineer: Adam Stephen
-- 
-- Create Date: 05/21/2023 11:03:06 AM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder_3_to_8 is
Port ( 
    D_IN: in std_logic_vector(2 downto 0);
    F_OUT: out std_logic_vector(7 downto 0)
);
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

begin
with D_IN select
F_OUT <= "00000001" when "000",
         "00000010" when "001",
         "00000100" when "010",
         "00001000" when "011",
         "00010000" when "100",
         "00100000" when "101",
         "01000000" when "110",
         "10000000" when "111",
         "00000001" when others;

end Behavioral;
