library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU3 is
    port(
        Clock      : in std_logic;
        A, B       : in unsigned(7 downto 0);
        student_id : in unsigned(3 downto 0);
        OP0         : in unsigned(3 downto 0);
		  OP1         : in unsigned(3 downto 0);
		  OP2         : in unsigned(3 downto 0);
		  OP3         : in unsigned(3 downto 0);
        Result     : out unsigned(3 downto 0)       -- outputs 1010 for y, 1011 for n
    );
end ALU3;

architecture Behavior of ALU3 is
    signal tensB : unsigned(3 downto 0);
    signal onesB : unsigned(3 downto 0);
	 signal reg1 : unsigned(3 downto 0);
begin

    tensB <= B(7 downto 4);
    onesB <= B(3 downto 0);
	 reg1 <= student_id;

    process(Clock)
    begin
        if rising_edge(Clock) then

            -- same result for all OP codes, as logic is identical
            if (tensB > reg1) or (onesB > reg1) then
                Result <= "1010";   -- y
            else
                Result <= "1011";   -- n
            end if;

        end if;
    end process;

end Behavior;
