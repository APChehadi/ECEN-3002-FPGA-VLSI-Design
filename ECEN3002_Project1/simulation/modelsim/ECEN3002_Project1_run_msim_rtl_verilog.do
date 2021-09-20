transcript on
if ![file isdirectory ECEN3002_Project1_iputf_libs] {
	file mkdir ECEN3002_Project1_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored/video_pll_sim/video_pll.vo"

vlog -vlog01compat -work work +incdir+C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored {C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored/ECEN3002_Project1.v}
vlog -vlog01compat -work work +incdir+C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored {C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored/VTC.v}
vlog -vlog01compat -work work +incdir+C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored {C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored/PG.v}

vlog -vlog01compat -work work +incdir+C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored {C:/Users/adamp/Desktop/Randy_ECEN3002_Project1_restored/TB_ECEN3002_Project1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_ECEN3002_Project1

add wave *
view structure
view signals
run -all
