onerror {quit -f}
vlib work
vlog -work work Lab6Part2.vo
vlog -work work Lab6Part2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SecondALUDiag_vlg_vec_tst
vcd file -direction Lab6Part2.msim.vcd
vcd add -internal SecondALUDiag_vlg_vec_tst/*
vcd add -internal SecondALUDiag_vlg_vec_tst/i1/*
add wave /*
run -all
