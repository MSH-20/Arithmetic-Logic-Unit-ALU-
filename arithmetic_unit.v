module arithmetic_unit(
    input wire [0:0] KEY,
    input wire [5:0] SW,
    output wire [6:0] HEX0,
    output wire [6:0] HEX3,
    output wire [6:0] HEX4,
    output wire [6:0] HEX5,
    output reg [2:0] LEDR
);
    reg [44:0] numbers;
    reg [7:0] operators;
    reg [2:0] counter;
    reg [8:0] current_result;
    reg [8:0] current_number;
    reg [1:0] current_op;
    wire [8:0] operation_result;
    wire operation_sign;
    wire div_by_zero;

    // Arithmetic operations module
    arithmetic_operations alu(
        .a(current_result),
        .b(current_number),
        .op(current_op),
        .result(operation_result),
        .sign(operation_sign),
        .div_by_zero(div_by_zero)
    );

    // Display modules
    display_controller input_display(
        .value({6'b0, SW[1:0]}),
        .hex0(HEX0),
        .hex1(),  // Not connected
        .hex2()   // Not connected
    );

    display_controller result_display(
        .value(operation_result),
        .hex0(HEX3),
        .hex1(HEX4),
        .hex2(HEX5)
    );

		    always @(*) begin
        if (counter == 0) begin
            // For first number, show sign and zero flags based on input
            LEDR[1] = 0;  // Sign flag based on immediate input
            LEDR[2] = 0;  // Zero flag
            LEDR[0] = 0;  // No division by zero possible yet
        end else begin
            // For subsequent numbers, use ALU results
            LEDR[1] = (operation_sign && operation_result[8] && ~(operation_result[7:0]	== 0));
            LEDR[2] = (operation_result[7:0]	== 0);
            LEDR[0] = div_by_zero;
        end
    end
	 
    // Main sequential logic
    always @(posedge KEY[0]) begin
        
        // Store input number and operator
        case(counter)
            3'd0: numbers[8:0] <= SW[2] ? {1'b1, 6'd0, SW[1:0]} : {1'b0, SW[1:0]};
            3'd1: numbers[17:9] <= SW[2] ? {1'b1, 6'd0, SW[1:0]} : {1'b0, SW[1:0]};
            3'd2: numbers[26:18] <= SW[2] ? {1'b1, 6'd0, SW[1:0]} : {1'b0, SW[1:0]};
            3'd3: numbers[35:27] <= SW[2] ? {1'b1, 6'd0, SW[1:0]} : {1'b0, SW[1:0]};
            3'd4: numbers[44:36] <= SW[2] ? {1'b1, 6'd0, SW[1:0]} : {1'b0, SW[1:0]};
        endcase

        if(counter < 4) begin
            operators[counter*2 +: 2] <= SW[5:4];
        end

        if(counter < 5) begin
            // Update current number
            current_number <= SW[2] ? {1'b1, 6'd0, SW[1:0]} : {1'b0, SW[1:0]};
        end

        // Perform operation and show results
        if(counter > 0 && counter < 5) begin
            current_op <= operators[(counter-1)*2 +: 2];
            current_result <= operation_result;
            
        end

        // Increment counter
        if (counter < 5) begin
            counter <= counter + 1;
        end
    end

    // Initial block
    initial begin
        counter = 0;
        current_result = 0;
        LEDR = 0;
        numbers = 0;
        operators = 0;
        current_number = 0;
        current_op = 0;
    end
endmodule