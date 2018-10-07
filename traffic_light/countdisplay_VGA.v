
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/16 21:07:39
// Design Name: 
// Module Name: vga_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps    
        
    module countdisplay_VGA(
        input clk,    
        input rst,    
        input [1:0]btn,
        input [1:0]btn2,
        input [1:0]count_light,
        input [3:0]count_55_0,
        input [3:0]count_55_1,
        input [3:0]turn_left_en,
        output reg [2:0] r,    
        output reg [2:0] g,    
        output reg [1:0] b,    
        output hs,    
        output vs    
        );    
        
        parameter UP_BOUND = 31;    
        parameter DOWN_BOUND = 510;    
        parameter LEFT_BOUND = 144;    
        parameter RIGHT_BOUND = 783;
        reg [9:0]jiantou_up_position[7:0],jiantou_down_position[7:0],jiantou_left_position[7:0],jiantou_right_position[7:0];        
        reg [10:0]jiantou_down_left[10:0],jiantou_down_right[10:0],jiantou_down_up[10:0],jiantou_down_down[10:0];
        reg [19:0]jiantou_double_left[16:0],jiantou_double_right[16:0],jiantou_double_up[16:0],jiantou_double_down[16:0];
        reg [19:0]jiantou_double_left1[16:0],jiantou_double_right1[16:0],jiantou_double_up1[16:0],jiantou_double_down1[16:0];
        reg h_speed[3:0], v_speed[3:0];    
        reg [9:0]up_pos[3:0],down_pos[3:0],left_pos[3:0],right_pos[3:0];    
        reg [9:0]black_line_up[3:0],black_line_down[3:0],black_line_left[3:0],black_line_right[3:0];
        wire pclk;    
        reg [1:0]count;    
        reg [9:0]hcount, vcount;
        reg [9:0]yellow_line_up[3:0],yellow_line_down[3:0],yellow_line_left[3:0],yellow_line_right[3:0]; 
        //reg [9:0]jiantou_juxing_up[7:0],jiantou_juxing_down[7:0],jiantou_juxing_left[7:0],jiantou_juxing_right[7:0];
        reg [9:0]down_car_position_up[4:0],down_car_position_down[4:0],down_car_position_left[4:0],down_car_position_right[4:0];
        reg [9:0]up_car_position_up[4:0],up_car_position_down[4:0],up_car_position_left[4:0],up_car_position_right[4:0];
        reg [9:0]left_car_position_up[4:0],left_car_position_down[4:0],left_car_position_left[4:0],left_car_position_right[4:0];
        reg [9:0]right_car_position_up[4:0],right_car_position_down[4:0],right_car_position_left[4:0],right_car_position_right[4:0];
        //reg [9:0]jiantou_sanjiao_up[7:0],jiantou_sanjiao_down[7:0],jiantou_sanjiao_left[7:0],jiantou_sanjiao_right[7:0];
       // reg [50:0]detail[50:0];
        // 获得像素时钟25MHz 
        reg [9:0]VGA_count_up[3:0],VGA_count_down[3:0],VGA_count_left[3:0],VGA_count_right[3:0];   
        reg [9:0]divide_line_up[3:0],divide_line_down[3:0],divide_line_left[3:0],divide_line_right[3:0];
        reg [9:0]car_turn_right_up[3:0],car_turn_right_down[3:0],car_turn_right_left[3:0],car_turn_right_right[3:0];
        reg [9:0]car_turn_left_up[3:0],car_turn_left_down[3:0],car_turn_left_left[3:0],car_turn_left_right[3:0];
        assign pclk = count[1]; 
        reg [9:0]shuzi_up,shuzi_down,shuzi_left,shuzi_right;
        reg [19:0]count_left[19:0],count_right[19:0];
        

        
        
        
        
     
        always @ (posedge clk)    
        begin
            if (rst==0)    
                count <= 0;    
            else    
                count <= count+1;    
        end    
            
        // 列计数与行同步    
        assign hs = (hcount < 96) ? 0 : 1;    
        always @ (posedge pclk or posedge rst)    
        begin    
            if (rst==0)    
                hcount <= 0;    
            else if (hcount == 799)    
                hcount <= 0;    
            else    
                hcount <= hcount+1;    
        end    
            
        // 行计数与场同步    
        assign vs = (vcount < 2) ? 0 : 1;    
        always @ (posedge pclk or posedge rst)    
        begin    
            if (rst==0)    
                vcount <= 0;    
            else if (hcount == 799) begin    
                if (vcount == 520)    
                    vcount <= 0;    
                else    
                    vcount <= vcount+1;    
            end    
            else    
                vcount <= vcount;    
        end    
            
        // 显示方块    
        always @ (posedge pclk or posedge rst)    
        begin    
                if (rst==0) 
                begin    
                r <= 0;    
                g <= 0;    
                b <= 0;
                end    
                else begin
                if(((vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=left_pos[0] && hcount<=right_pos[0]&&btn==2'b00)
                ||(vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=(left_pos[0]-30) && hcount<=(right_pos[0]-30)&&btn==2'b00))&&count_light==2'b01)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;    
                end
                else if(((vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=left_pos[0] && hcount<=right_pos[0]&&btn==2'b01)
                ||(vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=(left_pos[0]-30) && hcount<=(right_pos[0]-30)&&btn==2'b01))&&count_light==2'b01)                  
                begin    
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;    
                end 
                else if(((vcount>=up_pos[0] && vcount<=down_pos[0]&& hcount>=left_pos[0] && hcount<=right_pos[0]&&btn==2'b11)
                ||(vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=(left_pos[0]-30) && hcount<=(right_pos[0]-30)&&btn==2'b11))&&count_light==2'b01) 
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;    
                end
                else if(((vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=left_pos[0] && hcount<=right_pos[0])
                ||(vcount>=up_pos[0] && vcount<=down_pos[0]    
                && hcount>=(left_pos[0]-30) && hcount<=(right_pos[0]-30)))&&count_light!=2'b01)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;    
                end
                else if(vcount>=up_pos[0] && vcount<=down_pos[0]&& hcount>=(left_pos[0]+30) && hcount<=(right_pos[0]+30)) 
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;    
                end                                                                            
                else if(((vcount>=up_pos[1] && vcount<=down_pos[1]&&hcount>=left_pos[1]&&hcount<=right_pos[1]&&btn2==2'b00)
                ||(vcount>=(up_pos[1]+30) && vcount<=(down_pos[1]+30)&&hcount>=left_pos[1]&&hcount<=right_pos[1]&&btn2==2'b00))&&count_light==2'b10)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;    
                end   
                else if(((vcount>=up_pos[1]&&vcount<=down_pos[1]&&hcount>=left_pos[1]&&hcount<=right_pos[1]&&btn2==2'b01)
                ||(vcount>=(up_pos[1]+30) && vcount<=(down_pos[1]+30)&&hcount>=left_pos[1]&&hcount<=right_pos[1]&&btn2==2'b01))&&count_light==2'b10)                
                begin    
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;    
                end
                else if(((vcount>=up_pos[1]&&vcount<=down_pos[1]&&hcount>=left_pos[1]&&hcount<=right_pos[1]&&btn2==2'b11)
                ||(vcount>=(up_pos[1]+30) && vcount<=(down_pos[1]+30)&&hcount>=left_pos[1]&&hcount<=right_pos[1]&&btn2==2'b11))&&count_light==2'b10)
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;      
                end
                else if(((vcount>=up_pos[1]&&vcount<=down_pos[1]&&hcount>=left_pos[1]&&hcount<=right_pos[1])
                ||(vcount>=(up_pos[1]+30) && vcount<=(down_pos[1]+30)&&hcount>=left_pos[1]&&hcount<=right_pos[1]))&&count_light!=2'b10)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;      
                end 
                else if(vcount>=(up_pos[1]-30) && vcount<=(down_pos[1]-30)&& hcount>=(left_pos[1]) && hcount<=(right_pos[1])) 
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;    
                end
                else if(((vcount>=up_pos[2] && vcount<=down_pos[2]    
                && hcount>=left_pos[2] && hcount<=right_pos[2])
                ||(vcount>=up_pos[2] && vcount<=down_pos[2]    
                && hcount>=(left_pos[2]+30) && hcount<=(right_pos[2]+30)))&&count_light==2'b11)
                begin 
                if(btn==2'b01||btn2==2'b01)
                begin   
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;    
                end
                else begin
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;
                end
                end
                else if(((vcount>=up_pos[2] && vcount<=down_pos[2]    
                && hcount>=left_pos[2] && hcount<=right_pos[2])
                ||(vcount>=up_pos[2] && vcount<=down_pos[2]    
                && hcount>=(left_pos[2]+30) && hcount<=(right_pos[2]+30)))&&count_light!=2'b11)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;    
                end
                else if(vcount>=up_pos[2] && vcount<=down_pos[2]&& hcount>=(left_pos[2]-30) && hcount<=(right_pos[2]-30)) 
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;    
                end 
                else if(((vcount>=up_pos[3] && vcount<=down_pos[3]&&hcount>=left_pos[3]&&hcount<=right_pos[3]&&btn2==2'b00)
                ||(vcount>=(up_pos[3]-30) && vcount<=(down_pos[3]-30)&&hcount>=left_pos[3]&&hcount<=right_pos[3]&&btn2==2'b00))&&count_light!=2'b11&&count_light!=2'b10&&count_light!=2'b01)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;    
                end   
                else if(((vcount>=up_pos[3]&&vcount<=down_pos[3]&&hcount>=left_pos[3]&&hcount<=right_pos[3]&&btn2==2'b01)
                ||(vcount>=(up_pos[3]-30) && vcount<=(down_pos[3]-30)&&hcount>=left_pos[3]&&hcount<=right_pos[3]&&btn2==2'b01))&&count_light!=2'b11&&count_light!=2'b10&&count_light!=2'b01)                
                begin    
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;    
                end
                else if(((vcount>=up_pos[3]&&vcount<=down_pos[3]&&hcount>=left_pos[3]&&hcount<=right_pos[3]&&btn2==2'b11)
                ||(vcount>=(up_pos[3]-30) && vcount<=(down_pos[3]-30)&&hcount>=left_pos[3]&&hcount<=right_pos[3]&&btn2==2'b11))&&count_light!=2'b11&&count_light!=2'b10&&count_light!=2'b01)
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;      
                end                                               
                else if(((vcount>=up_pos[3]&&vcount<=down_pos[3]&&hcount>=left_pos[3]&&hcount<=right_pos[3])
                ||(vcount>=(up_pos[3]-30) && vcount<=(down_pos[3]-30)&&hcount>=left_pos[3]&&hcount<=right_pos[3]))&&count_light!=2'b00)
                begin    
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00;      
                end 
                else if(vcount>=(up_pos[3]+30) && vcount<=(down_pos[3]+30)&& hcount>=(left_pos[3]) && hcount<=(right_pos[3])) 
                begin    
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00;    
                end                                                                                
                else if(vcount>=black_line_up[0]&&vcount<=black_line_down[0]
                &&hcount>=black_line_left[0]&&hcount<=black_line_right[0]
                &&(hcount%10)<3&&btn==2'b00)
                begin
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(vcount>=black_line_up[0]&&vcount<=black_line_down[0]
                &&hcount>=black_line_left[0]&&hcount<=black_line_right[0]
                &&(hcount%10)<3&&btn==2'b01)
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(vcount>=black_line_up[0]&&vcount<=black_line_down[0]
                &&hcount>=black_line_left[0]&&hcount<=black_line_right[0]
                &&(hcount%10)<3&&btn==2'b11)
                begin
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00; 
                end                  
                else if(vcount>=black_line_up[1]&&vcount<=black_line_down[1]
                &&hcount>=black_line_left[1]&&hcount<=black_line_right[1]
                &&(hcount%10)<3&&btn==2'b00)
                begin
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(vcount>=black_line_up[1]&&vcount<=black_line_down[1]
                &&hcount>=black_line_left[1]&&hcount<=black_line_right[1]
                &&(hcount%10)<3&&btn==2'b01)
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(vcount>=black_line_up[1]&&vcount<=black_line_down[1]
                &&hcount>=black_line_left[1]&&hcount<=black_line_right[1]
                &&(hcount%10)<3&&btn==2'b11)
                begin
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00; 
                end
                else if(hcount>=black_line_left[2]&&hcount<=black_line_right[2]
                &&vcount>=black_line_up[2]
                &&(vcount%10)<3&&vcount<=black_line_down[2]&&btn2==2'b00)
                begin
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(hcount>=black_line_left[2]&&hcount<=black_line_right[2]
                &&vcount>=black_line_up[2]
                &&(vcount%10)<3&&vcount<=black_line_down[2]&&btn2==2'b01)
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(hcount>=black_line_left[2]&&hcount<=black_line_right[2]
                &&vcount>=black_line_up[2]
                &&(vcount%10)<3&&vcount<=black_line_down[2]&&btn2==2'b11)
                begin
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00; 
                end                      
                else if(hcount>=black_line_left[3]&&hcount<=black_line_right[3]
                &&vcount>=black_line_up[3]
                &&(vcount%10)<3&&vcount<=black_line_down[3]&&btn2==2'b00)
                begin
                r <= 3'b000;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(hcount>=black_line_left[3]&&hcount<=black_line_right[3]
                &&vcount>=black_line_up[3]
                &&(vcount%10)<3&&vcount<=black_line_down[3]&&btn2==2'b01)
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00; 
                end
                else if(hcount>=black_line_left[3]&&hcount<=black_line_right[3]
                &&vcount>=black_line_up[3]
                &&(vcount%10)<3&&vcount<=black_line_down[3]&&btn2==2'b11)
                begin
                r <= 3'b111;    
                g <= 3'b000;    
                b <= 2'b00; 
                end                 
                else if(hcount>=yellow_line_left[0]&&hcount<=yellow_line_right[0]
                &&vcount>=yellow_line_up[0]&&vcount<=yellow_line_down[0])
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;                 
                end 
                else if(hcount>=yellow_line_left[2]&&hcount<=yellow_line_right[2]
                &&vcount>=yellow_line_up[2]&&vcount<=yellow_line_down[2])
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;                 
                end
                else if(hcount>=yellow_line_left[1]&&hcount<=yellow_line_right[1]
                &&vcount>=yellow_line_up[1]&&vcount<=yellow_line_down[1])
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;                 
                end  
                else if(hcount>=yellow_line_left[3]&&hcount<=yellow_line_right[3]
                &&vcount>=yellow_line_up[3]&&vcount<=yellow_line_down[3])
                begin
                r <= 3'b111;    
                g <= 3'b111;    
                b <= 2'b00;                 
                end

                else if(hcount>=divide_line_left[0]&&hcount<=divide_line_right[0]
                &&vcount>=divide_line_up[0]&&vcount<=divide_line_down[0]&&(hcount%10<3)&&(hcount<230||hcount>700))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if(hcount>=divide_line_left[1]&&hcount<=divide_line_right[1]
                &&vcount>=divide_line_up[1]&&vcount<=divide_line_down[1]&&(hcount%10<3)&&(hcount<230||hcount>700))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end                
                else if(hcount>=divide_line_left[2]&&hcount<=divide_line_right[2]
                &&vcount>=divide_line_up[2]&&vcount<=divide_line_down[2]&&(vcount%10<3)&&(vcount<120||vcount>415))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if(hcount>=divide_line_left[3]&&hcount<=divide_line_right[3]
                &&vcount>=divide_line_up[3]&&vcount<=divide_line_down[3]&&(vcount%10<3)&&(vcount<120||vcount>415))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end

                else if((hcount>=car_turn_right_left[0]&&hcount<=car_turn_right_right[0]&&
                vcount>=car_turn_right_up[0]&&vcount<=car_turn_right_down[0])||
                (hcount>=car_turn_right_left[0]&&hcount<=car_turn_right_right[0]&&
                vcount>=car_turn_right_up[0]+6&&vcount<=car_turn_right_down[0]+6)||
                (hcount>=car_turn_right_left[0]&&hcount<=car_turn_right_right[0]&&
                vcount>=car_turn_right_up[0]+12&&vcount<=car_turn_right_down[0]+12))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;               
                end                                           
                else if((hcount>=car_turn_right_left[2]&&hcount<=car_turn_right_right[2]&&
                vcount>=car_turn_right_up[2]&&vcount<=car_turn_right_down[2])||
                (hcount>=car_turn_right_left[2]&&hcount<=car_turn_right_right[2]&&
                vcount>=car_turn_right_up[2]-6&&vcount<=car_turn_right_down[2]-6)||
                (hcount>=car_turn_right_left[2]&&hcount<=car_turn_right_right[2]&&
                vcount>=car_turn_right_up[2]-12&&vcount<=car_turn_right_down[2]-12)||
                (hcount>=car_turn_right_left[2]&&hcount<=car_turn_right_right[2]&&
                vcount>=car_turn_right_up[2]-18&&vcount<=car_turn_right_down[2]-18))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;               
                end
                else if((hcount>=car_turn_right_left[3]&&hcount<=car_turn_right_right[3]&&
                vcount>=car_turn_right_up[3]&&vcount<=car_turn_right_down[3])||
                (hcount>=car_turn_right_left[3]-6&&hcount<=car_turn_right_right[3]-6&&
                vcount>=car_turn_right_up[3]&&vcount<=car_turn_right_down[3])||
                (hcount>=car_turn_right_left[3]-12&&hcount<=car_turn_right_right[3]-12&&
                vcount>=car_turn_right_up[3]&&vcount<=car_turn_right_down[3])||
                (hcount>=car_turn_right_left[3]-18&&hcount<=car_turn_right_right[3]-18&&
                vcount>=car_turn_right_up[3]&&vcount<=car_turn_right_down[3]))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;               
                end 
                else if((hcount>=car_turn_left_left[3]&&hcount<=car_turn_left_right[3]&&
                vcount>=car_turn_left_up[3]&&vcount<=car_turn_left_down[3])||
                (hcount>=car_turn_left_left[3]-6&&hcount<=car_turn_left_right[3]-6&&
                vcount>=car_turn_left_up[3]&&vcount<=car_turn_left_down[3])||
                (hcount>=car_turn_left_left[3]-12&&hcount<=car_turn_left_right[3]-12&&
                vcount>=car_turn_left_up[3]&&vcount<=car_turn_left_down[3]))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;                               
                end                                
                else if((hcount>=car_turn_left_left[0]&&hcount<=car_turn_left_right[0]&&
                vcount>=car_turn_left_up[0]&&vcount<=car_turn_left_down[0])||
                (hcount>=car_turn_left_left[0]&&hcount<=car_turn_left_right[0]&&
                vcount>=car_turn_left_up[0]+6&&vcount<=car_turn_left_down[0]+6)||
                (hcount>=car_turn_left_left[0]&&hcount<=car_turn_left_right[0]&&
                vcount>=car_turn_left_up[0]+12&&vcount<=car_turn_left_down[0]+12))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;                               
                end
                else if((hcount>=car_turn_left_left[1]&&hcount<=car_turn_left_right[1]&&
                vcount>=car_turn_left_up[1]&&vcount<=car_turn_left_down[1])||
                (hcount>=car_turn_left_left[1]+6&&hcount<=car_turn_left_right[1]+6&&
                vcount>=car_turn_left_up[1]&&vcount<=car_turn_left_down[1])||
                (hcount>=car_turn_left_left[1]+12&&hcount<=car_turn_left_right[1]+12&&
                vcount>=car_turn_left_up[1]&&vcount<=car_turn_left_down[1]))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;                               
                end
                else if((hcount>=car_turn_left_left[2]&&hcount<=car_turn_left_right[2]&&
                vcount>=car_turn_left_up[2]&&vcount<=car_turn_left_down[2])||
                (hcount>=car_turn_left_left[2]&&hcount<=car_turn_left_right[2]&&
                vcount>=car_turn_left_up[2]-6&&vcount<=car_turn_left_down[2]-6)||
                (hcount>=car_turn_left_left[2]&&hcount<=car_turn_left_right[2]&&
                vcount>=car_turn_left_up[2]-12&&vcount<=car_turn_left_down[2]-12))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;                               
                end                                  
                else if((hcount>=down_car_position_left[0]&&hcount<=down_car_position_right[0]
                &&vcount>=down_car_position_up[0]&&vcount<=down_car_position_down[0])||
                (hcount>=down_car_position_left[0]&&hcount<=down_car_position_right[0]
                &&vcount>=(down_car_position_up[0]+12)&&vcount<=(down_car_position_down[0]+12))||
                (hcount>=down_car_position_left[0]&&hcount<=down_car_position_right[0]
                &&vcount>=(down_car_position_up[0]+6)&&vcount<=(down_car_position_down[0]+6))||
                (hcount>=down_car_position_left[0]&&hcount<=down_car_position_right[0]
               &&vcount>=(down_car_position_up[0]+18)&&vcount<=(down_car_position_down[0]+18))|| 
               (hcount>=down_car_position_left[0]+15&&hcount<=down_car_position_right[0]+15
               &&vcount>=down_car_position_up[0]&&vcount<=down_car_position_down[0])||
               (hcount>=down_car_position_left[0]+15&&hcount<=down_car_position_right[0]+15
               &&vcount>=(down_car_position_up[0]+12)&&vcount<=(down_car_position_down[0]+12))||
               (hcount>=down_car_position_left[0]+15&&hcount<=down_car_position_right[0]+15
               &&vcount>=(down_car_position_up[0]+6)&&vcount<=(down_car_position_down[0]+6))||
               (hcount>=down_car_position_left[0]+15&&hcount<=down_car_position_right[0]+15
               &&vcount>=(down_car_position_up[0]+18)&&vcount<=(down_car_position_down[0]+18))||           
               (hcount>=down_car_position_left[0]+30&&hcount<=down_car_position_right[0]+30
               &&vcount>=down_car_position_up[0]&&vcount<=down_car_position_down[0])||
               (hcount>=down_car_position_left[0]+30&&hcount<=down_car_position_right[0]+30
               &&vcount>=(down_car_position_up[0]+12)&&vcount<=(down_car_position_down[0]+12))||
               (hcount>=down_car_position_left[0]+30&&hcount<=down_car_position_right[0]+30
               &&vcount>=(down_car_position_up[0]+6)&&vcount<=(down_car_position_down[0]+6))||
               (hcount>=down_car_position_left[0]+30&&hcount<=down_car_position_right[0]+30
               &&vcount>=(down_car_position_up[0]+18)&&vcount<=(down_car_position_down[0]+18))               
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if((hcount>=down_car_position_left[0]+60+60&&hcount<=down_car_position_right[0]+60+60
                &&vcount>=down_car_position_up[0]&&vcount<=down_car_position_down[0])||
                (hcount>=down_car_position_left[0]+60+60&&hcount<=down_car_position_right[0]+60+60
                &&vcount>=(down_car_position_up[0]+12)&&vcount<=(down_car_position_down[0]+12))||
                (hcount>=down_car_position_left[0]+60+60&&hcount<=down_car_position_right[0]+60+60
                &&vcount>=(down_car_position_up[0]+6)&&vcount<=(down_car_position_down[0]+6))||
                (hcount>=down_car_position_left[0]+60+60&&hcount<=down_car_position_right[0]+60+60
               &&vcount>=(down_car_position_up[0]+18)&&vcount<=(down_car_position_down[0]+18))||
               (hcount>=down_car_position_left[0]+75+60&&hcount<=down_car_position_right[0]+75+60
               &&vcount>=down_car_position_up[0]&&vcount<=down_car_position_down[0])||
               (hcount>=down_car_position_left[0]+75+60&&hcount<=down_car_position_right[0]+75+60
               &&vcount>=(down_car_position_up[0]+12)&&vcount<=(down_car_position_down[0]+12))||
               (hcount>=down_car_position_left[0]+75+60&&hcount<=down_car_position_right[0]+75+60
               &&vcount>=(down_car_position_up[0]+6)&&vcount<=(down_car_position_down[0]+6))||
               (hcount>=down_car_position_left[0]+75+60&&hcount<=down_car_position_right[0]+75+60
               &&vcount>=(down_car_position_up[0]+18)&&vcount<=(down_car_position_down[0]+18))||                             
               (hcount>=down_car_position_left[0]+90+60&&hcount<=down_car_position_right[0]+90+60
               &&vcount>=down_car_position_up[0]&&vcount<=down_car_position_down[0])||
               (hcount>=down_car_position_left[0]+90+60&&hcount<=down_car_position_right[0]+90+60
               &&vcount>=(down_car_position_up[0]+12)&&vcount<=(down_car_position_down[0]+12))||
               (hcount>=down_car_position_left[0]+90+60&&hcount<=down_car_position_right[0]+90+60
               &&vcount>=(down_car_position_up[0]+6)&&vcount<=(down_car_position_down[0]+6))||
               (hcount>=down_car_position_left[0]+90+60&&hcount<=down_car_position_right[0]+90+60
               &&vcount>=(down_car_position_up[0]+18)&&vcount<=(down_car_position_down[0]+18))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end                 
                else if((hcount>=up_car_position_left[0]&&hcount<=up_car_position_right[0]
                &&vcount>=up_car_position_up[0]&&vcount<=up_car_position_down[0])||
                (hcount>=up_car_position_left[0]&&hcount<=up_car_position_right[0]
                &&vcount>=(up_car_position_up[0]-12)&&vcount<=(up_car_position_down[0]-12))||
                (hcount>=up_car_position_left[0]&&hcount<=up_car_position_right[0]
                &&vcount>=(up_car_position_up[0]-6)&&vcount<=(up_car_position_down[0]-6))||
                (hcount>=up_car_position_left[0]&&hcount<=up_car_position_right[0]
               &&vcount>=(up_car_position_up[0]-18)&&vcount<=(up_car_position_down[0]-18))||         
               (hcount>=up_car_position_left[0]+15&&hcount<=up_car_position_right[0]+15
               &&vcount>=up_car_position_up[0]&&vcount<=up_car_position_down[0])||
               (hcount>=up_car_position_left[0]+15&&hcount<=up_car_position_right[0]+15
               &&vcount>=(up_car_position_up[0]-12)&&vcount<=(up_car_position_down[0]-12))||
               (hcount>=up_car_position_left[0]+15&&hcount<=up_car_position_right[0]+15
               &&vcount>=(up_car_position_up[0]-6)&&vcount<=(up_car_position_down[0]-6))||
               (hcount>=up_car_position_left[0]+15&&hcount<=up_car_position_right[0]+15
               &&vcount>=(up_car_position_up[0]-18)&&vcount<=(up_car_position_down[0]-18))||                                         
               (hcount>=up_car_position_left[0]+30&&hcount<=up_car_position_right[0]+30
               &&vcount>=up_car_position_up[0]&&vcount<=up_car_position_down[0])||
               (hcount>=up_car_position_left[0]+30&&hcount<=up_car_position_right[0]+30
               &&vcount>=(up_car_position_up[0]-12)&&vcount<=(up_car_position_down[0]-12))||
               (hcount>=up_car_position_left[0]+30&&hcount<=up_car_position_right[0]+30
               &&vcount>=(up_car_position_up[0]-6)&&vcount<=(up_car_position_down[0]-6))||
               (hcount>=up_car_position_left[0]+30&&hcount<=up_car_position_right[0]+30
               &&vcount>=(up_car_position_up[0]-18)&&vcount<=(up_car_position_down[0]-18))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if((hcount>=up_car_position_left[0]-60-40&&hcount<=up_car_position_right[0]-60-40
                &&vcount>=up_car_position_up[0]&&vcount<=up_car_position_down[0])||
                (hcount>=up_car_position_left[0]-60-40&&hcount<=up_car_position_right[0]-60-40
                &&vcount>=(up_car_position_up[0]-12)&&vcount<=(up_car_position_down[0]-12))||
                (hcount>=up_car_position_left[0]-60-40&&hcount<=up_car_position_right[0]-60-40
                &&vcount>=(up_car_position_up[0]-6)&&vcount<=(up_car_position_down[0]-6))||
                (hcount>=up_car_position_left[0]-60-40&&hcount<=up_car_position_right[0]-60-40
               &&vcount>=(up_car_position_up[0]-18)&&vcount<=(up_car_position_down[0]-18))||
               (hcount>=up_car_position_left[0]-75-40&&hcount<=up_car_position_right[0]-75-40
               &&vcount>=up_car_position_up[0]&&vcount<=up_car_position_down[0])||
               (hcount>=up_car_position_left[0]-75-40&&hcount<=up_car_position_right[0]-75-40
               &&vcount>=(up_car_position_up[0]-12)&&vcount<=(up_car_position_down[0]-12))||
               (hcount>=up_car_position_left[0]-75-40&&hcount<=up_car_position_right[0]-75-40
               &&vcount>=(up_car_position_up[0]-6)&&vcount<=(up_car_position_down[0]-6))||
               (hcount>=up_car_position_left[0]-75-40&&hcount<=up_car_position_right[0]-75-40
               &&vcount>=(up_car_position_up[0]-18)&&vcount<=(up_car_position_down[0]-18))||                             
               (hcount>=up_car_position_left[0]-90-40&&hcount<=up_car_position_right[0]-90-40
               &&vcount>=up_car_position_up[0]&&vcount<=up_car_position_down[0])||
               (hcount>=up_car_position_left[0]-90-40&&hcount<=up_car_position_right[0]-90-40
               &&vcount>=(up_car_position_up[0]-12)&&vcount<=(up_car_position_down[0]-12))||
               (hcount>=up_car_position_left[0]-90-40&&hcount<=up_car_position_right[0]-90-40
               &&vcount>=(up_car_position_up[0]-6)&&vcount<=(up_car_position_down[0]-6))||
               (hcount>=up_car_position_left[0]-90-40&&hcount<=up_car_position_right[0]-90-40
               &&vcount>=(up_car_position_up[0]-18)&&vcount<=(up_car_position_down[0]-18))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if((hcount>=right_car_position_left[0]&&hcount<=right_car_position_right[0]
                &&vcount>=right_car_position_up[0]&&vcount<=right_car_position_down[0])||
                (hcount>=right_car_position_left[0]+6&&hcount<=right_car_position_right[0]+6
                &&vcount>=(right_car_position_up[0])&&vcount<=(right_car_position_down[0]))||
                (hcount>=right_car_position_left[0]+12&&hcount<=right_car_position_right[0]+12
                &&vcount>=(right_car_position_up[0])&&vcount<=(right_car_position_down[0]))||
                (hcount>=right_car_position_left[0]+18&&hcount<=right_car_position_right[0]+18
               &&vcount>=(right_car_position_up[0])&&vcount<=(right_car_position_down[0]))||          
               (hcount>=right_car_position_left[0]&&hcount<=right_car_position_right[0]
               &&vcount>=right_car_position_up[0]+10&&vcount<=right_car_position_down[0]+10)||
               (hcount>=right_car_position_left[0]+6&&hcount<=right_car_position_right[0]+6
               &&vcount>=(right_car_position_up[0]+10)&&vcount<=(right_car_position_down[0]+10))||
               (hcount>=right_car_position_left[0]+12&&hcount<=right_car_position_right[0]+12
               &&vcount>=(right_car_position_up[0]+10)&&vcount<=(right_car_position_down[0]+10))||
               (hcount>=right_car_position_left[0]+18&&hcount<=right_car_position_right[0]+18
               &&vcount>=(right_car_position_up[0]+10)&&vcount<=(right_car_position_down[0]+10))||                                          
               (hcount>=right_car_position_left[0]&&hcount<=right_car_position_right[0]
               &&vcount>=right_car_position_up[0]+20&&vcount<=right_car_position_down[0]+20)||
               (hcount>=right_car_position_left[0]+6&&hcount<=right_car_position_right[0]+6
               &&vcount>=(right_car_position_up[0]+20)&&vcount<=(right_car_position_down[0]+20))||
               (hcount>=right_car_position_left[0]+12&&hcount<=right_car_position_right[0]+12
               &&vcount>=(right_car_position_up[0]+20)&&vcount<=(right_car_position_down[0]+20))||
               (hcount>=right_car_position_left[0]+18&&hcount<=right_car_position_right[0]+18
               &&vcount>=(right_car_position_up[0]+20)&&vcount<=(right_car_position_down[0]+20))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if((hcount>=right_car_position_left[0]&&hcount<=right_car_position_right[0]
                &&vcount>=right_car_position_up[0]-40&&vcount<=right_car_position_down[0]-40)||
                (hcount>=right_car_position_left[0]+6&&hcount<=right_car_position_right[0]+6
                &&vcount>=(right_car_position_up[0]-40)&&vcount<=(right_car_position_down[0]-40))||
                (hcount>=right_car_position_left[0]+12&&hcount<=right_car_position_right[0]+12
                &&vcount>=(right_car_position_up[0]-40)&&vcount<=(right_car_position_down[0]-40))||
                (hcount>=right_car_position_left[0]+18&&hcount<=right_car_position_right[0]+18
               &&vcount>=(right_car_position_up[0]-40)&&vcount<=(right_car_position_down[0]-40))||           
               (hcount>=right_car_position_left[0]&&hcount<=right_car_position_right[0]
               &&vcount>=right_car_position_up[0]-20&&vcount<=right_car_position_down[0]-20)||
               (hcount>=right_car_position_left[0]+6&&hcount<=right_car_position_right[0]+6
               &&vcount>=(right_car_position_up[0]-20)&&vcount<=(right_car_position_down[0]-20))||
               (hcount>=right_car_position_left[0]+12&&hcount<=right_car_position_right[0]+12
               &&vcount>=(right_car_position_up[0]-20)&&vcount<=(right_car_position_down[0]-20))||
               (hcount>=right_car_position_left[0]+18&&hcount<=right_car_position_right[0]+18
               &&vcount>=(right_car_position_up[0]-20)&&vcount<=(right_car_position_down[0]-20))||
               (hcount>=right_car_position_left[0]&&hcount<=right_car_position_right[0]
               &&vcount>=right_car_position_up[0]-30&&vcount<=right_car_position_down[0]-30)||
               (hcount>=right_car_position_left[0]+6&&hcount<=right_car_position_right[0]+6
               &&vcount>=(right_car_position_up[0]-30)&&vcount<=(right_car_position_down[0]-30))||
               (hcount>=right_car_position_left[0]+12&&hcount<=right_car_position_right[0]+12
               &&vcount>=(right_car_position_up[0]-30)&&vcount<=(right_car_position_down[0]-30))||
               (hcount>=right_car_position_left[0]+18&&hcount<=right_car_position_right[0]+18
               &&vcount>=(right_car_position_up[0]-30)&&vcount<=(right_car_position_down[0]-30))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end 
                else if((hcount>=left_car_position_left[0]&&hcount<=left_car_position_right[0]
                &&vcount>=left_car_position_up[0]&&vcount<=left_car_position_down[0])||
                (hcount>=left_car_position_left[0]-6&&hcount<=left_car_position_right[0]-6
                &&vcount>=(left_car_position_up[0])&&vcount<=(left_car_position_down[0]))||
                (hcount>=left_car_position_left[0]-12&&hcount<=left_car_position_right[0]-12
                &&vcount>=(left_car_position_up[0])&&vcount<=(left_car_position_down[0]))||
                (hcount>=left_car_position_left[0]-18&&hcount<=left_car_position_right[0]-18
               &&vcount>=(left_car_position_up[0])&&vcount<=(left_car_position_down[0]))||                     
               (hcount>=left_car_position_left[0]&&hcount<=left_car_position_right[0]
               &&vcount>=left_car_position_up[0]-10&&vcount<=left_car_position_down[0]-10)||
               (hcount>=left_car_position_left[0]-6&&hcount<=left_car_position_right[0]-6
               &&vcount>=(left_car_position_up[0]-10)&&vcount<=(left_car_position_down[0]-10))||
               (hcount>=left_car_position_left[0]-12&&hcount<=left_car_position_right[0]-12
               &&vcount>=(left_car_position_up[0]-10)&&vcount<=(left_car_position_down[0]-10))||
               (hcount>=left_car_position_left[0]-18&&hcount<=left_car_position_right[0]-18
               &&vcount>=(left_car_position_up[0]-10)&&vcount<=(left_car_position_down[0]-10))||    
               (hcount>=left_car_position_left[0]&&hcount<=left_car_position_right[0]
               &&vcount>=left_car_position_up[0]-20&&vcount<=left_car_position_down[0]-20)||
               (hcount>=left_car_position_left[0]-6&&hcount<=left_car_position_right[0]-6
               &&vcount>=(left_car_position_up[0]-20)&&vcount<=(left_car_position_down[0]-20))||
               (hcount>=left_car_position_left[0]-12&&hcount<=left_car_position_right[0]-12
               &&vcount>=(left_car_position_up[0]-20)&&vcount<=(left_car_position_down[0]-20))||
               (hcount>=left_car_position_left[0]-18&&hcount<=left_car_position_right[0]-18
               &&vcount>=(left_car_position_up[0]-20)&&vcount<=(left_car_position_down[0]-20))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end
                else if((hcount>=left_car_position_left[0]&&hcount<=left_car_position_right[0]
                &&vcount>=left_car_position_up[0]+20&&vcount<=left_car_position_down[0]+20)||
                (hcount>=left_car_position_left[0]-6&&hcount<=left_car_position_right[0]-6
                &&vcount>=(left_car_position_up[0]+20)&&vcount<=(left_car_position_down[0]+20))||
                (hcount>=left_car_position_left[0]-12&&hcount<=left_car_position_right[0]-12
                &&vcount>=(left_car_position_up[0]+20)&&vcount<=(left_car_position_down[0]+20))||
                (hcount>=left_car_position_left[0]-18&&hcount<=left_car_position_right[0]-18
               &&vcount>=(left_car_position_up[0]+20)&&vcount<=(left_car_position_down[0]+20))||                           
               (hcount>=left_car_position_left[0]&&hcount<=left_car_position_right[0]
               &&vcount>=left_car_position_up[0]+30&&vcount<=left_car_position_down[0]+30)||
               (hcount>=left_car_position_left[0]-6&&hcount<=left_car_position_right[0]-6
               &&vcount>=(left_car_position_up[0]+30)&&vcount<=(left_car_position_down[0]+30))||
               (hcount>=left_car_position_left[0]-12&&hcount<=left_car_position_right[0]-12
               &&vcount>=(left_car_position_up[0]+30)&&vcount<=(left_car_position_down[0]+30))||
               (hcount>=left_car_position_left[0]-18&&hcount<=left_car_position_right[0]-18
               &&vcount>=(left_car_position_up[0]+30)&&vcount<=(left_car_position_down[0]+30))|| 
               (hcount>=left_car_position_left[0]&&hcount<=left_car_position_right[0]
               &&vcount>=left_car_position_up[0]+40&&vcount<=left_car_position_down[0]+40)||
               (hcount>=left_car_position_left[0]-6&&hcount<=left_car_position_right[0]-6
               &&vcount>=(left_car_position_up[0]+40)&&vcount<=(left_car_position_down[0]+40))||
               (hcount>=left_car_position_left[0]-12&&hcount<=left_car_position_right[0]-12
               &&vcount>=(left_car_position_up[0]+40)&&vcount<=(left_car_position_down[0]+40))||
               (hcount>=left_car_position_left[0]-18&&hcount<=left_car_position_right[0]-18
               &&vcount>=(left_car_position_up[0]+40)&&vcount<=(left_car_position_down[0]+40))                              
               )
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;
                end                            
                else if((hcount>=car_turn_right_left[1]+6&&hcount<=car_turn_right_right[1]+6&&
                vcount>=car_turn_right_up[1]&&vcount<=car_turn_right_down[1])||
                (hcount>=car_turn_right_left[1]+12&&hcount<=car_turn_right_right[2]+12&&
                vcount>=car_turn_right_up[1]&&vcount<=car_turn_right_down[1])||
                (hcount>=car_turn_right_left[1]+18&&hcount<=car_turn_right_right[1]+18&&
                vcount>=car_turn_right_up[1]&&vcount<=car_turn_right_down[1])||
                (hcount>=car_turn_right_left[1]&&hcount<=car_turn_right_right[1]&&
                vcount>=car_turn_right_up[1]&&vcount<=car_turn_right_down[1]))
                begin
                r<=3'b111;
                g<=3'b000;
                b<=2'b00;               
                end  
                else if(hcount>=shuzi_left&&hcount<shuzi_right&&vcount>=shuzi_up&&vcount<shuzi_down&&
                count_left[(vcount-shuzi_up)][19-(hcount-shuzi_left)]==1&&count_light==2'b01)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if(hcount>=shuzi_left-30&&hcount<shuzi_right-30&&vcount>=shuzi_up&&vcount<shuzi_down&&
                count_right[(vcount-shuzi_up)][19-(hcount-shuzi_left+30)]==1&&count_light==2'b01)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                         
                else if(hcount>=shuzi_left&&hcount<shuzi_right&&vcount>=shuzi_up-30&&vcount<shuzi_down-30&&
                count_left[hcount-shuzi_left][vcount-shuzi_up+30]==1&&count_light==2'b10)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if(hcount>=shuzi_left&&hcount<shuzi_right&&vcount>=shuzi_up&&vcount<shuzi_down&&
                count_right[hcount-shuzi_left][vcount-shuzi_up]==1&&count_light==2'b10)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end 
                else if(hcount>=shuzi_left&&hcount<shuzi_right&&vcount>=shuzi_up&&vcount<shuzi_down&&
                count_left[(vcount-shuzi_up)][19-(hcount-shuzi_left)]==1&&count_light==2'b11)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if(hcount>=shuzi_left-30&&hcount<shuzi_right-30&&vcount>=shuzi_up&&vcount<shuzi_down&&
                count_right[(vcount-shuzi_up)][19-(hcount-shuzi_left+30)]==1&&count_light==2'b11)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                                     
                else if(hcount>=shuzi_left&&hcount<shuzi_right&&vcount>=shuzi_up&&vcount<shuzi_down&&
                count_left[hcount-shuzi_left][vcount-shuzi_up]==1&&count_light==2'b00)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if(hcount>=shuzi_left&&hcount<shuzi_right&&vcount>=shuzi_up+30&&vcount<shuzi_down+30&&
                count_right[hcount-shuzi_left][vcount-shuzi_up-30]==1&&count_light==2'b00)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                
                
                
                else if((hcount>=jiantou_left_position[0]&&hcount<=jiantou_right_position[0]
                &&vcount>=jiantou_up_position[0]&&vcount<=jiantou_down_position[0]
                &&jiantou_down_down[vcount-jiantou_up_position[0]][10-(hcount-jiantou_left_position[0])]==1))
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if((hcount>=(jiantou_left_position[0]+120)&&hcount<=(jiantou_right_position[0]+120)
                &&vcount>=jiantou_up_position[0]&&vcount<=jiantou_down_position[0]
                &&jiantou_down_down[vcount-jiantou_up_position[0]][10-(hcount-jiantou_left_position[0]-120)]==1))
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                      
                else if(hcount>=jiantou_left_position[1]&&hcount<=jiantou_right_position[1]
                &&vcount>=jiantou_up_position[1]&&vcount<=jiantou_down_position[1]
                &&jiantou_double_down[vcount-jiantou_up_position[1]][19-(hcount-jiantou_left_position[1])]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[1]+120)&&hcount<=(jiantou_right_position[1]+120)
                &&vcount>=jiantou_up_position[1]&&vcount<=jiantou_down_position[1]
                &&jiantou_double_down1[vcount-jiantou_up_position[1]][19-(hcount-jiantou_left_position[1]-120)]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end        
                else if(hcount>=jiantou_left_position[2]&&hcount<=jiantou_right_position[2]
                &&vcount>=jiantou_up_position[2]&&vcount<=jiantou_down_position[2]
                &&jiantou_down_right[vcount-jiantou_up_position[2]][hcount-jiantou_left_position[2]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[2])&&hcount<=(jiantou_right_position[2])
                &&vcount>=(jiantou_up_position[2]-60)&&vcount<=(jiantou_down_position[2]-60)
                &&jiantou_down_right[vcount-jiantou_up_position[2]+60][hcount-jiantou_left_position[2]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end       
                else if(hcount>=jiantou_left_position[3]&&hcount<=jiantou_right_position[3]
                &&vcount>=jiantou_up_position[3]&&vcount<=jiantou_down_position[3]
                &&jiantou_double_right[vcount-jiantou_up_position[3]][hcount-jiantou_left_position[3]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[3])&&hcount<=(jiantou_right_position[3])
                &&vcount>=(jiantou_up_position[3]-60)&&vcount<=(jiantou_down_position[3]-60)
                &&jiantou_double_right1[vcount-jiantou_up_position[3]+60][hcount-jiantou_left_position[3]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=jiantou_left_position[4]&&hcount<=jiantou_right_position[4]
                &&vcount>=jiantou_up_position[4]&&vcount<=jiantou_down_position[4]
                &&jiantou_down_up[vcount-jiantou_up_position[4]][10-(hcount-jiantou_left_position[4])]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[4]-120)&&hcount<=(jiantou_right_position[4]-120)
                &&vcount>=(jiantou_up_position[4])&&vcount<=(jiantou_down_position[4])
                &&jiantou_down_up[vcount-jiantou_up_position[4]][10-(hcount-jiantou_left_position[4]+120)]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                
                else if(hcount>=jiantou_left_position[5]&&hcount<=jiantou_right_position[5]
                &&vcount>=jiantou_up_position[5]&&vcount<=jiantou_down_position[5]
                &&jiantou_double_up[vcount-jiantou_up_position[5]][19-(hcount-jiantou_left_position[5])]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[5]-120)&&hcount<=(jiantou_right_position[5]-120)
                &&vcount>=(jiantou_up_position[5])&&vcount<=(jiantou_down_position[5])
                &&jiantou_double_up1[vcount-jiantou_up_position[5]][19-(hcount-jiantou_left_position[5]+120)]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if(hcount>=jiantou_left_position[6]&&hcount<=jiantou_right_position[6]
                &&vcount>=jiantou_up_position[6]&&vcount<=jiantou_down_position[6]
                &&jiantou_down_left[vcount-jiantou_up_position[6]][hcount-jiantou_left_position[6]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[6])&&hcount<=(jiantou_right_position[6])
                &&vcount>=(jiantou_up_position[6]+60)&&vcount<=(jiantou_down_position[6]+60)
                &&jiantou_down_left[vcount-jiantou_up_position[6]-60][hcount-jiantou_left_position[6]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end
                else if(hcount>=jiantou_left_position[7]&&hcount<=jiantou_right_position[7]
                &&vcount>=jiantou_up_position[7]&&vcount<=jiantou_down_position[7]
                &&jiantou_double_left[19-(vcount-jiantou_up_position[7])][hcount-jiantou_left_position[7]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                 
                else if(hcount>=(jiantou_left_position[7])&&hcount<=(jiantou_right_position[7])
                &&vcount>=(jiantou_up_position[7]+60)&&vcount<=(jiantou_down_position[7]+60)
                &&jiantou_double_left1[19-(vcount-jiantou_up_position[7]-60)][hcount-jiantou_left_position[7]]==1)
                begin
                r<=3'b000;
                g<=3'b111;
                b<=2'b00; 
                end                                                                                                                                                 
                else begin    
                r <= 3'b000;    
                g <= 3'b000;    
                b <= 2'b00;    
                end 
                end      
        end    
        // 每一帧动画之后根据速度值更新方块的位置 

        
      
        always @ (posedge vs or posedge rst)    
        begin        
            if (rst==0) 
            begin 
            jiantou_down_up[0]<=11'b00000100000;
            jiantou_down_up[1]<=11'b00001110000;
            jiantou_down_up[2]<=11'b00011111000;
            jiantou_down_up[3]<=11'b00111111100;
            jiantou_down_up[4]<=11'b01111111110;
            jiantou_down_up[5]<=11'b00011111000;
            jiantou_down_up[6]<=11'b00011111000;
            jiantou_down_up[7]<=11'b00011111000;
            jiantou_down_up[8]<=11'b00011111000;
            jiantou_down_up[9]<=11'b00011111000;
            jiantou_down_up[10]<=11'b00011111000;              
            jiantou_down_down[0]<=11'b00011111000;
            jiantou_down_down[1]<=11'b00011111000;
            jiantou_down_down[2]<=11'b00011111000;
            jiantou_down_down[3]<=11'b00011111000;
            jiantou_down_down[4]<=11'b00011111000;
            jiantou_down_down[5]<=11'b00011111000; 
            jiantou_down_down[6]<=11'b01111111110;
            jiantou_down_down[7]<=11'b00111111100;
            jiantou_down_down[8]<=11'b00011111000;
            jiantou_down_down[9]<=11'b00001110000; 
            jiantou_down_down[10]<=11'b00000100000;
            
            jiantou_down_left[0]<=11'b00000000000;
            jiantou_down_left[1]<=11'b00001000000;
            jiantou_down_left[2]<=11'b00011000000;
            jiantou_down_left[3]<=11'b00111111111;
            jiantou_down_left[4]<=11'b01111111111;
            jiantou_down_left[5]<=11'b11111111111; 
            jiantou_down_left[6]<=11'b01111111111;
            jiantou_down_left[7]<=11'b00111111111;
            jiantou_down_left[8]<=11'b00011000000;
            jiantou_down_left[9]<=11'b00001000000; 
            jiantou_down_left[10]<=11'b00000000000;
            
            jiantou_down_right[0]<=11'b00000000000;
            jiantou_down_right[1]<=11'b00000010000;
            jiantou_down_right[2]<=11'b00000011000;
            jiantou_down_right[3]<=11'b11111111100;
            jiantou_down_right[4]<=11'b11111111110;
            jiantou_down_right[5]<=11'b11111111111; 
            jiantou_down_right[6]<=11'b11111111110;
            jiantou_down_right[7]<=11'b11111111100;
            jiantou_down_right[8]<=11'b00000011000;
            jiantou_down_right[9]<=11'b00000010000; 
            jiantou_down_right[10]<=11'b00000000000;   
            
            
            
                                         
            jiantou_double_left[0]<=20'b00000000000100000000;
            jiantou_double_left[1]<=20'b00000000001110000000; 
            jiantou_double_left[2]<=20'b00000000011111000000; 
            jiantou_double_left[3]<=20'b00000000111111100000; 
            jiantou_double_left[4]<=20'b00000001111111110000; 
            jiantou_double_left[5]<=20'b00000000011111000000; 
            jiantou_double_left[6]<=20'b00000000111110000000; 
            jiantou_double_left[7]<=20'b00000001111100000000; 
            jiantou_double_left[8]<=20'b00000011111000010000;
            jiantou_double_left[9]<=20'b00000111110000011000;
           jiantou_double_left[10]<=20'b11111111111111111100; 
           jiantou_double_left[11]<=20'b11111111111111111110; 
           jiantou_double_left[12]<=20'b11111111111111111111; 
           jiantou_double_left[13]<=20'b11111111111111111110; 
           jiantou_double_left[14]<=20'b11111111111111111100; 
           jiantou_double_left[15]<=20'b00000000000000011000; 
           jiantou_double_left[16]<=20'b00000000000000010000;
           jiantou_double_left[17]<=20'b00000000000000000000; 
           jiantou_double_left[18]<=20'b00000000000000000000; 
           jiantou_double_left[19]<=20'b00000000000000000000;               
           
           jiantou_double_right[0]<=40'b00001000000000000000  00111111111111111111;
           jiantou_double_right[1]<=40'b00011000000000000000  00111111111111111111;
           jiantou_double_right[2]<=40'b00111111111111111111  00111111111111111111;
           jiantou_double_right[3]<=40'b01111111111111111111  00111111111111111111;
           jiantou_double_right[4]<=40'b11111111111111111111  00111111111111111111; 
           jiantou_double_right[5]<=40'b01111111111111111111  00111111111111111111; 
           jiantou_double_right[6]<=40'b00111111111111111111  00111111111111111111; 
           jiantou_double_right[7]<=40'b00011000001111100000  00111111111111111111; 
           jiantou_double_right[8]<=40'b00001000011111000000  00111111111111111111;
           jiantou_double_right[9]<=40'b00000000111110000000  01111111111111111110;
          jiantou_double_right[10]<=40'b00000001111100000000  00111111111111111111; 
          jiantou_double_right[11]<=40'b00000011111000000000  00111111111111111111; 
          jiantou_double_right[12]<=40'b00001111111110000000  00111111111111111111; 
          jiantou_double_right[13]<=40'b00000111111100000000  00111111111111111111; 
          jiantou_double_right[14]<=40'b00000011111000000000  00111111111111111111; 
          jiantou_double_right[15]<=40'b00000001110000000000  00111111111111111111; 
          jiantou_double_right[16]<=40'b00000000100000000000  00111111111111111111;
          jiantou_double_right[17]<=40'b00000000000000000000  00111111111111111111; 
          jiantou_double_right[18]<=40'b00000000000000000000  00111111111111111111; 
          jiantou_double_right[19]<=40'b00000000000000000000  00111111111111111111;
           jiantou_double_right[20]<=40'b00001000000000000000  00111111111111111111;
          jiantou_double_right[21]<=20'b00011000000000000000  00111111111111111111;
          jiantou_double_right[22]<=20'b00111111111111111111  00111111111111111111;
          jiantou_double_right[23]<=20'b01111111111111111111  00111111111111111111;
          jiantou_double_right[24]<=20'b11111111111111111111  00111111111111111111; 
          jiantou_double_right[25]<=20'b01111111111111111111  00111111111111111111; 
          jiantou_double_right[26]<=20'b00111111111111111111  00111111111111111111; 
          jiantou_double_right[27]<=20'b00011000001111100000  00111111111111111111; 
          jiantou_double_right[28]<=20'b00001000011111000000  00111111111111111111;
          jiantou_double_right[29]<=20'b00000000111110000000  01111111111111111110;
         jiantou_double_right[30]<=20'b00000001111100000000  00111111111111111111; 
         jiantou_double_right[31]<=20'b00000011111000000000  00111111111111111111; 
         jiantou_double_right[32]<=20'b00001111111110000000  00111111111111111111; 
         jiantou_double_right[33]<=20'b00000111111100000000  00111111111111111111; 
         jiantou_double_right[34]<=20'b00000011111000000000  00111111111111111111; 
         jiantou_double_right[35]<=20'b00000001110000000000  00111111111111111111; 
         jiantou_double_right[36]<=20'b00000000100000000000  00111111111111111111;
         jiantou_double_right[37]<=20'b00000000000000000000  00111111111111111111; 
         jiantou_double_right[38]<=20'b00000000000000000000  00111111111111111111; 
         jiantou_double_right[39]<=20'b00000000000000000000  00111111111111111111;           
          
          
          
          
          
          jiantou_double_left1[0]<=20'b00000000000000000000;
          jiantou_double_left1[1]<=20'b00000000000000000000; 
          jiantou_double_left1[2]<=20'b00000000000000000000; 
          jiantou_double_left1[3]<=20'b00000000000000010000; 
          jiantou_double_left1[4]<=20'b00000000000000011000; 
          jiantou_double_left1[5]<=20'b11111111111111111100; 
          jiantou_double_left1[6]<=20'b11111111111111111110; 
          jiantou_double_left1[7]<=20'b11111111111111111111; 
          jiantou_double_left1[8]<=20'b11111111111111111110;
          jiantou_double_left1[9]<=20'b11111111111111111100;
         jiantou_double_left1[10]<=20'b00000111110000011000; 
         jiantou_double_left1[11]<=20'b00000011111000010000; 
         jiantou_double_left1[12]<=20'b00000001111100000000; 
         jiantou_double_left1[13]<=20'b00000000111110000000; 
         jiantou_double_left1[14]<=20'b00000000011111000000; 
         jiantou_double_left1[15]<=20'b00000001111111110000; 
         jiantou_double_left1[16]<=20'b00000000111111100000;
         jiantou_double_left1[17]<=20'b00000000011111000000; 
         jiantou_double_left1[18]<=20'b00000000001110000000; 
         jiantou_double_left1[19]<=20'b00000000000100000000;               
         
         jiantou_double_right1[0]<=20'b00000000000000000000;
         jiantou_double_right1[1]<=20'b00000000000000000000;
         jiantou_double_right1[2]<=20'b00000000000000000000;
         jiantou_double_right1[3]<=20'b00000000100000000000;
         jiantou_double_right1[4]<=20'b00000001110000000000; 
         jiantou_double_right1[5]<=20'b00000011111000000000;; 
         jiantou_double_right1[6]<=20'b00000111111100000000; 
         jiantou_double_right1[7]<=20'b00001111111110000000; 
         jiantou_double_right1[8]<=20'b00000011110000000000;
         jiantou_double_right1[9]<=20'b00000001111000000000;
        jiantou_double_right1[10]<=20'b0000000011110000000; 
        jiantou_double_right1[11]<=20'b00001000011110000000; 
        jiantou_double_right1[12]<=20'b00011000001111000000; 
        jiantou_double_right1[13]<=20'b00111111111111111111; 
        jiantou_double_right1[14]<=20'b01111111111111111111; 
        jiantou_double_right1[15]<=20'b11111111111111111111;
        jiantou_double_right1[16]<=20'b01111111111111111111; 
        jiantou_double_right1[17]<=20'b00111111111111111111; 
        jiantou_double_right1[18]<=20'b00011000000000000000;               
        jiantou_double_right1[19]<=20'b00001000000000000000;                
                      
          jiantou_double_up[0]<=20'b00000000000001111100;
          jiantou_double_up[1]<=20'b00000000000001111100;
          jiantou_double_up[2]<=20'b00000000000001111100;
          jiantou_double_up[3]<=20'b00000000000001111100;
          jiantou_double_up[4]<=20'b00000001000001111100; 
          jiantou_double_up[5]<=20'b00000011000011111100;
          jiantou_double_up[6]<=20'b00000111000111111100; 
          jiantou_double_up[7]<=20'b00001111001111111100; 
          jiantou_double_up[8]<=20'b00011111011111111100;
          jiantou_double_up[9]<=20'b00111111111111111100;
         jiantou_double_up[10]<=20'b01111111111101111100; 
         jiantou_double_up[11]<=20'b11111111111001111100; 
         jiantou_double_up[12]<=20'b01111111110001111100; 
         jiantou_double_up[13]<=20'b00111111100001111100; 
         jiantou_double_up[14]<=20'b00011111000001111100; 
         jiantou_double_up[15]<=20'b00001111000111111111; 
         jiantou_double_up[16]<=20'b00000111000011111110;
         jiantou_double_up[17]<=20'b00000011000001111100; 
         jiantou_double_up[18]<=20'b00000001000000111000; 
         jiantou_double_up[19]<=20'b00000000000000010000;               
                      

          jiantou_double_up1[0]<=20'b00111110000000000000;
          jiantou_double_up1[1]<=20'b00111110000000000000;
          jiantou_double_up1[2]<=20'b00111110000000000000;
          jiantou_double_up1[3]<=20'b00111110000000000000;
          jiantou_double_up1[4]<=20'b00111110000000000000; 
          jiantou_double_up1[5]<=20'b00111111000000000000;
          jiantou_double_up1[6]<=20'b00111111100001000000; 
          jiantou_double_up1[7]<=20'b00111111110001100000; 
          jiantou_double_up1[8]<=20'b00111111111001110000;
          jiantou_double_up1[9]<=20'b00111111111101111000;
         jiantou_double_up1[10]<=20'b00111110111111111100; 
         jiantou_double_up1[11]<=20'b00111110011111111110; 
         jiantou_double_up1[12]<=20'b00111110001111111111; 
         jiantou_double_up1[13]<=20'b00111110000111111110; 
         jiantou_double_up1[14]<=20'b00111110000011111100; 
         jiantou_double_up1[15]<=20'b11111111100001111000; 
         jiantou_double_up1[16]<=20'b01111111000001110000;
         jiantou_double_up1[17]<=20'b00111110000001100000; 
         jiantou_double_up1[18]<=20'b00011100000001000000; 
         jiantou_double_up1[19]<=20'b00001000000000000000;


                      
                      
                        
             jiantou_double_down[0]<=20'b00000000000000010000;
             jiantou_double_down[1]<=20'b00000000000000111000;
             jiantou_double_down[2]<=20'b00000010000001111100;
             jiantou_double_down[3]<=20'b00000110000011111110;
             jiantou_double_down[4]<=20'b0000111000111111111; 
             jiantou_double_down[5]<=20'b00011111000001111100;; 
             jiantou_double_down[6]<=20'b00111111100001111100; 
             jiantou_double_down[7]<=20'b01111111110001111100; 
             jiantou_double_down[8]<=20'b11111111111001111100;
             jiantou_double_down[9]<=20'b01111111111101111100;
             jiantou_double_down[10]<=20'b00111110111111111100; 
             jiantou_double_down[11]<=20'b00011110011111111100; 
             jiantou_double_down[12]<=20'b00001110001111111100; 
             jiantou_double_down[13]<=20'b00000110000111111100; 
             jiantou_double_down[14]<=20'b00000010000011111100; 
             jiantou_double_down[15]<=20'b00000000000001111100; 
             jiantou_double_down[16]<=20'b00000000000001111100;
             jiantou_double_down[17]<=20'b00000000000001111100; 
             jiantou_double_down[18]<=20'b00000000000001111100; 
             jiantou_double_down[19]<=20'b00000000000001111100;
        
        
                                    
            jiantou_double_down1[0]<=20'b00001000000000000000;
            jiantou_double_down1[1]<=20'b00011100000001000000;
            jiantou_double_down1[2]<=20'b00111110000001100000;
            jiantou_double_down1[3]<=20'b01111111000001110000;
            jiantou_double_down1[4]<=20'b11111111100001111000; 
            jiantou_double_down1[5]<=20'b00111110000011111100;
            jiantou_double_down1[6]<=20'b00111110000111111110;
            jiantou_double_down1[7]<=20'b00111110001111111111; 
            jiantou_double_down1[8]<=20'b00111110011111111110;
            jiantou_double_down1[9]<=20'b00111110111111111100;
            jiantou_double_down1[10]<=20'b00111111111101111000; 
            jiantou_double_down1[11]<=20'b00111111111001110000; 
            jiantou_double_down1[12]<=20'b00111111110001100000; 
            jiantou_double_down1[13]<=20'b00111111100001000000; 
            jiantou_double_down1[14]<=20'b00111111000000000000; 
            jiantou_double_down1[15]<=20'b00111110000000000000; 
            jiantou_double_down1[16]<=20'b00111110000000000000;
            jiantou_double_down1[17]<=20'b00111110000000000000; 
            jiantou_double_down1[18]<=20'b00111110000000000000; 
            jiantou_double_down1[19]<=20'b00111110000000000000;               
            jiantou_up_position[0]<=416;
            jiantou_down_position[0]<=427;
            jiantou_left_position[0]<=276;
            jiantou_right_position[0]<=287;
            jiantou_up_position[1]<=416;
            jiantou_down_position[1]<=436;
            jiantou_left_position[1]<=516;
            jiantou_right_position[1]<=536;
            jiantou_up_position[2]<=370;
            jiantou_down_position[2]<=381;
            jiantou_left_position[2]<=715;
            jiantou_right_position[2]<=726;
            jiantou_up_position[3]<=235;
            jiantou_down_position[3]<=255;
            jiantou_left_position[3]<=715;
            jiantou_right_position[3]<=735;
            jiantou_up_position[4]<=104;
            jiantou_down_position[4]<=115;
            jiantou_left_position[4]<=637;
            jiantou_right_position[4]<=648;
            jiantou_up_position[5]<=115;
            jiantou_down_position[5]<=95;
            jiantou_left_position[5]<=400;
            jiantou_right_position[5]<=420;
            jiantou_up_position[6]<=162;
            jiantou_down_position[6]<=173;
            jiantou_left_position[6]<=214;
            jiantou_right_position[6]<=225;
            jiantou_up_position[7]<=305;
            jiantou_down_position[7]<=325;
            jiantou_left_position[7]<=205;
            jiantou_right_position[7]<=225;                                                               
            down_car_position_up[0]<=418;
            down_car_position_down[0]<=421;
            down_car_position_left[0]<=488;
            down_car_position_right[0]<=491;
            car_turn_left_up[0]<=418;
            car_turn_left_down[0]<=421;
            car_turn_left_left[0]<=471;
            car_turn_left_right[0]<=474;
            up_pos[0] <= 390;    
            down_pos[0] <= 410;    
            left_pos[0] <= 500;    
            right_pos[0] <= 520;   
            up_pos[1] <= 225;    
            down_pos[1] <= 245;    
            left_pos[1] <= 663;    
            right_pos[1] <= 683;        
            up_pos[2] <= 140;    
            down_pos[2] <= 160;    
            left_pos[2] <= 380;    
            right_pos[2] <=400 ; 
            up_pos[3] <= 350;    
            down_pos[3] <= 370;    
            left_pos[3] <= 243;    
            right_pos[3] <= 263;                                 
            black_line_up[0]<=405; 
            black_line_down[0]<=415;             
            black_line_left[0]<=15; 
            black_line_right[0]<=783;               
            black_line_up[1]<=120; 
            black_line_down[1]<=130;             
            black_line_left[1]<=15; 
            black_line_right[1]<=783;           
            black_line_up[2]<=15; 
            black_line_down[2]<=740;             
            black_line_left[2]<=230; 
            black_line_right[2]<=240;     
            black_line_up[3]<=15; 
            black_line_down[3]<=740;             
            black_line_left[3]<=700; 
            black_line_right[3]<=710;  
            yellow_line_up[0]<=282; 
            yellow_line_down[0]<=285;             
            yellow_line_left[0]<=15; 
            yellow_line_right[0]<=230;                 
            yellow_line_up[1]<=415; 
            yellow_line_down[1]<=480;             
            yellow_line_left[1]<=465; 
            yellow_line_right[1]<=468;                   
            yellow_line_up[2]<=282; 
            yellow_line_down[2]<=285;             
            yellow_line_left[2]<=710; 
            yellow_line_right[2]<=775;   
            yellow_line_up[3]<=15; 
            yellow_line_down[3]<=120;             
            yellow_line_left[3]<=465; 
            yellow_line_right[3]<=468; 
            
            divide_line_up[0]<=206;
            divide_line_down[0]<=209;
            divide_line_left[0]<=15;
            divide_line_right[0]<=783;
            divide_line_up[1]<=345;
            divide_line_down[1]<=348;
            divide_line_left[1]<=15;
            divide_line_right[1]<=783;
            divide_line_up[2]<=15;
            divide_line_down[2]<=783;
            divide_line_left[2]<=584;
            divide_line_right[2]<=587;
            divide_line_up[3]<=15;
            divide_line_down[3]<=783;
            divide_line_left[3]<=352;
            divide_line_right[3]<=355;                                                
            end 
            else if (down_car_position_up[0] == UP_BOUND)  
            begin
            down_car_position_up[0]<=418;
            down_car_position_down[0]<=421;
            down_car_position_left[0]<=488;
            down_car_position_right[0]<=491;  
            end
            else if((btn==2'b11&&count_light==2'b01)||((btn==2'b00||btn==2'b01)&&(down_car_position_up[0]<black_line_up[0]||car_turn_left_up[0]<black_line_up[0])))
            begin
            if((btn==2'b11&&count_light==2'b01)||((btn==2'b00||btn==2'b01)&&(down_car_position_up[0]<black_line_up[0])))
            begin
            down_car_position_up[0]<=down_car_position_up[0]-1;
            down_car_position_down[0]<=down_car_position_down[0]-1;
            down_car_position_left[0]<=down_car_position_left[0];
            down_car_position_right[0]<=down_car_position_right[0]; 
            end
            if(car_turn_left_up[0]>390)
            begin
            car_turn_left_up[0]<=car_turn_left_up[0]-1;
            car_turn_left_down[0]<=car_turn_left_down[0]-1;
            car_turn_left_left[0]<=car_turn_left_left[0];
            car_turn_left_right[0]<=car_turn_left_right[0];
            end
            else if(car_turn_left_up[0]<=390&&car_turn_left_up[0]>240)
            begin
            car_turn_left_up[0]<=car_turn_left_up[0]-1;
            car_turn_left_down[0]<=car_turn_left_down[0]-1;
            car_turn_left_left[0]<=car_turn_left_left[0]-1;
            car_turn_left_right[0]<=car_turn_left_right[0]-1;              
            end
            else if(car_turn_left_up[0]<=240&&car_turn_left_left[0]>80)
            begin
            car_turn_left_up[0]<=car_turn_left_up[0];
            car_turn_left_down[0]<=car_turn_left_down[0];
            car_turn_left_left[0]<=car_turn_left_left[0]-1;
            car_turn_left_right[0]<=car_turn_left_right[0]-1;      
            end 
            else if(car_turn_left_left[0]<=80)
            begin
            car_turn_left_up[0]<=418;
            car_turn_left_down[0]<=421;
            car_turn_left_left[0]<=471;
            car_turn_left_right[0]<=474;              
            end                                
            end 
                 
        end    
        always @ (posedge vs or posedge rst)    
        begin
        if (rst==0)
        begin
        car_turn_right_up[0]<=448; 
        car_turn_right_down[0]<=451;
        car_turn_right_left[0]<=670;
        car_turn_right_right[0]<=673;              
        end
        else if(turn_left_en[0]==0||(car_turn_right_up[0]<405&&turn_left_en[0]==1))        
        begin
        if(car_turn_right_up[0]>385)
        begin
        car_turn_right_up[0]<=car_turn_right_up[0]-2; 
        car_turn_right_down[0]<=car_turn_right_down[0]-2;
        car_turn_right_left[0]<=car_turn_right_left[0]+1;
        car_turn_right_right[0]<=car_turn_right_right[0]+1;              
        end 
        else if(car_turn_right_up[0]<=385&&car_turn_right_left[0]<=733)
        begin
        car_turn_right_up[0]<=car_turn_right_up[0]; 
        car_turn_right_down[0]<=car_turn_right_down[0];
        car_turn_right_left[0]<=car_turn_right_left[0]+1;
        car_turn_right_right[0]<=car_turn_right_right[0]+1;                  
        end
        else if(car_turn_right_left[0]>733)
        begin
        car_turn_right_up[0]<=448; 
        car_turn_right_down[0]<=451;
        car_turn_right_left[0]<=670;
        car_turn_right_right[0]<=673;           
        end 
        end
        end
        
        
        
        always @ (posedge vs or posedge rst)    
        begin
        if (rst==0)
        begin
        car_turn_right_up[1]<=135; 
        car_turn_right_down[1]<=138;
        car_turn_right_left[1]<=715;
        car_turn_right_right[1]<=718;              
        end
        else if(turn_left_en[1]==0||(car_turn_right_left[1]<700&&turn_left_en[1]==1)) 
        begin
        if(car_turn_right_left[1]>643)
        begin
        car_turn_right_up[1]<=car_turn_right_up[1]-1; 
        car_turn_right_down[1]<=car_turn_right_down[1]-1;
        car_turn_right_left[1]<=car_turn_right_left[1]-2;
        car_turn_right_right[1]<=car_turn_right_right[1]-2;              
        end 
        else if(car_turn_right_left[1]<=643&&car_turn_right_up[1]>=30)
        begin
        car_turn_right_up[1]<=car_turn_right_up[1]-1; 
        car_turn_right_down[1]<=car_turn_right_down[1]-1;
        car_turn_right_left[1]<=car_turn_right_left[1];
        car_turn_right_right[1]<=car_turn_right_right[1];                  
        end
        else if(car_turn_right_up[1]<30)
        begin
        car_turn_right_up[1]<=135; 
        car_turn_right_down[1]<=138;
        car_turn_right_left[1]<=715;
        car_turn_right_right[1]<=718;          
        end 
        end         
        end     
        always @ (posedge vs or posedge rst)    
        begin
        if (rst==0)
        begin
        car_turn_right_up[2]<=112; 
        car_turn_right_down[2]<=115;
        car_turn_right_left[2]<=240;
        car_turn_right_right[2]<=243;              
        end
        else if(turn_left_en[2]==0||(car_turn_right_down[2]>130&&turn_left_en[2]==1))
        begin 
        if(car_turn_right_up[2]<168)
        begin
        car_turn_right_up[2]<=car_turn_right_up[2]+2; 
        car_turn_right_down[2]<=car_turn_right_down[2]+2;
        car_turn_right_left[2]<=car_turn_right_left[2]-1;
        car_turn_right_right[2]<=car_turn_right_right[2]-1;              
        end 
        else if(car_turn_right_up[2]>=168&&car_turn_right_left[2]>=30)
        begin
        car_turn_right_up[2]<=car_turn_right_up[2]; 
        car_turn_right_down[2]<=car_turn_right_down[2];
        car_turn_right_left[2]<=car_turn_right_left[2]-1;
        car_turn_right_right[2]<=car_turn_right_right[2]-1;                  
        end
        else if(car_turn_right_left[2]<30)
        begin
        car_turn_right_up[2]<=112; 
        car_turn_right_down[2]<=115;
        car_turn_right_left[2]<=240;
        car_turn_right_right[2]<=243;          
        end 
        end 
        end      
        always @ (posedge vs or posedge rst)    
        begin
        if (rst==0)
        begin
        car_turn_right_up[3]<=400; 
        car_turn_right_down[3]<=403;
        car_turn_right_left[3]<=220;
        car_turn_right_right[3]<=223;              
        end
        else if(turn_left_en[3]==0||(car_turn_right_right[3]>240&&turn_left_en[3]==1))
        begin 
        if(car_turn_right_left[3]<296)
        begin
        car_turn_right_up[3]<=car_turn_right_up[3]+1; 
        car_turn_right_down[3]<=car_turn_right_down[3]+1;
        car_turn_right_left[3]<=car_turn_right_left[3]+2;
        car_turn_right_right[3]<=car_turn_right_right[3]+2;              
        end 
        else if(car_turn_right_left[3]>=296&&car_turn_right_up[3]<=530)
        begin
        car_turn_right_up[3]<=car_turn_right_up[3]+1; 
        car_turn_right_down[3]<=car_turn_right_down[3]+1;
        car_turn_right_left[3]<=car_turn_right_left[3];
        car_turn_right_right[3]<=car_turn_right_right[3];                  
        end
        else if(car_turn_right_up[3]>530)
        begin
        car_turn_right_up[3]<=400; 
        car_turn_right_down[3]<=403;
        car_turn_right_left[3]<=220;
        car_turn_right_right[3]<=223;         
        end
        end 
        end        
        
        
        
        
        
        
        
        
        always @ (posedge vs or posedge rst)    
        begin
        if(rst==0)
        begin
        right_car_position_up[0]<=212;
        right_car_position_down[0]<=215;
        right_car_position_left[0]<=715;
        right_car_position_right[0]<=718;
        car_turn_left_up[1]<=240;
        car_turn_left_down[1]<=243;
        car_turn_left_left[1]<=715;
        car_turn_left_right[1]<=718;       
        end
        else if(right_car_position_right[0]==LEFT_BOUND)
        begin
        right_car_position_up[0]<=212;
        right_car_position_down[0]<=215;
        right_car_position_left[0]<=715;
        right_car_position_right[0]<=718;   
        end  
        else if((btn2==2'b11&&count_light==2'b10)||((btn2==2'b00||btn2==2'b01)&&(right_car_position_left[0]<black_line_left[3]||car_turn_left_left[1]<black_line_left[3])))
        begin
        if((btn2==2'b11&&count_light==2'b10)||((btn2==2'b00||btn2==2'b01)&&(right_car_position_left[0]<black_line_left[3])))
        begin
        right_car_position_up[0]<=right_car_position_up[0];
        right_car_position_down[0]<=right_car_position_down[0];
        right_car_position_left[0]<=right_car_position_left[0]-1;
        right_car_position_right[0]<=right_car_position_right[0]-1; 
        end
        if(car_turn_left_left[1]>690)
        begin
        car_turn_left_up[1]<=car_turn_left_up[1];
        car_turn_left_down[1]<=car_turn_left_down[1];
        car_turn_left_left[1]<=car_turn_left_left[1]-1;
        car_turn_left_right[1]<=car_turn_left_right[1]-1;              
        end
        else if(car_turn_left_left[1]<=690&&car_turn_left_up[1]<=403&&car_turn_left_left[1]>355)
        begin
        car_turn_left_up[1]<=car_turn_left_up[1]+1;
        car_turn_left_down[1]<=car_turn_left_down[1]+1;
        car_turn_left_left[1]<=car_turn_left_left[1]-2;
        car_turn_left_right[1]<=car_turn_left_right[1]-2;
        end
        else if(car_turn_left_up[1]<600&&right_car_position_left[1]<=355)
        begin
        car_turn_left_up[1]<=car_turn_left_up[1]+1;
        car_turn_left_down[1]<=car_turn_left_down[1]+1;
        car_turn_left_left[1]<=car_turn_left_left[1];
        car_turn_left_right[1]<=car_turn_left_right[1];
        end
        else if(car_turn_left_up[1]>=600)
        begin
        car_turn_left_up[1]<=240;
        car_turn_left_down[1]<=243;
        car_turn_left_left[1]<=715;
        car_turn_left_right[1]<=718; 
        end
        end
        end


        always @ (posedge vs or posedge rst)    
        begin
        if(rst==0)
        begin
        left_car_position_up[0]<=339;
        left_car_position_down[0]<=342;
        left_car_position_left[0]<=214;
        left_car_position_right[0]<=217; 
        car_turn_left_up[3]<=290;  
        car_turn_left_down[3]<=293;
        car_turn_left_right[3]<=217;
        car_turn_left_left[3]<=214;               
        end
        else if(left_car_position_right[0]==RIGHT_BOUND)
        begin
        left_car_position_up[0]<=339;
        left_car_position_down[0]<=342;
        left_car_position_left[0]<=214;
        left_car_position_right[0]<=217; 
        end  
        else if((btn2==2'b11&&count_light==2'b00)||((btn2==2'b00||btn2==2'b01)&&(left_car_position_right[0]>black_line_right[2]||car_turn_left_right[3]>black_line_right[2])))
        begin
        if((btn2==2'b11&&count_light==2'b00)||((btn2==2'b00||btn2==2'b01)&&(left_car_position_right[0]>black_line_right[2])))
        begin
        left_car_position_up[0]<=left_car_position_up[0];
        left_car_position_down[0]<=left_car_position_down[0];
        left_car_position_left[0]<=left_car_position_left[0]+1;
        left_car_position_right[0]<=left_car_position_right[0]+1; 
        end
        
        if(car_turn_left_up[3]>148)
        begin
        car_turn_left_up[3]<=car_turn_left_up[3]-1;  
        car_turn_left_down[3]<=car_turn_left_down[3]-1;
        car_turn_left_right[3]<=car_turn_left_right[3]+2;
        car_turn_left_left[3]<=car_turn_left_left[3]+2; 
        end
        else if(car_turn_left_up[3]<=148&&car_turn_left_up[3]>=90)
        begin
        car_turn_left_up[3]<=car_turn_left_up[3]-1;  
        car_turn_left_down[3]<=car_turn_left_down[3]-1;
        car_turn_left_right[3]<=car_turn_left_right[3];
        car_turn_left_left[3]<=car_turn_left_left[3]; 
        end
        else if(car_turn_left_up[3]<90)
        begin
        car_turn_left_up[3]<=290;  
        car_turn_left_down[3]<=293;
        car_turn_left_right[3]<=217;
        car_turn_left_left[3]<=214;  
        end
        end
        end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        always @ (posedge vs or posedge rst)    
        begin
        if(rst==0)
        begin
        up_car_position_up[0]<=112;
        up_car_position_down[0]<=115;
        up_car_position_left[0]<=398+10;
        up_car_position_right[0]<=401+10; 
        car_turn_left_up[2]<=112;  
        car_turn_left_down[2]<=115;
        car_turn_left_right[2]<=445+3;
        car_turn_left_left[2]<=442+3;  
        end
        else if(up_car_position_down[0]==DOWN_BOUND)
        begin
        up_car_position_up[0]<=112;
        up_car_position_down[0]<=115;
        up_car_position_left[0]<=398+10;
        up_car_position_right[0]<=401+10;
        end  
        else if((btn==2'b11&&count_light==2'b11)||((btn==2'b00||btn==2'b01)&&(up_car_position_up[0]>black_line_up[1]||car_turn_left_up[2]>black_line_up[1])))
        begin
        if((btn==2'b11&&count_light==2'b11)||((btn==2'b00||btn==2'b01)&&(up_car_position_up[0]>black_line_up[1])))
        begin
        up_car_position_up[0]<=up_car_position_up[0]+1;
        up_car_position_down[0]<=up_car_position_down[0]+1;
        up_car_position_left[0]<=up_car_position_left[0];
        up_car_position_right[0]<=up_car_position_right[0]; 
        end
        if(car_turn_left_up[2]<190)
        begin
        car_turn_left_up[2]<=car_turn_left_up[2]+1;
        car_turn_left_down[2]<=car_turn_left_down[2]+1;
        car_turn_left_left[2]<=car_turn_left_left[2];
        car_turn_left_right[2]<=car_turn_left_right[2];   
        end
        else if(car_turn_left_up[2]>=190&&car_turn_left_left[2]<692)
        begin
        car_turn_left_up[2]<=car_turn_left_up[2]+1;
        car_turn_left_down[2]<=car_turn_left_down[2]+1;
        car_turn_left_left[2]<=car_turn_left_left[2]+2;
        car_turn_left_right[2]<=car_turn_left_right[2]+2;         
        end
        else if(car_turn_left_left[2]>=692&&car_turn_left_right[2]<RIGHT_BOUND)
        begin
        car_turn_left_up[2]<=car_turn_left_up[2];
        car_turn_left_down[2]<=car_turn_left_down[2];
        car_turn_left_left[2]<=car_turn_left_left[2]+1;
        car_turn_left_right[2]<=car_turn_left_right[2]+1;           
        
        end
        else if(car_turn_left_right[2]>=RIGHT_BOUND)
        begin
        car_turn_left_up[2]<=112;  
        car_turn_left_down[2]<=115;
        car_turn_left_right[2]<=445+3;
        car_turn_left_left[2]<=442+3;        
        end
        end
        end
        
        always@(count_light)
        begin
        case(count_light)
        2'b00:
        begin
        shuzi_up<=350;
        shuzi_down<=370;
        shuzi_left<=273;
        shuzi_right<=293;
        end
        2'b01:begin
        shuzi_up<=360;
        shuzi_down<=380;
        shuzi_left<=500;
        shuzi_right<=520;
        end        
        2'b10:
        begin
        shuzi_up<=225;
        shuzi_down<=245;
        shuzi_left<=620;
        shuzi_right<=640;
        end
        2'b11:
        begin
        shuzi_up<=170;
        shuzi_down<=190;
        shuzi_left<=380;
        shuzi_right<=400;
        end
        default:begin
        end
        endcase
        end        
        always@(count_55_0 or count_55_1)
        begin
        case(count_55_0)
        4'b0000:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b11111000000000011111;
        count_left[4]=20'b11111000000000011111;
        count_left[5]=20'b11111000000000011111;
        count_left[6]=20'b11111000000000011111;
        count_left[7]=20'b11111000000000011111;
        count_left[8]=20'b11111000000000011111;
        count_left[9]=20'b11111000000000011111;
        count_left[10]=20'b11111000000000011111;
        count_left[11]=20'b11111000000000011111;
        count_left[12]=20'b11111000000000011111;
        count_left[13]=20'b11111000000000011111;
        count_left[14]=20'b11111000000000011111;
        count_left[15]=20'b11111000000000011111;
        count_left[16]=20'b11111000000000011111;
        count_left[17]=20'b11111111111111111111;
        count_left[18]=20'b11111111111111111111;
        count_left[19]=20'b11111111111111111111;
        end        
        4'b0001:
        begin
        count_left[0]=20'b00000000001111100000;
        count_left[1]=20'b00000011111111100000;
        count_left[2]=20'b00011111111111100000;
        count_left[3]=20'b00000000001111100000;
        count_left[4]=20'b00000000001111100000;
        count_left[5]=20'b00000000001111100000;
        count_left[6]=20'b00000000001111100000;
        count_left[7]=20'b00000000001111100000;
        count_left[8]=20'b00000000001111100000;
        count_left[9]=20'b00000000001111100000;
        count_left[10]=20'b00000000001111100000 ;
        count_left[11]=20'b00000000001111100000 ;
        count_left[12]=20'b00000000001111100000 ;
        count_left[13]=20'b00000000001111100000 ;
        count_left[14]=20'b00000000001111100000 ;
        count_left[15]=20'b00000000001111100000 ;
        count_left[16]=20'b00000000001111100000 ;
        count_left[17]=20'b00000000001111100000 ;
        count_left[18]=20'b00000111111111111111 ;
        count_left[19]=20'b00000111111111111111 ;

        end
        4'b0010:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b00000000000000011111;
        count_left[4]=20'b00000000000000011111;
        count_left[5]=20'b00000000000000011111;
        count_left[6]=20'b00000000000000011111;
        count_left[7]=20'b00000000000000011111;
        count_left[8]=20'b00000000000000011111;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b11111000000000000000;
        count_left[12]=20'b11111000000000000000;
        count_left[13]=20'b11111000000000000000;
        count_left[14]=20'b11111000000000000000;
        count_left[15]=20'b11111000000000000000;
        count_left[16]=20'b11111000000000000000;
        count_left[17]=20'b11111111111111111111;
        count_left[18]=20'b11111111111111111111;
        count_left[19]=20'b11111111111111111111;

        end        
        4'b0011:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b00000000000000011111;
        count_left[4]=20'b00000000000000011111;
        count_left[5]=20'b00000000000000011111;
        count_left[6]=20'b00000000000000011111;
        count_left[7]=20'b00000000000000011111;
        count_left[8]=20'b00000000000000011111;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b00000000000000011111;
        count_left[12]=20'b00000000000000011111;
        count_left[13]=20'b00000000000000011111;
        count_left[14]=20'b00000000000000011111;
        count_left[15]=20'b00000000000000011111;
        count_left[16]=20'b00000000000000011111;
        count_left[17]=20'b11111111111111111111;
        count_left[18]=20'b11111111111111111111;
        count_left[19]=20'b11111111111111111111;
  
        end        
        4'b0100:
        begin
        count_left[0]=20'b11111000001111100000 ;
        count_left[1]=20'b11111000001111100000 ;
        count_left[2]=20'b11111000001111100000 ;
        count_left[3]=20'b11111000001111100000 ;
        count_left[4]=20'b11111000001111100000 ;
        count_left[5]=20'b11111000001111100000 ;
        count_left[6]=20'b11111000001111100000 ;
        count_left[7]=20'b11111000001111100000 ;
        count_left[8]=20'b11111000001111100000 ;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b00000000001111100000 ;
        count_left[12]=20'b00000000001111100000 ;
        count_left[13]=20'b00000000001111100000 ;
        count_left[14]=20'b00000000001111100000 ;
        count_left[15]=20'b00000000001111100000;
        count_left[16]=20'b00000000001111100000 ;
        count_left[17]=20'b00000000001111100000 ;
        count_left[18]=20'b00000000001111100000 ;
        count_left[19]=20'b00000000001111100000 ;
        end
        4'b0101:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b11111000000000000000 ;
        count_left[4]=20'b11111000000000000000 ;
        count_left[5]=20'b11111000000000000000 ;
        count_left[6]=20'b11111000000000000000 ;
        count_left[7]=20'b11111000000000000000 ;
        count_left[8]=20'b11111000000000000000 ;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b00000000000000011111;
        count_left[12]=20'b00000000000000011111;
        count_left[13]=20'b00000000000000011111;
        count_left[14]=20'b00000000000000011111;
        count_left[15]=20'b00000000000000011111;
        count_left[16]=20'b00000000000000011111;
        count_left[17]=20'b11111111111111111111;
        count_left[18]=20'b11111111111111111111;
        count_left[19]=20'b11111111111111111111;
        end        
        4'b0110:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b11111000000000000000 ;
        count_left[4]=20'b11111000000000000000 ;
        count_left[5]=20'b11111000000000000000 ;
        count_left[6]=20'b11111000000000000000 ;
        count_left[7]=20'b11111000000000000000 ;
        count_left[8]=20'b11111000000000000000 ;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b11111000000000011111;
        count_left[12]=20'b11111000000000011111;
        count_left[13]=20'b11111000000000011111;
        count_left[14]=20'b11111000000000011111;
        count_left[15]=20'b11111000000000011111;
        count_left[16]=20'b11111000000000011111;
        count_left[17]=20'b11111111111111111111;
        count_left[18]=20'b11111111111111111111;
        count_left[19]=20'b11111111111111111111;
        end        
        4'b0111:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b00000000000000011111;
        count_left[4]=20'b0000000000000011111;
        count_left[5]=20'b00000000000000011111;
        count_left[6]=20'b00000000000000011111;
        count_left[7]=20'b00000000000000011111;
        count_left[8]=20'b00000000000000011111;
        count_left[9]=20'b00000000000000011111;
        count_left[10]=20'b00000000000000011111;
        count_left[11]=20'b00000000000000011111;
        count_left[12]=20'b00000000000000011111;
        count_left[13]=20'b00000000000000011111;
        count_left[14]=20'b00000000000000011111;
        count_left[15]=20'b00000000000000011111;
        count_left[16]=20'b00000000000000011111;
        count_left[17]=20'b00000000000000011111;
        count_left[18]=20'b00000000000000011111;
        count_left[19]=20'b00000000000000011111;
        end        
        4'b1000:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b11111000000000011111;
        count_left[4]=20'b11111000000000011111;
        count_left[5]=20'b11111000000000011111;
        count_left[6]=20'b11111000000000011111;
        count_left[7]=20'b11111000000000011111;
        count_left[8]=20'b11111000000000011111;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b11111000000000011111;
        count_left[12]=20'b11111000000000011111;
        count_left[13]=20'b11111000000000011111;
        count_left[14]=20'b11111000000000011111;
        count_left[15]=20'b11111000000000011111;
        count_left[16]=20'b11111000000000011111;
        count_left[17]=20'b11111111111111111111;
        count_left[18]=20'b11111111111111111111;
        count_left[19]=20'b11111111111111111111;
 
        end        
        4'b1001:
        begin
        count_left[0]=20'b11111111111111111111;
        count_left[1]=20'b11111111111111111111;
        count_left[2]=20'b11111111111111111111;
        count_left[3]=20'b11111000000000011111;
        count_left[4]=20'b11111000000000011111;
        count_left[5]=20'b11111000000000011111;
        count_left[6]=20'b11111000000000011111;
        count_left[7]=20'b11111000000000011111;
        count_left[8]=20'b11111000000000011111;
        count_left[9]=20'b11111111111111111111;
        count_left[10]=20'b11111111111111111111;
        count_left[11]=20'b00000000000000011111;
        count_left[12]=20'b00000000000000011111;
        count_left[13]=20'b00000000000000011111;
        count_left[14]=20'b00000000000000011111;
        count_left[15]=20'b00000000000000011111;
        count_left[16]=20'b00000000000000011111;
        count_left[17]=20'b00000000000000011111;
        count_left[18]=20'b00000000000000011111;
        count_left[19]=20'b00000000000000011111;
        end        
        default:
        begin
        end                                
        endcase
        
        case(count_55_1)
        4'b0000:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b11111000000000011111;
        count_right[4]=20'b11111000000000011111;
        count_right[5]=20'b11111000000000011111;
        count_right[6]=20'b11111000000000011111;
        count_right[7]=20'b11111000000000011111;
        count_right[8]=20'b11111000000000011111;
        count_right[9]=20'b11111000000000011111;
        count_right[10]=20'b11111000000000011111;
        count_right[11]=20'b11111000000000011111;
        count_right[12]=20'b11111000000000011111;
        count_right[13]=20'b11111000000000011111;
        count_right[14]=20'b11111000000000011111;
        count_right[15]=20'b11111000000000011111;
        count_right[16]=20'b11111000000000011111;
        count_right[17]=20'b11111111111111111111;
        count_right[18]=20'b11111111111111111111;
        count_right[19]=20'b11111111111111111111;
        end        
        4'b0001:
        begin
        count_right[0]=20'b00000000001111100000;
        count_right[1]=20'b00000011111111100000;
        count_right[2]=20'b00011111111111100000;
        count_right[3]=20'b00000000001111100000;
        count_right[4]=20'b00000000001111100000;
        count_right[5]=20'b00000000001111100000;
        count_right[6]=20'b00000000001111100000;
        count_right[7]=20'b00000000001111100000;
        count_right[8]=20'b00000000001111100000;
        count_right[9]=20'b00000000001111100000;
        count_right[10]=20'b00000000001111100000 ;
        count_right[11]=20'b00000000001111100000 ;
        count_right[12]=20'b00000000001111100000 ;
        count_right[13]=20'b00000000001111100000 ;
        count_right[14]=20'b00000000001111100000 ;
        count_right[15]=20'b00000000001111100000 ;
        count_right[16]=20'b00000000001111100000 ;
        count_right[17]=20'b00000000001111100000 ;
        count_right[18]=20'b00000111111111111111 ;
        count_right[19]=20'b00000111111111111111 ;

        end
        4'b0010:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b00000000000000011111;
        count_right[4]=20'b00000000000000011111;
        count_right[5]=20'b00000000000000011111;
        count_right[6]=20'b00000000000000011111;
        count_right[7]=20'b00000000000000011111;
        count_right[8]=20'b00000000000000011111;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b11111000000000000000;
        count_right[12]=20'b11111000000000000000;
        count_right[13]=20'b11111000000000000000;
        count_right[14]=20'b11111000000000000000;
        count_right[15]=20'b11111000000000000000;
        count_right[16]=20'b11111000000000000000;
        count_right[17]=20'b11111111111111111111;
        count_right[18]=20'b11111111111111111111;
        count_right[19]=20'b11111111111111111111;

        end        
        4'b0011:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b00000000000000011111;
        count_right[4]=20'b00000000000000011111;
        count_right[5]=20'b00000000000000011111;
        count_right[6]=20'b00000000000000011111;
        count_right[7]=20'b00000000000000011111;
        count_right[8]=20'b00000000000000011111;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b00000000000000011111;
        count_right[12]=20'b00000000000000011111;
        count_right[13]=20'b00000000000000011111;
        count_right[14]=20'b00000000000000011111;
        count_right[15]=20'b00000000000000011111;
        count_right[16]=20'b00000000000000011111;
        count_right[17]=20'b11111111111111111111;
        count_right[18]=20'b11111111111111111111;
        count_right[19]=20'b11111111111111111111;
  
        end        
        4'b0100:
        begin
        count_right[0]=20'b11111000001111100000 ;
        count_right[1]=20'b11111000001111100000 ;
        count_right[2]=20'b11111000001111100000 ;
        count_right[3]=20'b11111000001111100000 ;
        count_right[4]=20'b11111000001111100000 ;
        count_right[5]=20'b11111000001111100000 ;
        count_right[6]=20'b11111000001111100000 ;
        count_right[7]=20'b11111000001111100000 ;
        count_right[8]=20'b11111000001111100000 ;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b00000000001111100000 ;
        count_right[12]=20'b00000000001111100000 ;
        count_right[13]=20'b00000000001111100000 ;
        count_right[14]=20'b00000000001111100000 ;
        count_right[15]=20'b00000000001111100000;
        count_right[16]=20'b00000000001111100000 ;
        count_right[17]=20'b00000000001111100000 ;
        count_right[18]=20'b00000000001111100000 ;
        count_right[19]=20'b00000000001111100000 ;
        end
        4'b0101:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b11111000000000000000 ;
        count_right[4]=20'b11111000000000000000 ;
        count_right[5]=20'b11111000000000000000 ;
        count_right[6]=20'b11111000000000000000 ;
        count_right[7]=20'b11111000000000000000 ;
        count_right[8]=20'b11111000000000000000 ;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b00000000000000011111;
        count_right[12]=20'b00000000000000011111;
        count_right[13]=20'b00000000000000011111;
        count_right[14]=20'b00000000000000011111;
        count_right[15]=20'b00000000000000011111;
        count_right[16]=20'b00000000000000011111;
        count_right[17]=20'b11111111111111111111;
        count_right[18]=20'b11111111111111111111;
        count_right[19]=20'b11111111111111111111;
        end        
        4'b0110:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b11111000000000000000 ;
        count_right[4]=20'b11111000000000000000 ;
        count_right[5]=20'b11111000000000000000 ;
        count_right[6]=20'b11111000000000000000 ;
        count_right[7]=20'b11111000000000000000 ;
        count_right[8]=20'b11111000000000000000 ;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b11111000000000011111;
        count_right[12]=20'b11111000000000011111;
        count_right[13]=20'b11111000000000011111;
        count_right[14]=20'b11111000000000011111;
        count_right[15]=20'b11111000000000011111;
        count_right[16]=20'b11111000000000011111;
        count_right[17]=20'b11111111111111111111;
        count_right[18]=20'b11111111111111111111;
        count_right[19]=20'b11111111111111111111;
        end        
        4'b0111:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b00000000000000011111;
        count_right[4]=20'b0000000000000011111;
        count_right[5]=20'b00000000000000011111;
        count_right[6]=20'b00000000000000011111;
        count_right[7]=20'b00000000000000011111;
        count_right[8]=20'b00000000000000011111;
        count_right[9]=20'b00000000000000011111;
        count_right[10]=20'b00000000000000011111;
        count_right[11]=20'b00000000000000011111;
        count_right[12]=20'b00000000000000011111;
        count_right[13]=20'b00000000000000011111;
        count_right[14]=20'b00000000000000011111;
        count_right[15]=20'b00000000000000011111;
        count_right[16]=20'b00000000000000011111;
        count_right[17]=20'b00000000000000011111;
        count_right[18]=20'b00000000000000011111;
        count_right[19]=20'b00000000000000011111;
        end        
        4'b1000:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b11111000000000011111;
        count_right[4]=20'b11111000000000011111;
        count_right[5]=20'b11111000000000011111;
        count_right[6]=20'b11111000000000011111;
        count_right[7]=20'b11111000000000011111;
        count_right[8]=20'b11111000000000011111;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b11111000000000011111;
        count_right[12]=20'b11111000000000011111;
        count_right[13]=20'b11111000000000011111;
        count_right[14]=20'b11111000000000011111;
        count_right[15]=20'b11111000000000011111;
        count_right[16]=20'b11111000000000011111;
        count_right[17]=20'b11111111111111111111;
        count_right[18]=20'b11111111111111111111;
        count_right[19]=20'b11111111111111111111;
 
        end        
        4'b1001:
        begin
        count_right[0]=20'b11111111111111111111;
        count_right[1]=20'b11111111111111111111;
        count_right[2]=20'b11111111111111111111;
        count_right[3]=20'b11111000000000011111;
        count_right[4]=20'b11111000000000011111;
        count_right[5]=20'b11111000000000011111;
        count_right[6]=20'b11111000000000011111;
        count_right[7]=20'b11111000000000011111;
        count_right[8]=20'b11111000000000011111;
        count_right[9]=20'b11111111111111111111;
        count_right[10]=20'b11111111111111111111;
        count_right[11]=20'b00000000000000011111;
        count_right[12]=20'b00000000000000011111;
        count_right[13]=20'b00000000000000011111;
        count_right[14]=20'b00000000000000011111;
        count_right[15]=20'b00000000000000011111;
        count_right[16]=20'b00000000000000011111;
        count_right[17]=20'b00000000000000011111;
        count_right[18]=20'b00000000000000011111;
        count_right[19]=20'b00000000000000011111;
        end        
        default:
        begin 
        end                                        
        endcase         
        end           
        
                             
endmodule    
