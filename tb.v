module top_tb;
    reg CLK, BTN_RST, BTN_C;
    wire [5:0] LED;

    top dut (
        .CLK(CLK),
        .BTN_RST(BTN_RST),
        .LED(LED),
        .BTN_C(BTN_C)
    );
    
    initial begin
        CLK = 0;
        BTN_RST = 1;
        BTN_C = 0;
        
        #10 BTN_RST = 0;  // Assert reset
        #10 BTN_RST = 1;  // De-assert reset
        
        // Test case 1: Count up with BTN_C pressed
        BTN_C = 1;
        #10;
        BTN_C = 0;
        #10;
        BTN_C = 1;
        #10;
        BTN_C = 0;
        #10;
        
        // Test case 2: Reset
        BTN_RST = 0;
        #10 BTN_RST = 1;
        
        // Test case 3: Count up without BTN_C pressed
        BTN_C = 0;
        #10;
        BTN_C = 0;
        #10;
        
        // Add more test cases if needed
        
        $finish;  // End simulation
    end

    always #5 CLK = ~CLK;  // Toggle clock every 5 time units
endmodule