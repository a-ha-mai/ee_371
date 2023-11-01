onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_level_tb/reset
add wave -noupdate /top_level_tb/clk
add wave -noupdate /top_level_tb/s
add wave -noupdate -radix unsigned /top_level_tb/A
add wave -noupdate -radix unsigned /top_level_tb/dut/data_out
add wave -noupdate /top_level_tb/done
add wave -noupdate /top_level_tb/found
add wave -noupdate -radix unsigned /top_level_tb/loc
add wave -noupdate /top_level_tb/dut/d_unit/m_ptr
add wave -noupdate /top_level_tb/dut/d_unit/l_ptr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3055 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 2
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1914 ps} {7847 ps}
