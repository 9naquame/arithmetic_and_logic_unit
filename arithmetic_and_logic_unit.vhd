entity alu_nand_gate is 
	port(A, B: in bit; Y : out bit);
end entity;

architecture alu_nand_gate_desgin of alu_nand_gate is
	begin
		Y <= not (A and B);
end architecture;



entity alu_not_gate is 
	port(A : in bit; Y : out bit);
end entity;

architecture alu_not_gate_desgin of alu_not_gate is
	component alu_nand_gate
		port (A, B : in bit; Y : out bit);
	end component;
	
	begin
		OUTPUT : alu_nand_gate port map (A, A, Y);
end architecture;



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
		ADD_LSB : alu_adder port map (A(0), B(0), CIN, SUM(0), C(1));
		ADD_MSB : alu_adder port map (A(63), B(63), C(63), SUM(63), COUT);
		
		GENERATED_ADDER64_VALUES : for i in 1 to 62 generate
			ADD_OTHERS : alu_adder port map (A(i), B(i), C(i), SUM(i), C(i + 1));
		end generate;		
end architecture;



entity alu_ones_counter is
	port (X : in bit_vector (63 downto 0); Y : out bit_vector (6 downto 0)); 
end entity;

architecture alu_ones_counter_design of alu_ones_counter is
	type MATRIX is array (0 to 63) of bit_vector (6 downto 0) ;
	
	component alu_adder7
		port(A, B : in bit_vector (6 downto 0); CIN : in bit; SUM : out bit_vector (6 downto 0); COUT : out bit);	
	end component;
	
	signal A, C : MATRIX;
	signal COUT : bit_vector (63 downto 0);
	
	begin
		GENERATED_MATRIX : for i in 0 to 63 generate
				A(i) <= "0000001" when X(i) = '1' else "0000000";				
		end generate;
		
		C(0) <= "0000000";
		ONES_LSB : alu_adder7 port map (A(0), C(0), '0', C(1), COUT(0));
		ONES_MSB : alu_adder7 port map (A(63), C(63), COUT(62), Y, COUT(63));
		
		GENERATED_ONES_VALUES : for i in 1 to 62 generate
			ONES_OTHERS : alu_adder7 port map (A(i), C(i), COUT(i), C(i + 1), COUT(i));
		end generate;		
end architecture;



entity alu_parity is
	port (X : in bit_vector (63 downto 0); Y : out bit); 
end entity;

architecture alu_parity_design of alu_parity is
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



entity alu_shifter64 is
	port (
		X : in bit_vector (63 downto 0); S : in bit_vector (1 downto 0);
		Y : out bit_vector (63 downto 0)
	);
end entity;

architecture alu_shifter64_design of alu_shifter64 is
	type MATRIX is array (0 to 63) of bit_vector (1 downto 0) ;
	
	component alu_not_gate
		port (A : in bit; Y : out bit);
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
		
		GENERATED_XOR_VALUES : for i in 1 to 62 generate
			SHIFT_OTHERS_L1 : alu_and_gate port map (S0_BAR, X(i - 1), C(i)(0));
			SHIFT_OTHERS_L2 : alu_and_gate port map (S(0), X(i + 1), C(i)(1));
			
			SHIFT_OTHERS : alu_or_gate port map (C(i)(0), C(i)(1), Y(i));
		end generate;
end architecture;



entity alu_mutiplexer16 is
	port (
		D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15 : in bit;
		S3, S2, S1, S0 : in bit; Y : out bit
	);		
end entity;

architecture alu_mutiplexer16_design of alu_mutiplexer16 is
	component alu_not_gate
		port (A : in bit; Y : out bit);
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

	

entity arithmetic_and_logic_unit is
	port (
		S : in bit_vector (4 downto 0); CIN : in bit;
		A, B : in bit_vector (31 downto 0); Y : out bit_vector (63 downto 0);
		ONES, ZEROS, PARITY, OVERFLOW, NEGATIVE_VALUE, POSITIVE_VALUE, COUT : out bit
	);
end entity;

