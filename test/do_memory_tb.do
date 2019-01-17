puts "Simulation memory"

vlib work
vcom -93 ../src/memory.vhd
vcom -93 ../test/memory_tb.vhd

vsim memory_tb

add wave s_clk
add wave -radix hexadecimal s_addr
add wave -radix hexadecimal s_data_in
add wave s_wr_en
add wave -radix hexadecimal s_data_out
add wave -radix hexadecimal memory/banc(9)

run 6 ns
