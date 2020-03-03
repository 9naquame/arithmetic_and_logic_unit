--***********************************************************************
--
--
--
--***********************************************************************

-- Entity and arcitecture for NAND-GATE
-- Used as the base for all the various components
entity alu_nand_gate is 
	port(A, B: in bit; Y : out bit);
end entity;

architecture alu_nand_gate_desgin of alu_nand_gate is
	begin
		Y <= not (A and B);
end architecture;



-- Entity and architecture of a NOT-GATE based on alu_nand_gate entity (NAND-GATE)
entity alu_not_gate is
	port(X : in bit; Y : out bit);
end entity;

architecture alu_not_gate_desgin of alu_not_gate is
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	begin
		OUTPUT : alu_nand_gate port map (X, X, Y);
end architecture;



-- Entity and architecture of a OR-GATE based on alu_nand_gate entity (NAND-GATE)
entity alu_or_gate is
	port (A, B : in bit; Y : out bit);
end entity;

architecture alu_or_gate_design of alu_or_gate is
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal A_BAR, B_BAR : bit;
	
	begin
		A_NOT : alu_nand_gate port map (A, A, A_BAR);
		B_NOT : alu_nand_gate port map (B, B, B_BAR);
		OUTPUT : alu_nand_gate port map (A_BAR, B_BAR, Y);
end architecture;



-- Entity and architecture of a AND-GATE based on alu_nand_gate entity (NAND-GATE)
entity alu_and_gate is
	port (A, B : in bit; Y : out bit);
end entity;

architecture alu_and_gate_design of alu_and_gate is
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal AB_BAR : bit;
	
	begin
		AB_NOT : alu_nand_gate port map (A, B, AB_BAR);
		OUTPUT : alu_nand_gate port map (AB_BAR, AB_BAR, Y);
end architecture;



-- Entity and architecture of a XOR-GATE based on alu_nand_gate entity (NAND-GATE)
entity alu_xor_gate is
	port (A, B : in bit; Y : out bit);
end entity;

architecture alu_xor_gate_design of alu_xor_gate is
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal AB_BAR, A_AB_BAR, B_AB_BAR : bit;
	
	begin
		AB_NOT : alu_nand_gate port map (A, B, AB_BAR);
		A_AB_NOT : alu_nand_gate port map (A, AB_BAR, A_AB_BAR);
		B_AB_NOT : alu_nand_gate port map (B, AB_BAR, B_AB_BAR);
		OUTPUT : alu_nand_gate port map (A_AB_BAR, B_AB_BAR, Y);
end architecture;



-- Entity and architecture of a NOR-GATE.
-- Based on alu_nand_gate entity (NAND-GATE) and alu_or_gate (OR-GATE) as COMPONENTs
entity alu_nor_gate is
	port (A, B : in bit; Y : out bit);
end entity;

architecture alu_nor_gate_design of alu_nor_gate is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal C : bit;
	
	begin
		OR_OUT : alu_or_gate port map (A, B, C);
		OUTPUT : alu_nand_gate port map (C, C, Y);
end architecture;



-- Entity and architecture of a XNOR-GATE.
-- Using alu_nand_gate entity (NAND-GATE) and alu_xor_gate (XOR-GATE) as COMPONENTS
entity alu_xnor_gate is
	port (A, B : in bit; Y : out bit);
end entity;

architecture alu_xnor_gate_design of alu_xnor_gate is
	component alu_xor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal C : bit;
	
	begin
		OR_OUT : alu_xor_gate port map (A, B, C);
		OUTPUT : alu_nand_gate port map (C, C, Y);
end architecture;



-- Entity and architecture of a OR-GATE based on alu_or_gate entity (OR-GATE)
entity alu_or_gate3 is
	port (A, B, C : in bit; Y : out bit);
end entity;

architecture alu_or_gate3_design of alu_or_gate3 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal A_B : bit;
	
	begin 	
		OR_A_B : alu_or_gate port map (A, B, A_B); 
		OUTPUT : alu_or_gate port map (A_B, C, Y);
end architecture;	



-- Entity and architecture of a 4-INPUT OR-GATE based on alu_or_gate entity (OR-GATE)
entity alu_or_gate4 is
	port (A, B, C, D : in bit; Y : out bit);
end entity;

architecture alu_or_gate4_design of alu_or_gate4 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal A_B, C_D : bit;
	
	begin
		OR_A_B : alu_or_gate port map (A, B, A_B);
		OR_C_D : alu_or_gate port map (C, D, C_D);  
		OUTPUT : alu_or_gate port map (A_B, C_D, Y);
end architecture;



-- Entity and architecture of a 5-INPUT OR-GATE.
-- Based on alu_or_gate (OR-GATE) and alu_or_gate4 (4-INPUT OR-GATE) entities
entity alu_or_gate5 is
	port (A, B, C, D, E : in bit; Y : out bit);
end entity;

architecture alu_or_gate5_design of alu_or_gate5 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_or_gate4
		port (A, B, C, D : in bit; Y : out bit);
	end component;
	
	signal A_B_C_D : bit;
	
	begin 
		OR_A_B_C_D : alu_or_gate4 port map (A, B, C, D, A_B_C_D);  
		OUTPUT : alu_or_gate port map (A_B_C_D, E, Y);
end architecture;



-- Entity and architecture of a 6-INPUT OR-GATE.
-- Based on alu_or_gate (OR-GATE) and alu_or_gate3 (3-INPUT OR-GATE) entities
entity alu_or_gate6 is
	port (A, B, C, D, E, F : in bit; Y : out bit);
end entity;

architecture alu_or_gate6_design of alu_or_gate6 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_or_gate3
		port (A, B, C : in bit; Y : out bit);
	end component;
	
	signal A_B_C, D_E_F : bit;
	
	begin 
		OR_A_B_C : alu_or_gate3 port map (A, B, C, A_B_C);  
		OR_D_E_F : alu_or_gate3 port map (D, E, F, D_E_F);  
		OUTPUT : alu_or_gate port map (A_B_C, D_E_F, Y);
