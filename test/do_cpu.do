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
add wave -radix unsigned e_CPU/e_Tunit/memory/banc(32)
add wave -radix unsigned e_CPU/e_Tunit/memory/banc(42)
add wave -radix unsigned e_CPU/e_Tunit/banc_registres/banc(0)
add wave -radix unsigned e_CPU/e_Tunit/banc_registres/banc(1)
add wave -radix unsigned e_CPU/e_Tunit/banc_registres/banc(2)
add wave e_CPU/s_psr_in(3)
add wave -radix unsigned e_CPU/e_Iunit/pc_save
add wave /cpu_tb/e_CPU/e_Cunit/e_instruction_decoder/instr_courante
# add wave -radix hexadecimal /cpu_tb/e_CPU/e_Tunit/banc_registres/ra
# add wave -radix hexadecimal /cpu_tb/e_CPU/e_Tunit/banc_registres/rb
# add wave -radix hexadecimal /cpu_tb/e_CPU/e_Tunit/banc_registres/rw
# add wave -radix hexadecimal /cpu_tb/e_CPU/e_Tunit/banc_registres/a
# add wave -radix hexadecimal /cpu_tb/e_CPU/e_Tunit/banc_registres/b
# add wave /cpu_tb/e_CPU/e_Tunit/mux_rb_rw/A
# add wave /cpu_tb/e_CPU/e_Tunit/mux_rb_rw/B
# add wave /cpu_tb/e_CPU/e_Tunit/mux_rb_rw/COM
# add wave /cpu_tb/e_CPU/e_Tunit/mux_rb_rw/S

run 120 ns
