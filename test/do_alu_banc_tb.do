puts "Simulation ALU+banc registres"

vlib work
vcom -93 ../src/ALU.vhd
vcom -93 ../src/banc_registres.vhd
vcom -93 ../src/alu_banc.vhd
vcom -93 ../test/alu_banc_tb.vhd

vsim alu_banc_tb

add wave s_clk
add wave -radix hexadecimal ra
add wave -radix hexadecimal rb
add wave -radix hexadecimal rw
add wave we
add wave s_op
add wave -radix hexadecimal alu_banc/s_w
add wave -radix hexadecimal /alu_banc_tb/alu_banc/banc_registres/banc(1)
add wave -radix hexadecimal /alu_banc_tb/alu_banc/banc_registres/banc(2)
add wave -radix hexadecimal /alu_banc_tb/alu_banc/banc_registres/banc(3)
add wave -radix hexadecimal /alu_banc_tb/alu_banc/banc_registres/banc(7)
add wave -radix hexadecimal /alu_banc_tb/alu_banc/banc_registres/banc(15)

run 10 ns
