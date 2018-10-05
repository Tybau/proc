puts "Simulation ALU"

vlib work
vcom -93 ../src/ALU.vhd
vcom -93 ../test/ALU_tb.vhd

vsim ALU_tb

add wave OP_i
add wave A_i
add wave B_i
add wave S_i
add wave N_i

run 50 ns
