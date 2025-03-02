/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_lab2_q3 (
    input  wire [7:0] ui_in,   // Dedicated inputs
    output wire [7:0] uo_out,  // Dedicated outputs
    input  wire [7:0] uio_in,  // IOs: Input path
    output wire [7:0] uio_out, // IOs: Output path
    output wire [7:0] uio_oe,  // IOs: Enable path (active high: 0=input, 1=output)
    input  wire ena,           // Always 1 when the design is powered, so you can ignore it
    input  wire clk,           // Clock
    input  wire rst_n          // Reset_n - low to reset
);

// Implement bitwise AND for lower 7 bits
assign uo_out[6:0] = ui_in[6:0] & uio_in[6:0];

// Conditional MSB toggling
assign uo_out[7] = (ui_in[7] == uio_in[7]) ? ui_in[7] : ~ui_in[7];

// Assign unused outputs to 0
assign uio_out = 0;
assign uio_oe  = 0;

// List all unused inputs to prevent warnings
wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
