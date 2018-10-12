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
add wave ra
add wave rb
add wave rw
add wave we
add wave s_op
add wave s_wr_en
add wave s_imm
add wave s_imm_sel
add wave s_mem_sel
add wave Tunit/s_a
add wave Tunit/s_b
add wave Tunit/s_b_alu
add wave Tunit/s_ext_imm
add wave Tunit/s_data_out
add wave Tunit/s_alu
add wave Tunit/s_w

run 20 ns