end architecture;



-- Entity and architecture of a 7-INPUT OR-GATE.
-- Based on alu_or_gate (OR-GATE) and alu_or_gate6 (6-INPUT OR-GATE) entities
entity alu_or_gate7 is
	port (A, B, C, D, E, F, G : in bit; Y : out bit);
end entity;

architecture alu_or_gate7_design of alu_or_gate7 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_or_gate6
		port (A, B, C, D, E, F : in bit; Y : out bit);
	end component;
	
	signal A_B_C_D_E_F : bit;
	
	begin 
		OR_A_B_C_D_E_F : alu_or_gate6 port map (A, B, C, D, E, F, A_B_C_D_E_F);  
		OUTPUT : alu_or_gate port map (A_B_C_D_E_F, G, Y);
end architecture;



-- Entity and architecture of a 8-INPUT OR-GATE.
-- Based on alu_or_gate (OR-GATE) and alu_or_gate4 (4-INPUT OR-GATE) entities
entity alu_or_gate8 is
	port (A, B, C, D, E, F, G, H : in bit; Y : out bit);
end entity;

architecture alu_or_gate8_design of alu_or_gate8 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_or_gate4
		port (A, B, C, D : in bit; Y : out bit);
	end component;
	
	signal A_B_C_D, E_F_G_H : bit;
	
	begin 
		OR_A_B_C_D : alu_or_gate4 port map (A, B, C, D, A_B_C_D);  
		OR_E_F_G_H : alu_or_gate4 port map (E, F, G, H, E_F_G_H); 
		OUTPUT : alu_or_gate port map (A_B_C_D, E_F_G_H, Y);
end architecture;



-- Entity and architecture of a 16-INPUT OR-GATE.
-- Based on alu_or_gate (OR-GATE) and alu_or_gate8 (8-INPUT OR-GATE) entities
entity alu_or_gate16 is
	port (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P : in bit; Y : out bit);
end entity;

architecture alu_or_gate16_design of alu_or_gate16 is
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_or_gate8
		port (A, B, C, D, E, F, G, H: in bit; Y : out bit);
	end component;
	
	signal L1, L2 : bit;
	
	begin 
		OR_L1 : alu_or_gate8 port map (A, B, C, D, E, F, G, H, L1);  
		OR_L2 : alu_or_gate8 port map (I, J, K, L, M, N, O, P, L2); 
		OUTPUT : alu_or_gate port map (L1, L2, Y);
end architecture;



-- Entity and architecture of a 3-INPUT AND-GATE based on alu_nand_gate entity (NAND-GATE)
entity alu_and_gate3 is
	port (A, B, C : in bit; Y : out bit);
end entity;

architecture alu_and_gate3_design of alu_and_gate3 is
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal A_B : bit;
	
	begin 
	
	AND_A_B : alu_and_gate port map (A, B, A_B); 
	OUTPUT : alu_and_gate port map (A_B, C, Y);
end architecture;	



-- Entity and architecture of a 4-INPUT AND-GATE based on alu_nand_gate entity (NAND-GATE)
entity alu_and_gate4 is
	port (A, B, C, D : in bit; Y : out bit);
end entity;

architecture alu_and_gate4_design of alu_and_gate4 is
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal A_B, C_D : bit;
	
	begin 
	
	AND_A_B : alu_and_gate port map (A, B, A_B);
	AND_C_D : alu_and_gate port map (C, D, C_D);  
	OUTPUT : alu_and_gate port map (A_B, C_D, Y);
end architecture;



-- Entity and architecture of a 5-INPUT AND-GATE.
-- Using alu_and_gate (AND-GATE) and alu_and_gate4 (4-INPUT AND-GATE) as COMPONENTs
entity alu_and_gate5 is
	port (A, B, C, D, E : in bit; Y : out bit);
end entity;

architecture alu_and_gate5_design of alu_and_gate5 is
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	component alu_and_gate4
		port (A, B, C, D : in bit; Y : out bit);
	end component;
	
	signal A_B_C_D : bit;
	
	begin 
	
	AND_A_B_C_D : alu_and_gate4 port map (A, B, C, D, A_B_C_D);  
	OUTPUT : alu_and_gate port map (A_B_C_D, E, Y);
end architecture;



-- Entity and architecture of a 3-INPUT XOR-GATE based on alu_xor_gate entity (XOR-GATE)
entity alu_xor_gate3 is
	port (A, B, C : in bit; Y : out bit);
end entity;

architecture alu_xor_gate3_design of alu_xor_gate3 is
	component alu_xor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal A_B : bit;
	
	begin 
	
	XOR_A_B : alu_xor_gate port map (A, B, A_B); 
	OUTPUT : alu_xor_gate port map (A_B, C, Y);
end architecture;



-- Entity and architecture of a FULL-ADDER
-- COMPONENT list:
-- 	alu_xor_gate3 (3-INPUT XOR-GATE)
-- 	alu_or_gate3 (3-INPUT OR-GATE)
-- 	alu_and_gate (AND-GATE)
entity alu_adder is
	port(X, Y, CIN : in bit; SUM, COUT : out bit);
end entity;

architecture alu_adder_design of alu_adder is
	component alu_xor_gate3
		port (A, B, C: in bit; Y : out bit);
	end component;

	component alu_or_gate3
		port (A, B, C : in bit; Y : out bit);
	end component;

	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal X_Y, X_CIN, Y_CIN : bit;
	
	begin
		AND_X_Y : alu_and_gate port map (X, Y, X_Y);
		AND_X_CIN : alu_and_gate port map (X, CIN, X_CIN);
		AND_Y_CIN : alu_and_gate port map (Y, CIN, Y_CIN);
		
		OUTPUT_1 : alu_xor_gate3 port map (X, Y, CIN, SUM);
		OUTPUT_2 : alu_or_gate3 port map (X_Y, X_CIN, Y_CIN, COUT);
end architecture;



