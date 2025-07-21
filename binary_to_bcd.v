module binary_to_bcd(
    input [8:0] binary,
    output reg [3:0] bcd0,  // ones
    output reg [3:0] bcd1,  // tens
    output reg [3:0] bcd2   // hundreds
);
    reg [7:0] temp;
    integer i;
    
    always @(*) begin
        bcd0 = 0;
        bcd1 = 0;
        bcd2 = 0;
        temp = binary[7:0];
        
        for(i = 0; i < 8; i = i + 1) begin
            if(bcd0 >= 5) bcd0 = bcd0 + 3;
            if(bcd1 >= 5) bcd1 = bcd1 + 3;
            if(bcd2 >= 5) bcd2 = bcd2 + 3;
                
            bcd2 = {bcd2[2:0], bcd1[3]};
            bcd1 = {bcd1[2:0], bcd0[3]};
            bcd0 = {bcd0[2:0], temp[7]};
            temp = {temp[6:0], 1'b0};
        end
    end
endmodule