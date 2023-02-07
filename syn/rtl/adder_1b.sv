module adder_1b(a,b,cin,sum,carry);

    input logic [3:0] a;
	input logic [3:0] b;
	input logic cin;
	output [3:0] sum;
	output carry;
	
	logic C0,C1,C2;

Adder FA1(a[0],b[0],cin,sum[0],C0);
Adder FA2(a[1],b[1],C0,sum[1],C1);
Adder FA3(a[2],b[2],C1,sum[2],C2);
Adder FA4(a[3],b[3],C2,sum[3],carry);
endmodule

module Adder(a,b,cin,sum,carry);
    input logic a;
	input logic b;
	input logic cin;
	output sum;
	output carry;
    logic w0,w1,w2,w3,w4;
    
	xor g1(w0,a,b);
    xor g2(sum,w0,cin);
    and g3(w1,a,b);
    and g4(w2,b,cin);
    and g5(w3,cin,a);
    or g6(w4,w1,w2);
    or g7(carry,w4,w3);
endmodule


