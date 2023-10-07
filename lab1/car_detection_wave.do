onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /car_detection/reset
add wave -noupdate /car_detection/clk
add wave -noupdate /car_detection/outer
add wave -noupdate /car_detection/inner
add wave -noupdate /car_detection/enter
add wave -noupdate /car_detection/exit
add wave -noupdate /car_detection/ps
add wave -noupdate /car_detection/ns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {840 ps}
