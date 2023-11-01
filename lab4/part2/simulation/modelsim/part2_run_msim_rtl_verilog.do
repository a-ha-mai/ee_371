transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Documents/ee_371/lab4/part2 {D:/Documents/ee_371/lab4/part2/rom32x8.v}
vlog -sv -work work +incdir+D:/Documents/ee_371/lab4/part2 {D:/Documents/ee_371/lab4/part2/datapath.sv}
vlog -sv -work work +incdir+D:/Documents/ee_371/lab4/part2 {D:/Documents/ee_371/lab4/part2/controller.sv}
vlog -sv -work work +incdir+D:/Documents/ee_371/lab4/part2 {D:/Documents/ee_371/lab4/part2/top_level.sv}

