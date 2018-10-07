`timescale 1ns / 1ps
module cpu(input _clk,input reset,output [31:0]cpu_out_inst,output [31:0]cpu_out_pc,output [31:0]cpu_out_alu);
wire mem_mux_select;//data_in[86]
wire switch_cs;//data_in[84]
wire clk;    //data_in[82]
wire [15:0]sw;wire [85:0]data_in;wire [31:0]reg_temp_CPU[33:0];


//wire C_CLK;wire RST;wire C_EN;wire D_OUT1;wire data1;wire D_OUT0;wire C_out;wire count_light;
//wire a0;wire a1;wire a2;wire a3;wire speed_select;wire flowspeed;wire line_0;wire line_1;wire line_2;
//wire line_3;
//counter55 seg(C_CLK,RST,C_EN,D_OUT1,data1,D_OUT0,C_out,count_light,a0,a1,a2,a3,speed_select,flowspeed,line_0,line_1,line_2,line_3);

wire enable_seg;
wire [14:0]inaddr;
wire [11:0]coclor;
wire [7:0]data_in_sge;
wire [3:0]data_out_sge;
wire iEna;
wire [4:0]iDATA;
wire [31:0]ODATA;
wire [31:0]ip_data;
wire [31:0]io_data;
wire [3:0]cal;
wire [31:0]resul;
wire ro;
wire geti;
wire rry;
wire erflo;
wire EN_in;wire SW1;wire RST;wire Red1;wire Red2;wire Yellow1;wire Yellow2;wire Green1;wire Green2;
color_rom2 inaddr1(enable_seg,inaddr,coclor);
//wire [1:0]count_light;wire [1:0]count_light1;input Rst,input I_CLK,output reg O_CLKwire num;
//alarm_clock(input [2:0]flowspeed,input [1:0]count_light,input [1:0]count_light1,input Rst,input I_CLK,output reg O_CLK,output reg num);


assign sw=16'b0;
assign switch_cs = (reg_temp_CPU[32] == 32'h10010010 && mem_mux_select == 1 && ~data_in[83] == 1) ? 1 : 0;
assign reg_temp_CPU[30]=(switch_cs) ? {16'b0, sw[15:0]} : reg_temp_CPU[29];assign clk=_clk;
instruction decoder(reg_temp_CPU[27][31:26],reg_temp_CPU[27][25:21],reg_temp_CPU[27][20:16],reg_temp_CPU[27][5:0],data_in[39:34],data_in[33],data_in[32]);
wire clk_4;
wire o_clk4;
wire str;
Divider_instr diver(clk_4,str,o_clk4);

CPU54_muticycle_controler controler(reset,reg_temp_CPU[27],data_in[39:34],clk,
{data_in[31],data_in[29],reg_temp_CPU[7][3:0]},{data_in[2],data_in[40],data_in[6:3],data_in[13],data_in[15:14],data_in[17:16],data_in[18],mul_start,data_in[12],
data_in[24],data_in[23:22],data_in[21],data_in[20:19],data_in[25],data_in[26],data_in[27],mem_mux_select,data_in[81],
data_in[79],data_in[78:74],data_in[73:69],data_in[68:64],data_in[63:60],
data_in[59],data_in[58],data_in[57],data_in[56],data_in[55],data_in[54],data_in[53],data_in[52],
data_in[51:48],data_in[47:46],data_in[45:43],data_in[42:41],data_in[11:7]},finish_instr,data_in[83]);
assign reg_temp_CPU[4] =(reg_temp_CPU[3][31:31] == 1'b1)? 32'd0:((reg_temp_CPU[3][31:30] == 2'b01)? 32'd1:reg_temp_CPU[3][31:29] == 3'b001 ? 32'd2:reg_temp_CPU[3][31:28] == 4'b0001 ? 32'd3:reg_temp_CPU[3][31:27] == 5'b1 ? 32'd4:reg_temp_CPU[3][31:26] == 6'b1 ? 32'd5:reg_temp_CPU[3][31:25] == 7'b1 ? 32'd6:reg_temp_CPU[3][31:24] == 8'b1 ? 32'd7:reg_temp_CPU[3][31:23] == 9'b1 ? 32'd8:reg_temp_CPU[3][31:22] == 10'b1 ? 32'd9:reg_temp_CPU[3][31:21] == 11'b1 ? 32'd10:reg_temp_CPU[3][31:20] == 12'b1 ? 32'd11:reg_temp_CPU[3][31:19] == 13'b1 ? 32'd12:reg_temp_CPU[3][31:18] == 14'b1 ? 32'd13:reg_temp_CPU[3][31:17] == 15'b1 ? 32'd14:reg_temp_CPU[3][31:16] == 16'b1 ? 32'd15:reg_temp_CPU[3][31:15] == 17'b1 ? 32'd16:reg_temp_CPU[3][31:14] == 18'b1 ? 32'd17:reg_temp_CPU[3][31:13] == 19'b1 ? 32'd18:reg_temp_CPU[3][31:12] == 20'b1 ? 32'd19:reg_temp_CPU[3][31:11] == 21'b1 ? 32'd20:reg_temp_CPU[3][31:10] == 22'b1 ? 32'd21:reg_temp_CPU[3][31:9] == 23'b1 ? 32'd22:reg_temp_CPU[3][31:8] == 24'b1 ? 32'd23:reg_temp_CPU[3][31:7] == 25'b1 ? 32'd24:reg_temp_CPU[3][31:6] == 26'b1 ? 32'd25:reg_temp_CPU[3][31:5] == 27'b1 ? 32'd26:reg_temp_CPU[3][31:4] == 28'b1 ? 32'd27:reg_temp_CPU[3][31:3] == 29'b1 ? 32'd28:reg_temp_CPU[3][31:2] == 30'b1 ? 32'd29:reg_temp_CPU[3][31:1] == 31'b1 ? 32'd30:reg_temp_CPU[3][31:0] == 32'b1 ? 32'd31:32'd32);
regfile_for_pc regfile_PC(clk,reset,reg_temp_CPU[1],data_in[81],reg_temp_CPU[2]);
selector_for2 selector4_4(mem_mux_select,(reg_temp_CPU[2]-4194304)/4,reg_temp_CPU[0]/4+2048,reg_temp_CPU[31]);
selectorLBLHLW selector_1(data_in[17:16],reg_temp_CPU[33],reg_temp_CPU[29],reg_temp_CPU[0],reg_temp_CPU[28]);
dist_mem_gen_0 DMEM(reg_temp_CPU[31],reg_temp_CPU[28],clk,data_in[83] && (reg_temp_CPU[31][31] == 0),reg_temp_CPU[29]); 
instruction_regfile instruction_temp(clk,data_in[27],reg_temp_CPU[29],reg_temp_CPU[27]);
assign reg_temp_CPU[25]=(reg_temp_CPU[27][15]==1)?{14'b1,reg_temp_CPU[27][15:0],2'b0}:{14'b0,reg_temp_CPU[27][15:0],2'b0};
assign data_in[0]=data_in[54]&reg_temp_CPU[27][15];
assign reg_temp_CPU[24]={data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],data_in[0],reg_temp_CPU[27][15:0]};
assign reg_temp_CPU[23]=(data_in[56])?{27'b0,reg_temp_CPU[27][10:6]}:{27'b0,reg_temp_CPU[27][25:21]};
assign reg_temp_CPU[26]={reg_temp_CPU[2][31:28],reg_temp_CPU[27][25:0],2'b0};
selector_for4 data_mux_sel1(data_in[42:41],reg_temp_CPU[3],reg_temp_CPU[0],reg_temp_CPU[26],reg_temp_CPU[22],reg_temp_CPU[1]);
selector_for4 data_mux_sel2(data_in[47:46],reg_temp_CPU[23],reg_temp_CPU[3],reg_temp_CPU[27],reg_temp_CPU[2],reg_temp_CPU[21]);
selector_for8_8 data_mux_sel3(data_in[45:43],reg_temp_CPU[33],reg_temp_CPU[24],reg_temp_CPU[25],reg_temp_CPU[20]);  
assign reg_temp_CPU[19]={31'b0,(data_in[29]&data_in[58])|(data_in[30]&~data_in[58])};

wire mul_clk;
wire e_reset;
wire [31:0]a;
wire [31:0]b;
wire [63:0]z;
wire mul_clk1;
wire e_reset1;
wire [31:0]a1;
wire [31:0]b1;
wire [63:0]z1;

wire [31:0]div_te;
wire [31:0]div_tq;
wire clk_3;
wire reset3;
wire start3;
wire [31:0]re;
wire [31:0]qe;
wire busd;

wire [31:0]div_te1;
wire [31:0]div_tq1;
wire clk_31;
wire reset31;
wire start31;
wire [31:0]re1;
wire [31:0]qe1;
wire busd1;

control temp(EN_in,SW1,RST,Red1,Red2,Yellow1,Yellow2,Green1,Green2);

sign_mult sign_mul(mul_start,clk,reset,{reg_temp_CPU[3],reg_temp_CPU[33]},{reg_temp_CPU[16],reg_temp_CPU[15]});
DIVU_TEMP out_instruction(div_te,div_tq,start3,clk_3,reset3,re,qe,busd);
sign_div sign({reg_temp_CPU[3],reg_temp_CPU[33]},data_in[18],clk,reset,{reg_temp_CPU[13],reg_temp_CPU[11]},data_in[1]);
unsign_mult unsign_mult1(data_in[12],clk,reset,{reg_temp_CPU[3],reg_temp_CPU[33]},{reg_temp_CPU[18],reg_temp_CPU[17]});



DIV_temp out_instruction1(div_te1,div_tq1,start31,clk_31,reset31,re1,qe1,busd1);

unsign_divu unsign({reg_temp_CPU[3],reg_temp_CPU[33]},data_in[18],clk,reset,{reg_temp_CPU[14],reg_temp_CPU[12]},divu_busy);
MUL_temp tem(mul_clk,e_reset,a,b,z);
MULTU_temp tem1(mul_clk1,e_reset1,a1,b1,z1);
mux_for4 regfile_HI(clk,data_in[24],data_in[23:22],reg_temp_CPU[12],reg_temp_CPU[11],reg_temp_CPU[18],reg_temp_CPU[3],reg_temp_CPU[10]);
mux_for4 regfile_LO(clk,data_in[21],data_in[20:19],reg_temp_CPU[14],reg_temp_CPU[13],reg_temp_CPU[17],reg_temp_CPU[3],reg_temp_CPU[9]);
decoder deceded(iDATA,iEna,ODATA);
regfile_for_cp0 regfile_CP0(clk,reset,{data_in[33],data_in[32]},reg_temp_CPU[2]-4,data_in[11:7],reg_temp_CPU[33],{data_in[40],data_in[2]},data_in[6:3],{reg_temp_CPU[8],reg_temp_CPU[7],reg_temp_CPU[22]});



alu_tp aluer(ip_data,io_data,cal,resul,ro,rry,geti,erflo);
mux_for7 selector(data_in[13],data_in[15:14],reg_temp_CPU[30],reg_temp_CPU[0],reg_temp_CPU[6]);

dispdecoder temp_control(data_in_sge,data_out_sge);

data_selector selector1(data_in[63:60],{reg_temp_CPU[19],reg_temp_CPU[6]},{reg_temp_CPU[0],reg_temp_CPU[2]},{reg_temp_CPU[4],reg_temp_CPU[10]},reg_temp_CPU[9],reg_temp_CPU[15],reg_temp_CPU[8],reg_temp_CPU[5]);
wire [3:0]IDATA_3;
wire [6:0]ODATA_3;
display7 dispayer(IDATA_3,ODATA_3);

CPU54_regfiles cpu_ref(clk,reset,data_in[79],data_in[73:69],data_in[68:64],data_in[78:74],reg_temp_CPU[5],reg_temp_CPU[3],reg_temp_CPU[33]);

wire iSA;
wire [7:0]iData_a;
wire [7:0]iData_b;
wire [8:0]oData;
wire oData_C;
Adder pcreg(iSA,iData_a,iData_b,oData,oData_C);

Z_tempreg regfile_Z(data_in[26],reg_temp_CPU[32],reg_temp_CPU[0]);
calculator ALU(reg_temp_CPU[21],reg_temp_CPU[20],data_in[51:48],reg_temp_CPU[32],data_in[31],data_in[30],data_in[29]);
assign cpu_out_inst = reg_temp_CPU[27];assign cpu_out_pc = reg_temp_CPU[2];assign cpu_out_alu = reg_temp_CPU[32];endmodule