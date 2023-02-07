module adder_1c(a,b,cin,sum,carry);
input logic [3:0] a;
input logic [3:0] b;
input logic cin;
output [3:0] sum;
output carry;

wire c0,c1,c2;
	
  Adder A1(a[0],b[0],cin,sum[0],c0);
  Adder A2(a[1],b[1],c0,sum[1],c1);
  Adder A3(a[2],b[2],c1,sum[2],c2);
  Adder A4(a[3],b[3],c2,sum[3],carry);
	
endmodule
	

module Adder(a,b,cin,sum,carry);
    input logic a;
	input logic b;
	input logic cin;
	output logic sum;
	output logic carry;
	
always_comb 
begin
	case({a,b,cin})
	
	 3'b000: 
		begin 
		sum = 0; 
		carry =0;
		end 
     3'b001:
		begin 
		sum = 1;
		carry = 0;
		end 
	3'b010: 
		begin
		sum = 1;  
		carry =0;
		end
    3'b011:
		begin 
		sum = 0;
		carry = 1;
		end
    3'b100:
		begin 
		 sum = 1; 
		 carry =0;
		end
     3'b101: 
		begin 
		 sum = 0; 
		 carry = 1;
		end
     3'b110: 
		begin 
		 sum = 0; 
		 carry =1;
		end
	3'b111:
		begin 
		 sum = 1; 
		 carry = 1;
		end
 	 
	endcase
end
endmodule
