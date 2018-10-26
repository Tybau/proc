puts "Simulation CPU"

vlib work
vcom -93 ../src/ALU.vhd
vcom -93 ../src/banc_registres.vhd
vcom -93 ../src/Ext.vhd
vcom -93 ../src/Mux2.vhd
vcom -93 ../src/memory.vhd
vcom -93 ../src/reg32.vhd
vcom -93 ../src/instruction_memory.vhd
vcom -93 ../src/instruction_decoder.vhd
vcom -93 ../src/Tunit.vhd
vcom -93 ../src/Cunit.vhd
vcom -93 ../src/Iunit.vhd
vcom -93 ../src/CPU.vhd
vcom -93 ../test/CPU_tb.vhd

vsim CPU_tb

add wave s_clk
add wave s_rst
add wave e_CPU/e_Tunit/memory/banc
add wave e_CPU/e_Tunit/banc_registres/banc
add wave e_CPU/e_Iunit/pc_save
add wave /cpu_tb/e_CPU/e_Tunit/imm

add wave e_CPU/e_Cunit/e_psr/data_out
add wave /cpu_tb/e_CPU/e_Iunit/offset
add wave /cpu_tb/e_CPU/e_Iunit/instruction 

run 20 ns
