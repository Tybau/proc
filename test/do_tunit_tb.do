puts "Simulation ALU+banc registres"

vlib work
vcom -93 ../src/ALU.vhd
vcom -93 ../src/banc_registres.vhd
vcom -93 ../src/Ext.vhd
vcom -93 ../src/Mux2.vhd
vcom -93 ../src/memory.vhd
vcom -93 ../src/Tunit.vhd
vcom -93 ../test/Tunit_tb.vhd

vsim Tunit_tb

add wave s_clk
add wave -radix hexadecimal ra
add wave -radix hexadecimal rb
add wave -radix hexadecimal rw
add wave we
add wave s_op
add wave s_wr_en
add wave -radix hexadecimal s_imm
add wave s_imm_sel
add wave -radix hexadecimal Tunit/s_ext_imm
add wave s_mem_sel
add wave -radix hexadecimal Tunit/s_a
add wave -radix hexadecimal Tunit/s_b
add wave -radix hexadecimal Tunit/s_b_alu
add wave -radix hexadecimal Tunit/s_data_out
add wave -radix hexadecimal Tunit/s_alu
add wave -radix hexadecimal Tunit/s_w
add wave -radix hexadecimal Tunit/memory/addr
add wave -radix hexadecimal Tunit/banc_registres/banc(1)
add wave -radix hexadecimal Tunit/banc_registres/banc(2)
add wave -radix hexadecimal Tunit/banc_registres/banc(3)
add wave -radix hexadecimal Tunit/banc_registres/banc(5)
add wave -radix hexadecimal Tunit/banc_registres/banc(6)
add wave -radix hexadecimal Tunit/banc_registres/banc(7)
add wave -radix hexadecimal Tunit/banc_registres/banc(9)
add wave -radix hexadecimal Tunit/banc_registres/banc(10)
add wave -radix hexadecimal Tunit/banc_registres/banc(15)
add wave -radix hexadecimal Tunit/memory/banc(6)

run 18 ns
