`default_nettype none

/*
Paste this into https://wavedrom.com/editor.html to see expected behaviour

{signal: [
  {name: 'clk', wave: 'p.......................'},
  {name: 'rst_n', wave: '10......................'},
  {name: 'input_hold', wave: 'x0......10.......10.....'},
  {name: 'sample[5:0]', wave: 'x22222222.2222222.222222'},
  {name: 'sample_count', wave: 'x22222222222222222222222', data: ['0x0','0x1','0x2','0x3','0x4','0x5','0x6','0x7','0x0','0x0','0x1','0x2','0x3','0x4','0x5','0x6','0x7','0x0','0x0','0x1','0x2','0x3','0x4']},
  {name: 'output_ready', wave: 'x0.......10.......10....'},
  {name: 'sum[8:0]', wave: 'x22222222222222222222222', data: ['0x0','','','','','','','','sum','0x0','','','','','','','','sum','0x0']},
  {name: 'average[5:0]', wave:'x........2x.......2x....'}
]}
*/
module average_samples (
    input wire          clk,
    input wire          rst_n,

    input wire[5:0]     sample,

    output wire[5:0]    average,
    output reg          output_ready,

    // Need to stop new sample coming in when output ready
    // because don't want to lose sample that occurs during
    // extra clock cycle to reset sum
    output reg          input_hold
);

// To keep track of which sample this is
// (8 samples total per symbol)
reg[2:0] sample_count;

// Width of sum register is width of sample + log2(8) = 9
reg[8:0] sum;

// Omit leftmost 3 bits (aka "shift right") to divide by 8
assign average = sum[8:3];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        output_ready <= '0;
        input_hold <= '0;
        sample_count <= '0;
        sum <= '0;
    end

    // "Stalling" clock cycle in between output being ready
    // and restarting the sum to allow one clock cycle for
    // clearing the sum (cannot clear during output_ready clock
    // cycle, but if we clear right after it won't get reflected
    // in the same clock cycle and we end up adding the first sample of
    // the next symbol to the previous sum)
    else if (output_ready) begin
        sum <= '0;
        output_ready <= '0;
    end

    else begin
        input_hold <= '0;

        sum <= sum + {3'b0, sample};
        sample_count <= sample_count + 1;

        if (sample_count == 6) begin
            input_hold <= '1;
        end

        // This will update on next clk edge so by then, 
        // sum will have also updated to include 8th sample
        if (sample_count == 7) begin
            output_ready <= '1;
        end
    end
end

endmodule