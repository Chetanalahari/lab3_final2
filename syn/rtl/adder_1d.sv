module adder_1d (a,b,cin,sum,cout);
input reg [3:0] a,b;
input cin; 
output reg [3:0] sum;
output reg cout;

always_comb
begin
{cout,sum} = a+b+cin;
end
endmodule

