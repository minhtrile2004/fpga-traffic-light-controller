module bai10(CLOCK_50, SW, LEDR, LEDG, HEX1, HEX0, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input CLOCK_50;
	input [1:1]SW;
	output reg [16:0] LEDR;
	output reg [0:0] LEDG;
	output reg [6:0] HEX1, HEX0, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	
	 parameter g16 = 6'd0;
	 parameter g15= 6'd1;
	 parameter g14= 6'd2;
    parameter g13 = 6'd3;  
    parameter g12 = 6'd4;
    parameter g11 = 6'd5;
    parameter g10 = 6'd6;
    parameter g9 = 6'd7;
    parameter g8 = 6'd8;
    parameter g7 = 6'd9;
    parameter g6 = 6'd10;
    parameter g5 = 6'd11;
    parameter g4 = 6'd12;
    parameter g3 = 6'd13;
    parameter g2 = 6'd14;
    parameter g1 = 6'd15;
    parameter g0 = 6'd16;
	 
	 parameter y6 =6'd17;
    parameter y5 = 6'd18;
    parameter y4 = 6'd19;
    parameter y3 = 6'd20;
    parameter y2 = 6'd21;
    parameter y1 = 6'd22; 
    parameter y0 = 6'd23;
	 
	  parameter r11 = 6'd24;
    parameter r10 = 6'd25;
    parameter r9 = 6'd26;
    parameter r8 = 6'd27;
    parameter r7 = 6'd28;
    parameter r6 = 6'd29;
    parameter r5 = 6'd30;
    parameter r4 = 6'd31;
    parameter r3 = 6'd32;
	 parameter r2 = 6'd33;
	 parameter r1 = 6'd34;
    parameter r0 = 6'd35;

    reg [5:0] current_state, next_state; 
    always @(*) begin
        HEX2 = 7'b1111111; 
        HEX3 = 7'b1111111; 
        HEX4 = 7'b1111111; 
        HEX5 = 7'b1111111; 
        HEX6 = 7'b1111111; 
        HEX7 = 7'b1111111; 
    end
  //--------------------------------------------
	 reg clock_1s = 1'b0;
	 integer q;
	 always @ (posedge CLOCK_50)
		begin
			q=q+1;
			if (q == 25000000)   
			begin     
				clock_1s= ~clock_1s;   
				q = 0;	   
			end   
		 end
		 
    always @(*) begin
        case (current_state)
				g16: next_state = g15;
				g15: next_state = g14;
				g14: next_state = g13;
            g13:  next_state = g12;
            g12:  next_state = g11;
            g11:  next_state = g10;
            g10:  next_state = g9;
            g9:   next_state = g8;
            g8:   next_state = g7;
            g7:   next_state = g6;
            g6:   next_state = g5;
            g5:   next_state = g4;
            g4:   next_state = g3;
            g3:   next_state = g2;
            g2:   next_state = g1;
            g1:   next_state = y6;

				y6: next_state=y5;
				y5:   next_state = y4;
            y4:   next_state = y3;
            y3:   next_state = y2;
            y2:   next_state = y1;
            y1:   next_state = r11;
				
            r11: next_state = r10;
				r10:  next_state = r9;
            r9:   next_state = r8;
            r8:   next_state = r7;
            r7:   next_state = r6;
            r6:   next_state = r5;
            r5:   next_state = r4;
            r4:   next_state = r3;
            r3:   next_state = r2;
				r2:   next_state = r1;
            r1:   next_state = g16;
            default:   next_state = g16;
        endcase
    end
    always @(posedge clock_1s) begin
        if (SW[1]) begin
            current_state <= g16; 
        end else begin
            current_state <= next_state;
        end
    end
    always @(*) begin
        case (current_state)
		  
            // Xanh lá: 15 giây
				 g16: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
					 HEX1 = 7'b1111001; // 1
                HEX0 = 7'b0010010; // 5
            end
            g15: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1111001; // 1
                HEX0 = 7'b0011001; // 4
            end
            g14: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1111001; // 1
                HEX0 = 7'b0110000; // 3
            end
            g13: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
					 HEX1 = 7'b1111001; // 1
                HEX0 = 7'b0100100; // 2
            end
            g12: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1111001; // 1
                HEX0 = 7'b1111001; // 1
            end
            g11: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1111001; // 1
                HEX0 = 7'b1000000; // 0
            end
            g10: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0010000; // 9
            end
            g9: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0000000; // 8
            end
            g8: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1111000; // 7
            end
            g7: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0000010; // 6
            end
            g6: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0010010; // 5
            end
            g5: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0011001; // 4
            end
            g4: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0110000; // 3
            end
            g3: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0100100; // 2
            end
            g2: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1111001; // 1
            end
				g1: begin
                LEDG[0] = 1; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1000000; // 0
            end
				
            // Vàng: 5 giây
				y6: begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 1;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0010010;//5
            end
            y5: begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 1;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0011001; // 4
            end
            y4: begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 1;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0110000; // 3
            end
            y3: begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 1;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0100100; // 2
            end
            y2: begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 1;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1111001; // 1
            end
				y1: begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 1;
					 HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1000000; // 0
					 end
					 
// Đỏ: 10 giây
            r11: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1111001; // 1
                HEX0 = 7'b1000000; // 0
            end
            r10: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0010000; // 9
            end
            r9: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0000000; // 8
            end
            r8: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1111000; // 7
            end
            r7: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0000010; // 6
            end
            r6: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0010010; // 5
            end
            r5: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0011001; // 4
            end
            r4: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0110000; // 3
            end
            r3: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b0100100; // 2
            end
            r2: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1111001; // 1
            end
				r1: begin
                LEDG[0] = 0; LEDR[0] = 1; LEDR[16] = 0;
                HEX1 = 7'b1000000; // 0
                HEX0 = 7'b1000000; // 0
            end
            default begin
                LEDG[0] = 0; LEDR[0] = 0; LEDR[16] = 0;
                HEX1 = 7'b1111111; 
                HEX0 = 7'b1111111; 
            end
        endcase
    end
endmodule