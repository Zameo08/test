module top (CLK, BTN_RST, LED, BTN_C);
    input CLK, BTN_RST, BTN_C;
    output [5:0]LED;
    reg [5:0]LED;

    
    always @(posedge CLK or posedge BTN_RST) begin
         if (BTN_RST) begin
              LED <= 6'b000000;
           end
         else begin: COUNT           
              while (BTN_C) begin
                    LED <= LED + 1'b1;
                    disable COUNT;
              end
            end
    end
endmodule