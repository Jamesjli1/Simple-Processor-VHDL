library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU2 is
    port(
        Clock : in std_logic;                              -- input clock signal
        A, B : in unsigned(7 downto 0);                    -- 8-bit inputs from latches A and B
        student_id : in unsigned(3 downto 0);              -- 4-bit student id from FSM
        OP0 : in unsigned(3 downto 0);                     -- 16-bit selector for operation from Decoder
		  OP1 : in unsigned(3 downto 0);
		  OP2 : in unsigned(3 downto 0);
		  OP3 : in unsigned(3 downto 0);
        Neg : out std_logic;                               
        R1 : out unsigned(3 downto 0);                     -- lower 4 bits of 8-bit result output
        R2 : out unsigned(3 downto 0)                      -- higher 4 bits of 8-bit result output
    );
end ALU2;

architecture calculation of ALU2 is
    -- Temporary signal declarations
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
    signal Reg4 : unsigned(0 to 7);
	 signal OP : unsigned(15 downto 0);
begin
    Reg1 <= A;
    Reg2 <= B;
	 OP <= OP3 & OP2 & OP1 & OP0;

    process(Clock)
    begin
        if rising_edge(Clock) then
            case OP is

                -- 1) Rotate A right by 4 bits
                when "0000000000000001" =>
                    Result <= Reg1(3 downto 0) & Reg1(7 downto 4);
                    Neg <= '0';

                -- 2) XOR A and B
                when "0000000000000010" =>
                    Result <= Reg1 XOR Reg2;
                    Neg <= '0';

                -- 3) Reverse bit order of B
                when "0000000000000100" =>
                    Result(7) <= Reg2(0);
                    Result(6) <= Reg2(1);
                    Result(5) <= Reg2(2);
                    Result(4) <= Reg2(3);
                    Result(3) <= Reg2(4);
                    Result(2) <= Reg2(5);
                    Result(1) <= Reg2(6);
                    Result(0) <= Reg2(7);
                    Neg <= '0';

                -- 4) A + B - 2
                when "0000000000001000" =>
                    Result <= (Reg1 + Reg2) - 2;
                    Neg <= '0';

                -- 5) Rotate B left by 2
                when "0000000000010000" =>
                    Result <= Reg2(5 downto 0) & Reg2(7 downto 6);
                    Neg <= '0';

                -- 6) Invert even bits of B
                when "0000000000100000" =>
                    Result <= Reg2;
                    Result(0) <= NOT Reg2(0);
                    Result(2) <= NOT Reg2(2);
                    Result(4) <= NOT Reg2(4);
                    Result(6) <= NOT Reg2(6);
                    Neg <= '0';

                -- 7) Swap lower 4 bits of B with A
                when "0000000001000000" =>
                    Result <= (Reg2(3 downto 0) & Reg1(3 downto 0));
                    Neg <= '0';

                -- 8) Shift B right by 2 (fill with 0)
                when "0000000010000000" =>
                    Result <= ("00" & Reg2(7 downto 2));
                    Neg <= '0';

                -- 9) Invert lower four bits of A
                when "0000000100000000" =>
                    Result(7 downto 4) <= Reg1(7 downto 4);
                    Result(3 downto 0) <= NOT Reg1(3 downto 0);
                    Neg <= '0';

                when others =>
                    Result <= Result;

            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);

end calculation;


