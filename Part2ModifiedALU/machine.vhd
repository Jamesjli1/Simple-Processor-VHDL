library ieee;
use ieee.std_logic_1164.all;

entity machine is
    port(
        clk : in std_logic;
        data_in: in std_logic;
        reset: in std_logic;
        student_id: out std_logic_vector(3 downto 0);
        current_state1: out std_logic_vector(1 downto 0);
		  current_state2: out std_logic;
		  current_state3: out std_logic
    );
end entity;

architecture fsm of machine is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
    signal yfsm : state_type;
	 signal current_state : std_logic_vector(3 downto 0);
begin

	current_state1 <= current_state(1 downto 0);
	current_state2 <= current_state(2);
	current_state3 <= current_state(3);


    process (clk, reset)
    begin
        if reset = '1' then
            yfsm <= s0;
        elsif (clk'event and clk = '1') then
            if data_in = '1' then
                case yfsm is
                    when s0 => yfsm <= s1;
                    when s1 => yfsm <= s2;
                    when s2 => yfsm <= s3;
                    when s3 => yfsm <= s4;
                    when s4 => yfsm <= s5;
                    when s5 => yfsm <= s6;
                    when s6 => yfsm <= s7;
                    when s7 => yfsm <= s8;
                    when s8 => yfsm <= s0;
                    when others => yfsm <= s0;
                end case;
            else
                yfsm <= yfsm;
            end if;
        end if;
    end process;

    process (yfsm)
    begin
        case yfsm is
            when s0 =>
                student_id <= "0101";    -- 5
                current_state <= "0000"; -- 0

            when s1 =>
                student_id <= "0000";    -- 0
                current_state <= "0001"; -- 1

            when s2 =>
                student_id <= "0001";    -- 1
                current_state <= "0010"; -- 2

            when s3 =>
                student_id <= "0011";    -- 3
                current_state <= "0011"; -- 3

            when s4 =>
                student_id <= "0001";    -- 1
                current_state <= "0100"; -- 4

            when s5 =>
                student_id <= "1001";    -- 9
                current_state <= "0101"; -- 5

            when s6 =>
                student_id <= "1000";    -- 8
                current_state <= "0110"; -- 6

            when s7 =>
                student_id <= "0110";    -- 6
                current_state <= "0111"; -- 7

            when s8 =>
                student_id <= "0100";    -- 4
                current_state <= "1000"; -- 8

            when others =>
                student_id <= "1110";    -- E for error
                current_state <= "1110";
        end case;
    end process;

end architecture;
