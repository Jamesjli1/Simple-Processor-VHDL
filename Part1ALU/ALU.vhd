library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port(
        Clock : in std_logic;                              -- input clock signal
        A, B : in unsigned(7 downto 0);                    -- 8-bit inputs from latches A and B
        student_id : in unsigned(3 downto 0);              -- 4-bit student id from FSM
       OP0 : in unsigned(3 downto 0);                             -- 16-bit selector for operation from Decoder
          OP1 : in unsigned(3 downto 0); 
          OP2 : in unsigned(3 downto 0); 
          OP3 : in unsigned(3 downto 0); 
        Neg : out std_logic;                               -- is the result negative? Set-ve bit output
        R1 : out unsigned(3 downto 0);                     -- lower 4 bits of 8-bit result output
        R2 : out unsigned(3 downto 0)                      -- higher 4 bits of 8-bit result output
    );
end ALU;

architecture calculation of ALU is
    -- Temporary signal declarations
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
    signal Reg4 : unsigned(0 to 7);
	 signal OP : unsigned (15 downto 0);
begin
    Reg1 <= A;  -- temporarily store A in Reg1 local variable
    Reg2 <= B;  -- temporarily store B in Reg2 local variable
	OP <= OP3 & OP2 & OP1 & OP0;
    process(Clock)
	 
    begin
		 
		  
        if rising_edge(Clock) then  -- do the calculation @ positive edge of clock cycle
            case OP is
                when "0000000000000001" => 
                    -- Do Addition for Reg1 and Reg2
                        Result <= Reg1 + Reg2;
                        Neg <= '0';
                        


                when "0000000000000010" => 
                    -- Do Subtraction; "Neg" bit set if required
                        if (Reg1 >= Reg2) then
                            Neg <= '0';
                            Result <= Reg1 - Reg2;
                        else
                            Neg <= '1';               -- set neg flag if A < B
                            Result <= Reg2 - Reg1;    -- still show positive magnitude
                        end if;

                when "0000000000000100" => 
                    -- Do Inverse
                          Neg <= '0';
                            Result <= NOT Reg1;
                            

                when "0000000000001000" => 
                    -- Do Boolean NAND
                            Neg <= '0';
                            Result <= NOT (Reg1 AND Reg2);

                when "0000000000010000" => 
                    -- Do Boolean NOR
                        Neg <= '0';
                        Result <= NOT (Reg1 OR Reg2);
                        

                when "0000000000100000" => 
                    -- Do Boolean AND
                            Neg <= '0';
                            Result <= Reg1 AND Reg2;
                            

                when "0000000001000000" => 
                    -- Do Boolean OR
                            Neg <= '0';
                            Result <= Reg1 OR Reg2;
                            

                when "0000000010000000" => 
                    -- Do Boolean XOR
                            Neg <= '0';
                            Result <= Reg1 XOR Reg2;
                            

                when "0000000100000000" => 
                    -- Do Boolean XNOR
                            Neg <= '0';
                            Result <= Reg1 XNOR Reg2;
                            

                when others => 
                    -- Don’t care, do nothing
                    Result <= Result;
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);     -- lower 4 bits (for 7-seg display)
    R2 <= Result(7 downto 4);     -- higher 4 bits (for 7-seg display)
end calculation;










