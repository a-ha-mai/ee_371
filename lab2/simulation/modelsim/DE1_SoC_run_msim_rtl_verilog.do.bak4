transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Anna/Documents/ee_371/ee_371/lab2 {C:/Users/Anna/Documents/ee_371/ee_371/lab2/ram32x3.v}
vlog -sv -work work +incdir+C:/Users/Anna/Documents/ee_371/ee_371/lab2 {C:/Users/Anna/Documents/ee_371/ee_371/lab2/task1.sv}

