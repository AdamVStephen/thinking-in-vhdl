    ----------------------------------------------------------------------------------
    -- Company: UKAEA
    -- Engineer: Adam Stephen
    -- 
    -- Create Date: 05/21/2023 11:42:59 AM
    -- Design Name: 
    -- Module Name: Decoder_3_to_8_tb - Behavioral
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
    
    entity Decoder_3_to_8_tb is
    --  Port ( );
    end Decoder_3_to_8_tb;
    
    architecture Behavioral of Decoder_3_to_8_tb is
    
    component Decoder_3_to_8 is
    Port ( 
        D_IN: in std_logic_vector(2 downto 0);
        F_OUT: out std_logic_vector(7 downto 0)
    );
    end component;
    
    
    constant TIME_DELTA : time := 10ns;
    
    signal D_IN_tb :std_logic_vector(2 downto 0);
    
    signal F_OUT_tb : std_logic_vector(7 downto 0);
    
    begin
    
    dut: Decoder_3_to_8 
    port map (
    D_IN => D_IN_tb,
    F_OUT => F_OUT_tb
    );
    
    simulation: process
    
    procedure tb_checker(
    constant param1: std_logic_vector(2 downto 0);
    constant expected_result: std_logic_vector(7 downto 0)
    ) is
    variable result: std_logic_vector(7 downto 0);
    begin
        D_IN_tb <= param1;
        wait for TIME_DELTA;
        result := F_OUT_tb;
        -- Make sure file type is VHDL 2008 or this will not compile.
        assert result = expected_result report 
            "Result is: " & to_hstring(result) & 
            " Expected value was: " & to_hstring(expected_result);
        --assert result = expected_result report "Failure " &to_hstring(expected_result); 
    end procedure;
    
    begin
    tb_checker("000", "00000001");
    tb_checker("001", "00000010");
    tb_checker("010", "00000100");
    tb_checker("011", "00001000");
    tb_checker("100", "00010000");
    tb_checker("101", "00100000");
    tb_checker("110", "01000000");
    tb_checker("111", "10000000");
    wait;
    
--    D_IN_tb <= "000";
--    wait for TIME_DELTA;
--    D_IN_tb <= "001";
--    wait for TIME_DELTA;
--    D_IN_tb <= "010";
--    wait for TIME_DELTA;
--    D_IN_tb <= "011";
--    wait for TIME_DELTA;
--    D_IN_tb <= "100";
--    wait for TIME_DELTA;
--    D_IN_tb <= "101";
--    wait for TIME_DELTA;
--    D_IN_tb <= "110";
--    wait for TIME_DELTA;
--    D_IN_tb <= "111";
--    wait for TIME_DELTA;
    
    end process simulation;
    
    
    end Behavioral;
