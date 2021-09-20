transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/adamp/OneDrive\ -\ UCB-O365/ECEN\ 3002/ECEN3002_Project1 {C:/Users/adamp/OneDrive - UCB-O365/ECEN 3002/ECEN3002_Project1/de10_standard.v}

vlog -vlog01compat -work work +incdir+C:/Users/adamp/OneDrive\ -\ UCB-O365/ECEN\ 3002/ECEN3002_Project1 {C:/Users/adamp/OneDrive - UCB-O365/ECEN 3002/ECEN3002_Project1/TB_ECEN3002_Project1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_ECEN3002_Project1

add wave *
view structure
view signals
run -all