-- Entity and architecture of a 6-BIT RIPPLE-ADDER
-- COMPONENT: alu_adder (FULL-ADDER)
entity alu_adder6 is
	port (
		A, B : in bit_vector (5 downto 0); CIN : in bit;
		SUM : out bit_vector (5 downto 0); COUT : out bit
	); 
end entity;

architecture alu_adder6_design of alu_adder6 is
	component alu_adder
		port(X, Y, CIN : in bit; SUM, COUT : out bit);	
	end component;
	
	signal C : bit_vector (5 downto 1);
	
	begin
		ADD6_LSB : alu_adder port map (A(0), B(0), CIN, SUM(0), C(1));
		ADD6_MSB : alu_adder port map (A(5), B(5), C(5), SUM(5), COUT);
		
		GENERATED_ADDER6_VALUES : for i in 1 to 4 generate
			ADD6_OTHERS : alu_adder port map (A(i), B(i), C(i), SUM(i), C(i + 1));
		end generate;		
end architecture;



-- Entity and architecture of a 7-BIT RIPPLE-ADDER
-- COMPONENT: alu_adder (FULL-ADDER)
entity alu_adder7 is
	port (
		A, B : in bit_vector (6 downto 0); CIN : in bit;
		SUM : out bit_vector (6 downto 0); COUT : out bit
	); 
end entity;

architecture alu_adder7_design of alu_adder7 is
	component alu_adder
		port(X, Y, CIN : in bit; SUM, COUT : out bit);	
	end component;
	
	signal C : bit_vector (6 downto 1);
	
	begin
		ADD7_LSB : alu_adder port map (A(0), B(0), CIN, SUM(0), C(1));
		ADD7_MSB : alu_adder port map (A(6), B(6), C(6), SUM(6), COUT);
		
		GENERATED_ADDER7_VALUES : for i in 1 to 5 generate
			ADD7_OTHERS : alu_adder port map (A(i), B(i), C(i), SUM(i), C(i + 1));
		end generate;		
end architecture;



-- Entity and architecture of 32-BIT RIPPLE-ADDER
-- COMPONENT: alu_adder (FULL-ADDER)
entity alu_adder32 is
	port (
		A, B : in bit_vector (31 downto 0); CIN : in bit;
		SUM : out bit_vector (31 downto 0); COUT : out bit
	); 
end entity;

architecture alu_adder32_design of alu_adder32 is
	component alu_adder
		port(X, Y, CIN : in bit; SUM, COUT : out bit);	
	end component;
	
	signal C : bit_vector (31 downto 1);
	
	begin
		ADD32_LSB : alu_adder port map (A(0), B(0), CIN, SUM(0), C(1));
		ADD32_MSB : alu_adder port map (A(31), B(31), C(31), SUM(31), COUT);
		
		GENERATED_ADDER32_VALUES : for i in 1 to 30 generate
			ADD_OTHERS : alu_adder port map (A(i), B(i), C(i), SUM(i), C(i + 1));
		end generate;		
end architecture;



-- Entity and architecture of a 64-BIT RIPPLE-ADDER
-- COMPONENT: alu_adder (FULL-ADDER)
entity alu_adder64 is
	port (
		A, B : in bit_vector (63 downto 0); CIN : in bit;
		SUM : out bit_vector (63 downto 0); COUT : out bit
	); 
end entity;

architecture alu_adder64_design of alu_adder64 is
	component alu_adder
		port(X, Y, CIN : in bit; SUM, COUT : out bit);	
	end component;
	
	signal C : bit_vector (63 downto 1);
	
	begin
		ADD64_LSB : alu_adder port map (A(0), B(0), CIN, SUM(0), C(1));
		ADD64_MSB : alu_adder port map (A(63), B(63), C(63), SUM(63), COUT);
		
		GENERATED_ADDER64_VALUES : for i in 1 to 62 generate
			ADD_OTHERS : alu_adder port map (A(i), B(i), C(i), SUM(i), C(i + 1));
		end generate;		
end architecture;



-- Entity and architecture of a 64-BIT ONES-AND-ZEROS-COUNTER
-- COMPONENT: alu_adder7 (7-BIT RIPPLE-ADDER)
entity alu_ones_counter64 is
	port (X : in bit_vector (63 downto 0); ONES, ZEROS : out bit_vector (6 downto 0)); 
end entity;

architecture alu_ones_counter64_design of alu_ones_counter64 is
	type MATRIX is array (0 to 63) of bit_vector (6 downto 0) ;
	
	component alu_adder7
		port(A, B : in bit_vector (6 downto 0); CIN : in bit; SUM : out bit_vector (6 downto 0); COUT : out bit);	
	end component;
	
	signal A, B, C, D : MATRIX;
	
	begin
		GENERATED_MATRIX : for i in 0 to 63 generate
				A(i) <= "0000001" when X(i) = '1' else "0000000";
				B(i) <= "0000001" when X(i) = '0' else "0000000";					
		end generate;
		
		C(0) <= "0000000"; D(0) <= "0000000";
		ONES_LSB : alu_adder7 port map (A(0), C(0), '0', C(1));
		ONES_MSB : alu_adder7 port map (A(63), C(63), '0', ONES);
		
		ZEROS_LSB : alu_adder7 port map (B(0), D(0), '0', D(1));
		ZEROS_MSB : alu_adder7 port map (B(63), D(63), '0', ZEROS);
		
		GENERATED_ONES_VALUES : for i in 1 to 62 generate
			ONES_OTHERS : alu_adder7 port map (A(i), C(i), '0', C(i + 1));
			ZEROS_OTHERS : alu_adder7 port map (B(i), D(i), '0', D(i + 1));
		end generate;		
end architecture;



-- Entity and architecture of a 64-BIT PARITY CIRCUIT
-- COMPONENT: alu_xor_gate (XOR-GATE)
entity alu_parity64 is
	port (X : in bit_vector (63 downto 0); Y : out bit); 
end entity;

