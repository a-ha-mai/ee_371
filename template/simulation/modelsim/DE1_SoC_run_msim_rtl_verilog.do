transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/Documents/ee_371/lab1 {D:/Documents/ee_371/lab1/fullAdder.sv}
vlog -sv -work work +incdir+D:/Documents/ee_371/lab1 {D:/Documents/ee_371/lab1/DE1_SoC.sv}

