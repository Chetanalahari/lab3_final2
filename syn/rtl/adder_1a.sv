module adder_1a(a,b,cin,sum,carry);
	input logic [3:0] a;
	input logic [3:0] b;
	input logic cin;
  output [3:0]sum;
	output carry;
	
	logic [3:0]c;
 
      singlebit_adder sa1(a[0],b[0],cin ,sum[0],c[0]);
      singlebit_adder sa2(a[1],b[1],c[0],sum[1],c[1]);
      singlebit_adder sa3(a[2],b[2],c[1],sum[2],c[2]);
      singlebit_adder sa4(a[3],b[3],c[2],sum[3],c[3]);
  assign carry=c[3];
endmodule


module singlebit_adder(a,b,cin,sum,carry);
	input logic a;
	input logic b;
	input logic cin;
	output sum;
	output carry;

     assign sum=(a^b^cin);
     assign carry=(a&b)|(b&cin)|(cin&a);
endmodule

