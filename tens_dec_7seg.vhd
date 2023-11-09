library ieee;
use ieee.std_logic_1164.all;

ENTITY tens_dec_7seg IS
    PORT(i_hexDigit : IN STD_LOGIC_VECTOR(3 downto 0);
         o_segment_a, o_segment_b, o_segment_c, o_segment_d,
         o_segment_e, o_segment_f, o_segment_g : OUT STD_LOGIC);
END tens_dec_7seg;

ARCHITECTURE rtl OF tens_dec_7seg IS
    SIGNAL int_segment_data : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
	PROCESS  (i_hexDigit)
	BEGIN
        CASE i_hexDigit IS
            -- Mapping from hex digit to the segments (0-15)
            -- Here we assume a common cathode display, where '1' turns the segment ON
            WHEN "0000" => int_segment_data <= "0000001"; -- 0 show 0 until 10
            WHEN "0001" => int_segment_data <= "0000001"; -- 1
            WHEN "0010" => int_segment_data <= "0000001"; -- 2
            WHEN "0011" => int_segment_data <= "0000001"; -- 3
            WHEN "0100" => int_segment_data <= "0000001"; -- 4
            WHEN "0101" => int_segment_data <= "0000001"; -- 5
            WHEN "0110" => int_segment_data <= "0000001"; -- 6
            WHEN "0111" => int_segment_data <= "0000001"; -- 7
            WHEN "1000" => int_segment_data <= "0000001"; -- 8
            WHEN "1001" => int_segment_data <= "0000001"; -- 9
				
            WHEN "1010" => int_segment_data <= "1001111"; -- A should show 1 until 15
            WHEN "1011" => int_segment_data <= "1001111"; -- B
            WHEN "1100" => int_segment_data <= "1001111"; -- C
            WHEN "1101" => int_segment_data <= "1001111"; -- D
            WHEN "1110" => int_segment_data <= "1001111"; -- E
            WHEN "1111" => int_segment_data <= "1001111"; -- F
				
            WHEN OTHERS => int_segment_data <= "1111111"; -- Default case
        END CASE;
	END PROCESS;
    -- Assign the decoded signals to the outputs
    o_segment_a <= int_segment_data(6);
    o_segment_b <= int_segment_data(5);
    o_segment_c <= int_segment_data(4);
    o_segment_d <= int_segment_data(3);
    o_segment_e <= int_segment_data(2);
    o_segment_f <= int_segment_data(1);
    o_segment_g <= int_segment_data(0);
END rtl;
