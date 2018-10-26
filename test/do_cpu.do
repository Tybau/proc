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
add wave /cpu_tb/e_CPU/e_Tunit/alu_i/S
add wave /cpu_tb/e_CPU/e_Tunit/banc_registres/ra
add wave /cpu_tb/e_CPU/e_Tunit/banc_registres/rb
add wave /cpu_tb/e_CPU/e_Tunit/banc_registres/a
add wave /cpu_tb/e_CPU/e_Tunit/banc_registres/b
add wave /cpu_tb/e_CPU/e_Tunit/banc_registres/rw
add wave /cpu_tb/e_CPU/e_Tunit/imm
add wave /cpu_tb/e_CPU/e_Tunit/alu_i/A
add wave /cpu_tb/e_CPU/e_Tunit/alu_i/B 
add wave /cpu_tb/e_CPU/e_Tunit/mux_imm/COM 

run 20 ns
