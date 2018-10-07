module regfile_for_cp0(//zÕıÈ·
input clock_in,input reset,input [1:0]enable_mf_mt,
input [31:0]pc,input [4:0] addr,input [31:0] data,input [1:0]exc_signal,
input [3:0]cause,output reg [95:0]data_out);
reg [31:0]reg_cau = 0;reg [31:0]epc_output;reg enable_signal = 0;
parameter exc_data=32'h00400004;parameter exc_status=32'h0000000f;
always@(negedge clock_in)
begin if(reset)begin data_out[95:64]=0;data_out[31:0] =exc_data;data_out[63:32] = exc_status;end
else begin if(enable_mf_mt[1])
begin case(addr)
5'd12:data_out[95:64]=data_out[63:32];
5'd13:data_out[95:64]=reg_cau;
5'd14:data_out[95:64]=epc_output;endcase end
if(enable_mf_mt[0])begin case(addr)
5'd12:data_out[63:32] = data;
5'd13:reg_cau = data;
5'd14:epc_output = data;endcase end
if(exc_signal[1] & ~enable_signal)begin data_out[63:32] = data_out[63:32]<<5;epc_output = pc;reg_cau[5:2] = cause;enable_signal = 1;data_out[31:0] = 32'h00400004;end
if(exc_signal[0] & enable_signal)begin data_out[63:32] = data_out[63:32]>>5;data_out[31:0] = epc_output;enable_signal = 0;end else data_out[31:0] = exc_data;end end endmodule