architecture alu_parity64_design of alu_parity64 is
	component alu_xor_gate
		port(A, B : in bit; Y : out bit);	
	end component;
	
	signal C : bit_vector (63 downto 1);
	
	begin
		XOR_LSB : alu_xor_gate port map (X(0), '0', C(1));
		XOR_MSB : alu_xor_gate port map (X(63), C(63), Y);
		
		GENERATED_XOR_VALUES : for i in 1 to 62 generate
			XOR_OTHERS : alu_xor_gate port map (X(i), C(i), C(i + 1));
		end generate;		
end architecture;



-- Entity and architecture of a 64-BIT SHIFT CIRCUIT
-- COMPONENT list:
--		alu_not_gate (NOT-GATE)
--		alu_or_gate (OR-GATE)
--		alu_and_gate3 (3-INPUT AND-GATE)
--		alu_and_gate (AND-GATE)
entity alu_shifter64 is
	port (
		X : in bit_vector (63 downto 0); S : in bit_vector (1 downto 0);
		Y : out bit_vector (63 downto 0)
	);
end entity;

architecture alu_shifter64_design of alu_shifter64 is
	type MATRIX is array (0 to 63) of bit_vector (1 downto 0) ;
	
	component alu_not_gate
		port (X : in bit; Y : out bit);
	end component;
	
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_and_gate3
		port (A, B, C : in bit; Y : out bit);
	end component;
	
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal C : MATRIX;
	signal S0_BAR : bit;
	
	begin
		S0_NOT : alu_not_gate port map (S(0), S0_BAR);
	
		SHIFT_LSB_L1 : alu_and_gate port map (S(0), X(1), C(0)(0));
		SHIFT_LSB_L2 : alu_and_gate3 port map (S(1), S0_BAR, X(63), C(0)(1));
		
		SHIFT_MSB_L1 : alu_and_gate port map (S0_BAR, X(62), C(63)(0));
		SHIFT_MSB_L2 : alu_and_gate3 port map (S(1), S(0), X(0), C(63)(1));
		
		
		SHIFT_LSB : alu_or_gate port map (C(0)(0), C(0)(1), Y(0));
		SHIFT_MSB : alu_or_gate port map (C(63)(0), C(63)(1), Y(63));
		
		GENERATED_SHIFT_VALUES : for i in 1 to 62 generate
			SHIFT_OTHERS_L1 : alu_and_gate port map (S0_BAR, X(i - 1), C(i)(0));
			SHIFT_OTHERS_L2 : alu_and_gate port map (S(0), X(i + 1), C(i)(1));
			
			SHIFT_OTHERS : alu_or_gate port map (C(i)(0), C(i)(1), Y(i));
		end generate;
end architecture;



-- Entity and architecture for a 16-TO-1 (16X1) MULTIPLEXER
-- COMPONENT list:
--		alu_not_gate (NOT-GATE)
--		alu_or_gate16 (16-INPUT OR-GATE)
--		alu_and_gate5 (5-INPUT AND-GATE)
entity alu_mutiplexer16 is
	port (
		D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15 : in bit;
		S3, S2, S1, S0 : in bit; Y : out bit
	);		
end entity;

architecture alu_mutiplexer16_design of alu_mutiplexer16 is
	component alu_not_gate
		port (X : in bit; Y : out bit);
	end component;
			
	component alu_or_gate16
		port (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P : in bit; Y : out bit);
	end component;
	
	component alu_and_gate5
		port (A, B, C, D, E : in bit; Y : out bit);
	end component;
	
	signal S3_BAR, S2_BAR, S1_BAR, S0_BAR : bit;
	signal A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P : bit;
	signal A_B_C_D_E_F_G_H, I_J_K_L_M_N_O_P : bit;
	
	begin
		S3_NOT : alu_not_gate port map (S3, S3_BAR);
		S2_NOT : alu_not_gate port map (S2, S2_BAR);
		S1_NOT : alu_not_gate port map (S1, S1_BAR);
		S0_NOT : alu_not_gate port map (S0, S0_BAR);
		
		LINE_A : alu_and_gate5 port map (S3_BAR, S2_BAR, S1_BAR, S0_BAR, D0, A);
		LINE_B : alu_and_gate5 port map (S3_BAR, S2_BAR, S1_BAR, S0, D1, B);
		LINE_C : alu_and_gate5 port map (S3_BAR, S2_BAR, S1, S0_BAR, D2, C);
		LINE_D : alu_and_gate5 port map (S3_BAR, S2_BAR, S1, S0, D3, D);
		LINE_E : alu_and_gate5 port map (S3_BAR, S2, S1_BAR, S0_BAR, D4, E);
		LINE_F : alu_and_gate5 port map (S3_BAR, S2, S1_BAR, S0, D5, F);		
		LINE_G : alu_and_gate5 port map (S3_BAR, S2, S1, S0_BAR, D6, G);		
		LINE_H : alu_and_gate5 port map (S3_BAR, S2, S1, S0, D7, H);		
		LINE_I : alu_and_gate5 port map (S3, S2_BAR, S1_BAR, S0_BAR, D8, I);		
		LINE_J : alu_and_gate5 port map (S3, S2_BAR, S1_BAR, S0, D9, J);		
		LINE_K : alu_and_gate5 port map (S3, S2_BAR, S1, S0_BAR, D10, K);
		LINE_L : alu_and_gate5 port map (S3, S2_BAR, S1, S0, D11, L);		
		LINE_M : alu_and_gate5 port map (S3, S2, S1_BAR, S0_BAR, D12, M);
		LINE_N : alu_and_gate5 port map (S3, S2, S1_BAR, S0, D13, N);		
		LINE_O : alu_and_gate5 port map (S3, S2, S1, S0_BAR, D14, O);		
		LINE_P : alu_and_gate5 port map (S3, S2, S1, S0, D15, P);
			
		OUTPUT : alu_or_gate16 port map (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Y);
end architecture;



--*********************************** DATAPATHS ***********************************



