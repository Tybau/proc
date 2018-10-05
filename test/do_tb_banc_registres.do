puts "Simulation banc registres"

vlib work
vcom -93 ../src/banc_registres.vhd
vcom -93 ../test/tb_banc_registres.vhd

vsim tb_banc_registres

add wave s_a
add wave s_b
add wave s_clk
add wave s_ra
add wave s_rb
add wave s_rw
add wave s_w
add wave s_we

run 20 ns
