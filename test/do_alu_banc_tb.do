puts "Simulation ALU+banc registres"

vlib work
vcom -93 ../src/ALU.vhd
vcom -93 ../src/banc_registres.vhd
vcom -93 ../src/alu_banc.vhd
vcom -93 ../test/alu_banc_tb.vhd

vsim alu_banc_tb

add wave s_clk
add wave ra
add wave rb
add wave rw
add wave we
add wave s_op
add wave alu_banc/s_w

run 20 ns
