puts "Simulation reg32"

vlib work
vcom -93 ../src/reg32.vhd
vcom -93 ../test/reg32_tb.vhd

vsim reg32_tb

add wave s_clk
add wave s_rst
add wave s_we
add wave -radix hexadecimal s_data_in
add wave -radix hexadecimal s_data_out

run 10 ns
