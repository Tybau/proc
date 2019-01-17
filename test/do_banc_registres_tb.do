puts "Simulation banc registres"

vlib work
vcom -93 ../src/banc_registres.vhd
vcom -93 ../test/banc_registres_tb.vhd

vsim tb_banc_registres

add wave s_clk
add wave -radix hexadecimal s_a
add wave -radix hexadecimal s_b
add wave -radix hexadecimal s_ra
add wave -radix hexadecimal s_rb
add wave -radix hexadecimal s_rw
add wave -radix hexadecimal s_w
add wave s_we

run 20 ns
