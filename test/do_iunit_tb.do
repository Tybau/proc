puts "Simulation Iunit"

vlib work
vcom -93 ../src/Ext.vhd
vcom -93 ../src/Mux2.vhd
vcom -93 ../src/instruction_memory.vhd
vcom -93 ../src/Iunit.vhd
vcom -93 ../test/Iunit_tb.vhd

vsim Iunit_tb

add wave s_clk
add wave s_offset
add wave s_nPCsel
add wave s_instruction
#add wave Iunit/pc
add wave Iunit/pc_save
#add wave Iunit/y_off
#add wave Iunit/n_off

run 20 ns
