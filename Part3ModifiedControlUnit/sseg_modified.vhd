LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg_modified IS
PORT (
    bcd: IN  std_logic_vector(3 downto 0);   -- comes from ALU3 Result
    leds : OUT std_logic_vector(1 to 7)  -- displays y or n
);
END sseg_modified;

ARCHITECTURE Behavior OF sseg_modified IS
BEGIN
    process(bcd)
    begin
        case bcd is

            when "1010" =>         -- y
                leds <= "1000100"; 

            when "1011" =>         -- n
                leds <= "1101010";

            when others =>
                leds <= "1111111"; -- blank

        end case;
    end process;

END Behavior;
