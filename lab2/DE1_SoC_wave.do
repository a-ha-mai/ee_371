onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_tb/CLOCK_50
add wave -noupdate {/DE1_SoC_tb/KEY[0]}
add wave -noupdate {/DE1_SoC_tb/SW[0]}
add wave -noupdate -expand -group Address /DE1_SoC_tb/dut3/address
add wave -noupdate -expand -group Address /DE1_SoC_tb/HEX5
add wave -noupdate -expand -group Address /DE1_SoC_tb/dut2/h5
add wave -noupdate -expand -group Address /DE1_SoC_tb/HEX4
add wave -noupdate -expand -group Address /DE1_SoC_tb/dut2/h4
add wave -noupdate -expand -group Address {/DE1_SoC_tb/SW[8]}
add wave -noupdate -expand -group Address {/DE1_SoC_tb/SW[7]}
add wave -noupdate -expand -group Address {/DE1_SoC_tb/SW[6]}
add wave -noupdate -expand -group Address {/DE1_SoC_tb/SW[5]}
add wave -noupdate -expand -group Address {/DE1_SoC_tb/SW[4]}
add wave -noupdate -expand -group DataIn /DE1_SoC_tb/dut3/data
add wave -noupdate -expand -group DataIn /DE1_SoC_tb/HEX1
add wave -noupdate -expand -group DataIn /DE1_SoC_tb/dut2/h1
add wave -noupdate -expand -group DataIn {/DE1_SoC_tb/SW[3]}
add wave -noupdate -expand -group DataIn {/DE1_SoC_tb/SW[2]}
add wave -noupdate -expand -group DataIn {/DE1_SoC_tb/SW[1]}
add wave -noupdate -expand -group DataOut /DE1_SoC_tb/dut3/q
add wave -noupdate -expand -group DataOut /DE1_SoC_tb/HEX0
add wave -noupdate -expand -group DataOut /DE1_SoC_tb/dut2/h0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {498 ps} 0}
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
WaveRestoreZoom {0 ps} {2808 ps}
