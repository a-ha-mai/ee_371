onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_tb/CLOCK_PERIOD
add wave -noupdate /DE1_SoC_tb/KEY
add wave -noupdate /DE1_SoC_tb/SW
add wave -noupdate /DE1_SoC_tb/HEX0
add wave -noupdate /DE1_SoC_tb/HEX1
add wave -noupdate /DE1_SoC_tb/HEX4
add wave -noupdate /DE1_SoC_tb/HEX5
add wave -noupdate /DE1_SoC_tb/clk
add wave -noupdate /DE1_SoC_tb/DataIn
add wave -noupdate /DE1_SoC_tb/DataOut
add wave -noupdate /DE1_SoC_tb/h0
add wave -noupdate /DE1_SoC_tb/h1
add wave -noupdate /DE1_SoC_tb/h4
add wave -noupdate /DE1_SoC_tb/h5
add wave -noupdate /DE1_SoC_tb/Address
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {1 ns}
