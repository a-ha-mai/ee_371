onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fifo_tb/clk
add wave -noupdate /fifo_tb/reset
add wave -noupdate /fifo_tb/rd
add wave -noupdate /fifo_tb/wr
add wave -noupdate /fifo_tb/empty
add wave -noupdate /fifo_tb/full
add wave -noupdate /fifo_tb/c_unit/w_en
add wave -noupdate /fifo_tb/c_unit/r_en
add wave -noupdate /fifo_tb/w_data
add wave -noupdate /fifo_tb/c_unit/r_data
add wave -noupdate /fifo_tb/w_addr
add wave -noupdate /fifo_tb/c_unit/r_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {590 ps}