architecture arithmetic_and_logic_unit_design of arithmetic_and_logic_unit is
	component alu_not_gate
		port (A : in bit; Y : out bit);
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
	
	component alu_shifter64 is
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
	
	component alu_parity is
		port (X : in bit_vector (63 downto 0); Y : out bit); 
	end component;
	
	component alu_ones_counter is
		port (X : in bit_vector (63 downto 0); Y : out bit_vector (6 downto 0)); 
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
	
	signal ONES_CHECK : bit_vector (6 downto 0);
	
	signal IN1, IN2, IN3, IN4 : bit_vector (63 downto 0);
	signal A_IN, B_IN, A_IN_BAR, B_IN_BAR : bit_vector (63 downto 0);
	signal A_IN_COMP, B_IN_COMP, AND_AB_IN, OR_AB_IN : bit_vector (63 downto 0);
	signal XOR_AB_IN, XNOR_AB_IN, NAND_AB_IN, NOR_AB_IN : bit_vector (63 downto 0);
	
	signal SUB_AB_IN : bit_vector (63 downto 0);
	signal SR_A_IN, SR_B_IN, SL_A_IN, SL_B_IN : bit_vector (63 downto 0);
	signal CSR_A_IN, CSR_B_IN, CSL_A_IN, CSL_B_IN : bit_vector (63 downto 0);
	
	begin
		
		IN1 <= "0000000000000000000000000000000000000000000000000000000000000000";
		IN2 <= "0000000000000000000000000000000000000000000000000000000000000001";
		IN3 <= "1111111111111111111111111111111111111111111111111111111111111111";
		IN4 <= "1000000000000000000000000000000000000000000000000000000000000000";
		
		A_IN <= "00000000000000000000000000000000" & A;
		B_IN <= "00000000000000000000000000000000" & B;
		
		S4 <= S(4);
		S3 <= S(3);
		S2 <= S(2);
		S1	<= S(1);
		S0 <= S(0);
		
		S4_NOT : alu_not_gate port map (S4, S4_BAR);
		S3_NOT : alu_not_gate port map (S3, S3_BAR);
		S2_NOT : alu_not_gate port map (S2, S2_BAR);
		S1_NOT : alu_not_gate port map (S1, S1_BAR);
		S0_NOT : alu_not_gate port map (S0, S0_BAR);
		
		GENERATED_VALEUS : for i in 0 to 63 generate
			A_NOT : alu_not_gate port map (A_IN(i), A_IN_BAR(i));
			B_NOT : alu_not_gate port map (B_IN(i), B_IN_BAR(i));
		
			OR_A_B_IN : alu_or_gate port map (A_IN(i), B_IN(i), OR_AB_IN(i));
			XOR_A_B_IN : alu_xor_gate port map (A_IN(i), B_IN(i), XOR_AB_IN(i));
			NOR_A_B_IN : alu_nor_gate port map (A_IN(i), B_IN(i), NOR_AB_IN(i));
			AND_A_B_IN : alu_and_gate port map (A_IN(i), B_IN(i), AND_AB_IN(i));
			NAND_A_B_IN : alu_nand_gate port map (A_IN(i), B_IN(i), NAND_AB_IN(i));
			XNOR_A_B_IN : alu_xnor_gate port map (A_IN(i), B_IN(i), XNOR_AB_IN(i));
		end generate;
	
		A_COMP : alu_adder64 port map (A_IN_BAR, IN2, '0', A_IN_COMP);					
		B_COMP : alu_adder64 port map (B_IN_BAR, IN2, '0', B_IN_COMP);		
		SUB_A_B_IN : alu_adder64 port map (A_IN, B_IN_COMP, '0', SUB_AB_IN);	
		
		SL_A : alu_shifter64 port map (A_IN, "00", SL_A_IN);
		SL_B : alu_shifter64 port map (B_IN, "00", SL_B_IN);
		
		SR_A : alu_shifter64 port map (A_IN, "01", SR_A_IN);
		SR_B : alu_shifter64 port map (B_IN, "01", SR_B_IN);
		
		CSL_A : alu_shifter64 port map (A_IN, "10", CSL_A_IN);
		CSL_B : alu_shifter64 port map (B_IN, "10", CSL_B_IN);
					
		CSR_A : alu_shifter64 port map (A_IN, "11", CSR_A_IN);
		CSR_B : alu_shifter64 port map (B_IN, "11", CSR_B_IN);	
	
		
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
		
		
		GENERATED_MUX_VALUES : for i in 0 to 63 generate					
			MUX_1_LINE : alu_mutiplexer16 port map (
				IN1(i), IN2(i), IN3(i), IN4(i),
				A_IN(i), A_IN_BAR(i), A_IN_COMP(i), SR_A_IN(i),
				SL_A_IN(i), CSR_A_IN(i), CSL_A_IN(i), IN1(i),
				SUB_AB_IN(i), IN1(i), IN1(i), IN1(i),
				MUX_1_S3, MUX_1_S2, MUX_1_S1, MUX_1_S0,
				MUX_1(i)
			);
								
			MUX_2_LINE : alu_mutiplexer16 port map (
				IN1(i), IN2(i), IN4(i), B_IN(i),
				B_IN_BAR(i), B_IN_COMP(i), SR_B_IN(i), SL_B_IN(i),
				CSR_B_IN(i), CSL_B_IN(i), AND_AB_IN(i), OR_AB_IN(i),
				NAND_AB_IN(i), NOR_AB_IN(i), XOR_AB_IN(i), XNOR_AB_IN(i),
				MUX_2_S3, MUX_2_S2, MUX_2_S1, MUX_2_S0,
				MUX_2(i)
			);
		end generate;
		
		OUTPUT : alu_adder64 port map (MUX_1, MUX_2, CIN, Y_OUT, COUT);	
		
		--parity check
		PARITY_OUTPUT : alu_parity port map (Y_OUT, PARITY);
		
		--ones check
		ONES_OUTPUT : alu_ones_counter port map (Y_OUT, ONES_CHECK);
		
		ZEROS <= '1' when ONES_CHECK = "0000000" else '0';
		ONES <= '1' when ONES_CHECK = "1000000" else '0';
		
		NEGATIVE_VALUE <= '0' when (Y_OUT(63) = '0') else '1';
		POSITIVE_VALUE <= '1' when (Y_OUT(63) = '0') else '0';
		
		OVERFLOW <= '1' when (
				(Y_OUT(63) = '1' and MUX_1(63) = '0' and MUX_2(63)= '0') or
				(Y_OUT(63) = '0' and MUX_1(63) = '1' and MUX_2(63)= '1')
			)  else '0';
			
		Y <= Y_OUT;
end architecture;
	