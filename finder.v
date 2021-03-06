module 
finder(str_out, match, str_in, clk);
    input str_in, clk;
    output [2:0]str_out;
    output match;
    
reg match;
reg [2:0]current_state;
reg [2:0]next_state;
reg [2:0]str_out;

parameter state0 = 3'b000;
parameter state1 = 3'b001;
parameter state2 = 3'b010;
parameter state3 = 3'b011;
parameter state4 = 3'b100;
parameter state5 = 3'b101;
parameter state6 = 3'b110;
parameter state7 = 3'b111;


always@(posedge clk)
begin//CS
 current_state <= next_state;
end 

 
always@(current_state or str_in)
	begin //NS
		case(current_state)
		 state0:
		 next_state = (str_in==1)?state4:state0;
		 state1:
		 next_state = (str_in==1)?state4:state0;
		 state2:
		 next_state = (str_in==1)?state5:state1;
		 state3:
		 next_state = (str_in==1)?state5:state1;
		 state4:
		 next_state = (str_in==1)?state6:state2;
		 state5:
		 next_state = (str_in==1)?state6:state2;
		 state6:
		 next_state = (str_in==1)?state7:state3;
		 state7:
		 next_state = (str_in==1)?state7:state3;
		endcase
	end

always@(current_state)
begin //OL
 case(current_state)
	state6:
	match = 1;
	default match = 0;
endcase

 str_out = current_state;
end

endmodule


