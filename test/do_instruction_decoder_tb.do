puts "Simulation ctrl"

vlib work
vcom -93 ../src/instruction_decoder.vhd
vcom -93 ../test/instruction_decoder_tb.vhd

vsim instruction_decoder_tb

add wave -radix hexadecimal s_instruction
add wave s_n_pc_sel
add wave s_reg_wr
add wave s_alu_src
add wave s_alu_ctr
add wave s_psr_en
add wave s_mem_wr
add wave s_wr_src
add wave -radix hexadecimal s_rw
add wave -radix hexadecimal s_ra
add wave -radix hexadecimal s_rb
add wave -radix hexadecimal s_imm
add wave -radix hexadecimal s_offset
add wave -radix hexadecimal s_psr_out
add wave /instruction_decoder_tb/instruction_decoder/instr_courante

run 20 ns
