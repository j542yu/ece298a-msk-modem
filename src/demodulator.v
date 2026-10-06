`default_nettype none

module demodulator(
    input wire          clk,
    input wire          rst_n,

    // Signed 6-bit I/Q symbols (from averaged out samples)
    input wire signed[5:0]     I,
    input wire signed[5:0]     Q,
    
    // Serial binary output data
    output reg          data//,
    // output reg          symbol_done
);

// Output will not be valid if first sample
// because nothing to compare with
reg is_first_symbol;

reg[2:0] sample_count;

reg signed[12:0] result_Q;

// To store x[n-1]
reg signed[5:0] delayed_I;
reg signed[5:0] delayed_Q;

always @* begin
    result_Q = Q*delayed_I - delayed_Q*I;
end

always @(posedge clk or negedge rst_n) begin
    // Asynch reset
    if (!rst_n) begin 
        data <= '0;
        // symbol_done <= '0;

        is_first_symbol <= '1;
        sample_count <= '0;

        delayed_I <= '0;
        delayed_Q <= '0;
    end

    // Synchronous logic
    else begin
        if (is_first_symbol && sample_count == 7) begin
            is_first_symbol <= 0;
        end

        sample_count <= sample_count + 1;

        delayed_I <= I;
        delayed_Q <= Q;

        if (!is_first_symbol) begin
            data <= result_Q[12];
        end
        
    end
end

endmodule