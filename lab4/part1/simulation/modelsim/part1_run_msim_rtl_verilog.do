transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Anna/Documents/ee_371/ee_371/lab4/part1 {C:/Users/Anna/Documents/ee_371/ee_371/lab4/part1/datapath.sv}
vlog -sv -work work +incdir+C:/Users/Anna/Documents/ee_371/ee_371/lab4/part1 {C:/Users/Anna/Documents/ee_371/ee_371/lab4/part1/controller.sv}
vlog -sv -work work +incdir+C:/Users/Anna/Documents/ee_371/ee_371/lab4/part1 {C:/Users/Anna/Documents/ee_371/ee_371/lab4/part1/top_level.sv}

