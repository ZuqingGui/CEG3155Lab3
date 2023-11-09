library ieee;
use  ieee.std_logic_1164.all;

ENTITY dec_7seg IS
	PORT(i_hexDigit	: IN STD_LOGIC_VECTOR(3 downto 0);
	     o_segment_a, o_segment_b, o_segment_c, o_segment_d, o_segment_e, 
	     o_segment_f, o_segment_g : OUT STD_LOGIC);
END dec_7seg;

ARCHITECTURE rtl OF dec_7seg IS
	SIGNAL int_segment_data : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
	PROCESS  (i_hexDigit)
	BEGIN
        CASE i_hexDigit IS
            -- Mapping from hex digit to the segments (0-15)
            -- Here we assume a common cathode display, where '1' turns the segment ON
            WHEN "0000" => int_segment_data <= "0000001"; -- 0
            WHEN "0001" => int_segment_data <= "1001111"; -- 1
            WHEN "0010" => int_segment_data <= "0010010"; -- 2
            WHEN "0011" => int_segment_data <= "0000110"; -- 3
            WHEN "0100" => int_segment_data <= "1001100"; -- 4
            WHEN "0101" => int_segment_data <= "0100100"; -- 5
            WHEN "0110" => int_segment_data <= "0100000"; -- 6
            WHEN "0111" => int_segment_data <= "0001111"; -- 7
            WHEN "1000" => int_segment_data <= "0000000"; -- 8
            WHEN "1001" => int_segment_data <= "0000100"; -- 9
				
            WHEN "1010" => int_segment_data <= "0000001"; -- A-should show 0 when it reach 10
            WHEN "1011" => int_segment_data <= "1001111"; -- B
            WHEN "1100" => int_segment_data <= "0010010"; -- C
            WHEN "1101" => int_segment_data <= "0000110"; -- D
            WHEN "1110" => int_segment_data <= "1001100"; -- E
            WHEN "1111" => int_segment_data <= "0100100"; -- F
				
            WHEN OTHERS => int_segment_data <= "1111111"; -- Default case
        END CASE;
	END PROCESS;

-- LED driver is inverted
o_segment_a <= NOT int_segment_data(6);
o_segment_b <= NOT int_segment_data(5);
o_segment_c <= NOT int_segment_data(4);
o_segment_d <= NOT int_segment_data(3);
o_segment_e <= NOT int_segment_data(2);
o_segment_f <= NOT int_segment_data(1);
o_segment_g <= NOT int_segment_data(0);

END rtl;

