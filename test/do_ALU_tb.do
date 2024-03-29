puts "Simulation ALU"

vlib work
vcom -93 ../src/ALU.vhd
vcom -93 ../test/ALU_tb.vhd

vsim ALU_tb

add wave OP_i
add wave -radix signed A_i
add wave -radix signed B_i
add wave -radix signed S_i
add wave N_i

run 50 ns
