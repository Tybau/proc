puts "Simulation memory"

vlib work
vcom -93 ../src/memory.vhd
vcom -93 ../test/memory_tb.vhd

vsim memory_tb

add wave s_clk
add wave s_addr
add wave s_data_in
add wave s_wr_en
add wave s_data_out

run 20 ns