--Entity and architecture for extending 32-BIT to 64-BIT 
entity alu_extend64 is
	port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_extend64_design of alu_extend64 is
	begin
		Y <= "00000000000000000000000000000000" & X;
end architecture;



-- Entity and architecture for 32-BIT NOT-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_not_gate (NOT-GATE)
entity alu_not_gate32 is
	port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_not_gate32_design of alu_not_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_not_gate
		port (X : in bit; Y : out bit);
	end component;	
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_NOT_VALUES : for i in 0 to 31 generate
			NOT32_VALUES : alu_not_gate port map (X(i), Z(i));
		end generate;
		
		NOT32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 32-BIT OR-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_or_gate (OR-GATE)
entity alu_or_gate32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_or_gate32_design of alu_or_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_OR_VALUES : for i in 0 to 31 generate
			OR32_VALUES : alu_or_gate port map (A(i), B(i), Z(i));
		end generate;
		
		OR32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 32-BIT AND-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_and_gate (AND-GATE)
entity alu_and_gate32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_and_gate32_design of alu_and_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_AND_VALUES : for i in 0 to 31 generate
			AND32_VALUES : alu_and_gate port map (A(i), B(i), Z(i));
		end generate;
		
		AND32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 64-BIT AND-GATE
-- COMPONENT: alu_and_gate (AND-GATE)
entity alu_and_gate64 is
	port (A, B : in bit_vector (63 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_and_gate64_design of alu_and_gate64 is
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_AND_VALUES : for i in 0 to 63 generate
			AND32_VALUES : alu_and_gate port map (A(i), B(i), Y(i));
		end generate;
end architecture;



-- Entity and architecture for 32-BIT NAND-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_nand_gate (NAND-GATE)
entity alu_nand_gate32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_nand_gate32_design of alu_nand_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_NAND_VALUES : for i in 0 to 31 generate
			NAND32_VALUES : alu_nand_gate port map (A(i), B(i), Z(i));
		end generate;
		
		NAND32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 32-BIT NOR-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_nor_gate (NOR-GATE)
entity alu_nor_gate32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_nor_gate32_design of alu_nor_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_nor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_NOR_VALUES : for i in 0 to 31 generate
			NOR32_VALUES : alu_nor_gate port map (A(i), B(i), Z(i));
		end generate;
		
		NOR32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 32-BIT XOR-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_xor_gate (NOR-GATE)
entity alu_xor_gate32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_xor_gate32_design of alu_xor_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_xor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_XOR_VALUES : for i in 0 to 31 generate
			XOR32_VALUES : alu_xor_gate port map (A(i), B(i), Z(i));
		end generate;
		
		XOR32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 32-BIT XNOR-GATE
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_xnor_gate (XNOR-GATE)
entity alu_xnor_gate32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_xnor_gate32_design of alu_xnor_gate32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_xnor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	signal Z : bit_vector (31 downto 0);
	
	begin
		GENERATED_XNOR_VALUES : for i in 0 to 31 generate
			XNOR32_VALUES : alu_xnor_gate port map (A(i), B(i), Z(i));
		end generate;
		
		XNOR32_EXTEND : alu_extend64 port map (Z, Y);
end architecture;



-- Entity and architecture for 32-BIT COMPARATOR
-- COMPONENT list:
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_xnor_gate32 (32-BIT XNOR-GATE)
--		alu_not_gate32 (32-BIT NOT-GATE)
--		alu_and_gate64 (64-BIT AND-GATE)
entity alu_comparator32 is
	port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_comparator32_design of alu_comparator32 is	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_xnor_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_not_gate32
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_and_gate64
		port (A, B : in bit_vector (63 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	signal EQUAL, GREATER, A_IN, B_IN, B_BAR : bit_vector (63 downto 0);
	
	begin
		COMPARATOR_B_NOT : alu_not_gate32 port map(B, B_BAR);
		COMPARATOR_A_EXTEND : alu_extend64 port map (A, A_IN);
		COMPARATOR_B_EXTEND : alu_extend64 port map (B, B_IN);		
		COMPARATOR_EQUAL : alu_xnor_gate32 port map(A, B, EQUAL);
		COMPARATOR_GREATER : alu_and_gate64 port map(A_IN, B_BAR, GREATER);

		Y <= EQUAL when (EQUAL = "1111111111111111111111111111111111111111111111111111111111111111")
			else A_IN when (GREATER = "1111111111111111111111111111111111111111111111111111111111111111")
			else B_IN;
		
end architecture;



-- Entity and architecture for 32-BIT TWO's COMPLEMENT
-- COMPONENT list:
--		alu_adder64 (64-BIT RIPPLE-ADDER)
--		alu_not_gate32 (32-BIT NOT-GATE)
entity alu_twos_complements32 is
	port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
end entity;

architecture alu_twos_complements32_design of alu_twos_complements32 is
	component alu_adder64
		port (
			A, B : in bit_vector (63 downto 0); CIN : in bit;
			SUM : out bit_vector (63 downto 0); COUT : out bit
		);	
	end component;
	
	component alu_not_gate32
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	signal X_BAR : bit_vector (63 downto 0);
	
	begin
		COMPLEMENTS_NOT : alu_not_gate32 port map(X, X_BAR);
		COMPLEMENTS_ADD : alu_adder64 port map(
			X_BAR, "0000000000000000000000000000000000000000000000000000000000000000", '1', Y
		);
end architecture;
	
	
	
--*********************************** CONTROL UNIT ***********************************
	
-- Entity and architecture for the main ARITHMETIC AND LOGIC UNIT (ALU) design.
-- COMPONENT list:
--		alu_not_gate (NOT-GATE)
--		alu_or_gate (OR-GATE)
--		alu_or_gate3 (3-INPUT OR-GATE)
--		alu_or_gate4 (4-INPUT OR-GATE)
--		alu_or_gate5 (5-INPUT OR-GATE)
--		alu_or_gate6 (6-INPUT OR-GATE)
--		alu_and_gate (AND-GATE)
--		alu_and_gate3 (3-INPUT AND-GATE)
--		alu_and_gate4 (4-INPUT AND-GATE)
--		alu_and_gate5 (5-INPUT AND-GATE)
--		alu_xor_gate (XOR-GATE)
--		alu_xnor_gate (XNOR-GATE)
--		alu_nand_gate (NAND-GATE)
--		alu_nor_gate (NOR-GATE)
--		alu_shifter64 (64-BIT SHIFT CIRCUIT)
--		alu_mutiplexer16 (16X1 MUX)
--		alu_adder64 (64-BIT RIPPE ADDER)
--		alu_parity64 (64-BIT PARITY CIRCUIT)
--		alu_ones_counter64 (64-BIT ONES and ZEROS COUNTER CIRCUIT)
--  	alu_not_gate32 (32-BIT NOT-GATE) 
--		alu_or_gate32 (2-INPUT 32-BIT OR-GATE)
-- 	alu_and_gate32 (2-INPUT 32-BIT AND-GATE)
-- 	alu_nand_gate32 (2-INPUT 32-BIT NOT-GATE)
-- 	alu_nor_gate32 (2-INPUT 32-BIT NOR-GATE)
--		alu_xor_gate32 (2-INPUT 32-BIT XOR-GATE)
--		alu_xnor_gate32 (2-INPUT 32-BIT XNOR-GATE)
--		alu_extend64 (32 to 64 BIT CIRCUIT)
--		alu_comparator32 (32-BIT COMPARATOR)
--		alu_twos_complements32 (32 BIT TWO's COMPLEMEMNTS)
entity arithmetic_and_logic_unit is
	port (
		S : in bit_vector (4 downto 0);
		A, B : in bit_vector (31 downto 0); 
		PARITY, OVERFLOW, NEGATIVE_VALUE, POSITIVE_VALUE, COUT : out bit;
		ONES_COUNT, ZEROS_COUNT : out bit_vector (6 downto 0); Y : out bit_vector (63 downto 0)
	);
end entity;

architecture arithmetic_and_logic_unit_design of arithmetic_and_logic_unit is
	component alu_not_gate
		port (X : in bit; Y : out bit);
	end component;
	
	component alu_or_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_or_gate3
		port (A, B, C : in bit; Y : out bit);
	end component;
	
	component alu_or_gate4
		port (A, B, C, D : in bit; Y : out bit);
	end component;
	
	component alu_or_gate5
		port (A, B, C, D, E : in bit; Y : out bit);
	end component;
	
	component alu_or_gate6
		port (A, B, C, D, E, F : in bit; Y : out bit);
	end component;	
	
	component alu_and_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_and_gate3
		port (A, B, C : in bit; Y : out bit);
	end component;
	
	component alu_and_gate4
		port (A, B, C, D : in bit; Y : out bit);
	end component;
	
	component alu_and_gate5
		port (A, B, C, D, E : in bit; Y : out bit);
	end component;
	
	component alu_xor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_xnor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_nor_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	component alu_shifter64
		port (
			X : in bit_vector (63 downto 0); S : in bit_vector (1 downto 0);
			Y : out bit_vector (63 downto 0)
		);
	end component;
	
	component alu_mutiplexer16
		port (
			D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15 : in bit;
			S3, S2, S1, S0 : in bit; Y : out bit
		);
	end component;
	
	component alu_adder64
		port (
			A, B : in bit_vector (63 downto 0); CIN : in bit;
			SUM : out bit_vector (63 downto 0); COUT : out bit
		); 
	end component;
	
	component alu_parity64
		port (X : in bit_vector (63 downto 0); Y : out bit); 
	end component;
	
	component alu_ones_counter64
		port (X : in bit_vector (63 downto 0); ONES, ZEROS : out bit_vector (6 downto 0)); 
	end component;
	
	component alu_not_gate32
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_or_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_and_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_nand_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_nor_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_xor_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_xnor_gate32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_extend64
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_comparator32
		port (A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	component alu_twos_complements32
		port (X : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0));
	end component;
	
	signal S4, S3, S2, S1, S0 : bit;
	signal S4_BAR, S3_BAR, S2_BAR, S1_BAR, S0_BAR : bit;
	signal MUX_1_S3, MUX_1_S2, MUX_1_S1, MUX_1_S0 : bit;
	signal MUX_2_S3, MUX_2_S2, MUX_2_S1, MUX_2_S0 : bit;
	
	signal M1_S3_1, M1_S3_2, M1_S3_3, M1_S3_4 : bit;
	signal M1_S2_1, M1_S2_2, M1_S2_3, M1_S2_4, M1_S2_5, M1_S2_6 : bit;
	signal M1_S1_1, M1_S1_2, M1_S1_3, M1_S1_4, M1_S1_5, M1_S1_6 : bit;
	signal M1_S0_1, M1_S0_2, M1_S0_3, M1_S0_4, M1_S0_5 : bit;
		
	signal M2_S3_1, M2_S3_2, M2_S3_3 : bit;
	signal M2_S2_1, M2_S2_2, M2_S2_3, M2_S2_4 : bit;
	signal M2_S1_1, M2_S1_2, M2_S1_3, M2_S1_4 : bit;
	signal M2_S0_1, M2_S0_2, M2_S0_3, M2_S0_4 : bit;
	
	signal MUX_1, MUX_2, Y_OUT : bit_vector (63 downto 0);
	
	signal IN1, IN2, IN3, IN4 : bit_vector (63 downto 0);
	signal IN5, IN6, IN7, IN8 : bit_vector (63 downto 0);
	signal IN9, IN10, IN11, IN12 : bit_vector (63 downto 0);
	signal IN13, IN14, IN15, IN16 : bit_vector (63 downto 0);
	signal IN17, IN18, IN19, IN20 : bit_vector (63 downto 0);
	signal IN21, IN22, IN23, IN24 : bit_vector (63 downto 0);
	signal IN25, IN26, IN27, IN28 : bit_vector (63 downto 0);
	signal IN29, IN30, IN31, IN32 : bit_vector (63 downto 0);
	
	begin
		
		S4 <= S(4);	S3 <= S(3);	S2 <= S(2);	S1	<= S(1);	S0 <= S(0);
		
		S4_NOT : alu_not_gate port map (S4, S4_BAR);
		S3_NOT : alu_not_gate port map (S3, S3_BAR);
		S2_NOT : alu_not_gate port map (S2, S2_BAR);
		S1_NOT : alu_not_gate port map (S1, S1_BAR);
		S0_NOT : alu_not_gate port map (S0, S0_BAR);		
		
		--mux16x1_1
		--y = A'BC + BCE' + A'CDE' + ABDE'
		MUX_1_S3_1 : alu_and_gate3 port map (S4_BAR, S3, S2, M1_S3_1);
		MUX_1_S3_2 : alu_and_gate3 port map (S3, S2, S0_BAR, M1_S3_2);
		MUX_1_S3_3 : alu_and_gate4 port map (S4_BAR, S2, S1, S0_BAR, M1_S3_3);
		MUX_1_S3_4 : alu_and_gate4 port map (S4, S3, S1, S0_BAR, M1_S3_4);
		MUX_1_S3_LINE : alu_or_gate4 port map (M1_S3_1, M1_S3_2, M1_S3_3, M1_S3_4, MUX_1_S3);
		
		--y = A'BE + A'BC + A'CD'E' + A'CDE + AC'D'E' + A'B'C'DE'
		MUX_1_S2_1 : alu_and_gate3 port map (S4_BAR, S3, S0, M1_S2_1);
		MUX_1_S2_2 : alu_and_gate3 port map (S4_BAR, S3, S2, M1_S2_2);
		MUX_1_S2_3 : alu_and_gate4 port map (S4_BAR, S2, S1_BAR, S0_BAR, M1_S2_3);
		MUX_1_S2_4 : alu_and_gate4 port map (S4_BAR, S2, S1, S0, M1_S2_4);
		MUX_1_S2_5 : alu_and_gate4 port map (S4, S2_BAR, S1_BAR, S0_BAR, M1_S2_5);
		MUX_1_S2_6 : alu_and_gate5 port map (S4_BAR, S3_BAR, S2_BAR, S1, S0_BAR, M1_S2_6);
		MUX_1_S2_LINE : alu_or_gate6 port map (M1_S2_1, M1_S2_2, M1_S2_3, M1_S2_4, M1_S2_5, M1_S2_6, MUX_1_S2);
		
		--y = A'B'CE' + A'BDE' + A'BCD + BCDE' + A'B'C'D'E + ABC'D'E'
		MUX_1_S1_1 : alu_and_gate4 port map (S4_BAR, S3_BAR, S2, S0_BAR, M1_S1_1);
		MUX_1_S1_2 : alu_and_gate4 port map (S4_BAR, S3, S1, S0_BAR, M1_S1_2);
		MUX_1_S1_3 : alu_and_gate4 port map (S4_BAR, S3, S2, S1, M1_S1_3);
		MUX_1_S1_4 : alu_and_gate4 port map (S3, S2, S1, S0_BAR, M1_S1_4);
		MUX_1_S1_5 : alu_and_gate5 port map (S4_BAR, S3_BAR, S2_BAR, S1_BAR, S0, M1_S1_5);
		MUX_1_S1_6 : alu_and_gate5 port map (S4, S3, S2_BAR, S1_BAR, S0_BAR, M1_S1_6);
		MUX_1_S1_LINE : alu_or_gate6 port map (M1_S1_1, M1_S1_2, M1_S1_3, M1_S1_4, M1_S1_5, M1_S1_6, MUX_1_S1);
		
		--y = y = A'BC'E' + A'BCE + AC'D'E' + ABD'E' + A'B'CDE'
		MUX_1_S0_1 : alu_and_gate4 port map (S4_BAR, S3, S2_BAR, S0_BAR, M1_S0_1);
		MUX_1_S0_2 : alu_and_gate4 port map (S4_BAR, S3, S2, S0, M1_S0_2);
		MUX_1_S0_3 : alu_and_gate4 port map (S4, S2_BAR, S1_BAR, S0_BAR, M1_S0_3);
		MUX_1_S0_4 : alu_and_gate4 port map (S4, S3, S1_BAR, S0_BAR, M1_S0_4);
		MUX_1_S0_5 : alu_and_gate5 port map (S4_BAR, S3_BAR, S2, S1, S0_BAR, M1_S0_5);
		MUX_1_S0_LINE : alu_or_gate5 port map (M1_S0_1, M1_S0_2, M1_S0_3, M1_S0_4, M1_S0_5, MUX_1_S0);
		
		--mux16x1_2
		--y = AB'D + AB'C + ACE
		MUX_2_S3_1 : alu_and_gate3 port map (S4, S3_BAR, S1, M2_S3_1);
		MUX_2_S3_2 : alu_and_gate3 port map (S4, S3_BAR, S2, M2_S3_2);
		MUX_2_S3_3 : alu_and_gate3 port map (S4, S2, S0, M2_S3_3);
		MUX_2_S3_LINE : alu_or_gate3 port map (M2_S3_1, M2_S3_2, M2_S3_3, MUX_2_S3);
		
		--y = AB'C + B'CD'E + AB'D'E + ABC'E
		MUX_2_S2_1 : alu_and_gate3 port map (S4, S3_BAR, S1, M2_S2_1);
		MUX_2_S2_2 : alu_and_gate4 port map (S3_BAR, S2, S1_BAR, S0, M2_S2_2);
		MUX_2_S2_3 : alu_and_gate4 port map (S4, S3_BAR, S1_BAR, S0, M2_S2_3);
		MUX_2_S2_4 : alu_and_gate4 port map (S4, S3, S2_BAR, S0, M2_S2_4);
		MUX_2_S2_LINE : alu_or_gate4 port map (M2_S2_1, M2_S2_2, M2_S2_3, M2_S2_4, MUX_2_S2);
		
		--y = C'DE + A'BC' + BC'E + AB'D
		MUX_2_S1_1 : alu_and_gate3 port map (S2_BAR, S1, S0, M2_S1_1);
		MUX_2_S1_2 : alu_and_gate3 port map (S4_BAR, S3, S2_BAR, M2_S1_2);
		MUX_2_S1_3 : alu_and_gate3 port map (S3, S2_BAR, S0, M2_S1_3);
		MUX_2_S1_4 : alu_and_gate3 port map (S4, S3_BAR, S1, M2_S1_4);
		MUX_2_S1_LINE : alu_or_gate4 port map (M2_S1_1, M2_S1_2, M2_S1_3, M2_S1_4, MUX_2_S1);
		
		--y = C'DE + B'CE + ADE + A'BC'E'
		MUX_2_S0_1 : alu_and_gate3 port map (S2_BAR, S1, S0, M2_S0_1);
		MUX_2_S0_2 : alu_and_gate3 port map (S3_BAR, S2, S0, M2_S0_2);
		MUX_2_S0_3 : alu_and_gate3 port map (S4, S1, S0, M2_S0_3);
		MUX_2_S0_4 : alu_and_gate4 port map (S4_BAR, S3, S2_BAR, S0_BAR, M2_S0_4);
		MUX_2_S0_LINE : alu_or_gate4 port map (M2_S0_1, M2_S0_2, M2_S0_3, M2_S0_4, MUX_2_S0);
		
		
		
		IN1 <= "0000000000000000000000000000000000000000000000000000000000000000";
		IN2 <= "0000000000000000000000000000000000000000000000000000000000000001";
		IN3 <= "1111111111111111111111111111111111111111111111111111111111111111";
		IN4 <= "1000000000000000000000000000000000000000000000000000000000000000";
		
		
		GENERATE_IN5 : alu_extend64 port map (A, IN5);
		GENERATE_IN6 : alu_not_gate32 port map (A, IN6);
		GENERATE_IN7 : alu_twos_complements32 port map (A, IN7); 
		GENERATE_IN8 : alu_shifter64 port map (IN5, "01", IN8); 
		
		GENERATE_IN9 : alu_shifter64 port map (IN5, "00", IN9); 
		GENERATE_IN10 : alu_shifter64 port map (IN5, "11", IN10);
		GENERATE_IN11 : alu_shifter64 port map (IN5, "10", IN11); 
		GENERATE_IN12 : alu_comparator32 port map (A, B, IN12); 
		
		GENERATE_IN13 : alu_adder64 port map (IN5, IN22, '0', IN13); 
--		GENERATE_IN14 : alu_shifter64 port map (IN5, "10", IN11); 
--		GENERATE_IN15 : alu_shifter64 port map (IN5, "10", IN11); 
--		GENERATE_IN16 : alu_shifter64 port map (IN5, "10", IN11); 
		
		IN17 <= IN1; IN18 <= IN2; IN19 <= IN4;
		GENERATE_IN20 : alu_extend64 port map (B, IN20);
		
		GENERATE_IN21 : alu_not_gate32 port map (B, IN21);
		GENERATE_IN22 : alu_twos_complements32 port map (B, IN22); 
		GENERATE_IN23 : alu_shifter64 port map (IN20, "01", IN23); 
		GENERATE_IN24 : alu_shifter64 port map (IN20, "00", IN24); 
		
		GENERATE_IN25 : alu_shifter64 port map (IN20, "11", IN25);
		GENERATE_IN26 : alu_shifter64 port map (IN20, "10", IN26);
		GENERATE_IN27 : alu_and_gate32 port map (A, B, IN27); 
		GENERATE_IN28 : alu_or_gate32 port map (A, B, IN28);  
		
		GENERATE_IN29 : alu_nand_gate32 port map (A, B, IN29); 
		GENERATE_IN30 : alu_nor_gate32 port map (A, B, IN30);  
		GENERATE_IN31 : alu_xor_gate32 port map (A, B, IN31); 
		GENERATE_IN32 : alu_xnor_gate32 port map (A, B, IN32);  
		
		
		GENERATED_MUX_VALUES : for i in 0 to 63 generate					
			MUX_1_LINE : alu_mutiplexer16 port map (
				IN1(i), IN2(i), IN3(i), IN4(i),
				IN5(i), IN6(i), IN7(i), IN8(i),
				IN9(i), IN10(i), IN11(i), IN12(i),
				IN13(i), IN1(i), IN1(i), IN1(i),
				MUX_1_S3, MUX_1_S2, MUX_1_S1, MUX_1_S0,
				MUX_1(i)
			);
								
			MUX_2_LINE : alu_mutiplexer16 port map (
				IN17(i), IN18(i), IN19(i), IN20(i),
				IN21(i), IN22(i), IN23(i), IN24(i),
				IN25(i), IN26(i), IN27(i), IN28(i),
				IN29(i), IN30(i), IN31(i), IN32(i),
				MUX_2_S3, MUX_2_S2, MUX_2_S1, MUX_2_S0,
				MUX_2(i)
			);
		end generate;
		
		OUTPUT : alu_adder64 port map (MUX_1, MUX_2, '0', Y_OUT, COUT);	
		
		PARITY_OUTPUT : alu_parity64 port map (Y_OUT, PARITY);
		ONES_ZEROS_COUNT_OUTPUT : alu_ones_counter64 port map (Y_OUT, ONES_COUNT, ZEROS_COUNT);
				
		NEGATIVE_VALUE <= '0' when (Y_OUT(63) = '0') else '1';
		POSITIVE_VALUE <= '1' when (Y_OUT(63) = '0') else '0';
		
		OVERFLOW <= '1' when (
				(Y_OUT(63) = '1' and MUX_1(63) = '0' and MUX_2(63)= '0') or
				(Y_OUT(63) = '0' and MUX_1(63) = '1' and MUX_2(63)= '1')
			)  else '0';
			
		Y <= Y_OUT;
end architecture;
	