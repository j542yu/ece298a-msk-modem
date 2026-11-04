v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 240 -330 240 -300 {
lab=#net1}
N 240 -300 240 -280 {
lab=#net1}
N 400 -330 400 -300 {
lab=#net2}
N 560 -330 560 -300 {
lab=#net3}
N 720 -330 720 -300 {
lab=#net4}
N 880 -330 880 -300 {
lab=#net5}
N 1040 -330 1040 -300 {
lab=#net6}
N 1200 -330 1200 -300 {
lab=DAC_OUT}
N 1360 -330 1360 -300 {
lab=DAC_OUT}
N 1520 -330 1520 -300 {
lab=DAC_OUT}
N 1200 -300 1520 -300 {
lab=DAC_OUT}
N 240 -520 240 -490 {
lab=B[0]}
N 400 -520 400 -490 {
lab=B[1]}
N 560 -520 560 -490 {
lab=B[2]}
N 720 -520 720 -490 {
lab=B[3]}
N 880 -520 880 -490 {
lab=B[4]}
N 1040 -520 1040 -490 {
lab=B[5]}
N 1200 -570 1200 -490 {
lab=T[0]}
N 1360 -570 1360 -490 {
lab=T[1]}
N 1520 -570 1520 -490 {
lab=T[2]}
N 140 -580 1530 -580 {
lab=T[2:0] bus=true
}
N 140 -530 1050 -530 {
lab=B[5:0] bus=true}
N 1520 -300 1570 -300 {
lab=DAC_OUT}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/1R.sym} 320 -300 0 0 {name=X1R_R1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 240 -410 1 0 {name=X2R_R0}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 240 -200 1 0 {name=X2R_Rg}
C {gnd.sym} 240 -120 0 0 {name=l2 lab=GND}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 400 -410 1 0 {name=X2R_R1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/1R.sym} 480 -300 0 0 {name=X1R_R2}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 560 -410 1 0 {name=X2R_R2}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/1R.sym} 640 -300 0 0 {name=X1R_R3}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 720 -410 1 0 {name=X2R_R3}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/1R.sym} 800 -300 0 0 {name=X1R_R4}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 880 -410 1 0 {name=X2R_R4}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/1R.sym} 960 -300 0 0 {name=X1R_R5}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 1040 -410 1 0 {name=X2R_R5}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/1R.sym} 1120 -300 0 0 {name=X1R_R6}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 1200 -410 1 0 {name=X2R_R6}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 1360 -410 1 0 {name=X2R_R7}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/2R.sym} 1520 -410 1 0 {name=X2R_R8}
C {bus_tap.sym} 250 -530 2 0 {name=l3 lab=[0]}
C {bus_tap.sym} 410 -530 2 0 {name=l4 lab=[1]}
C {bus_tap.sym} 570 -530 2 0 {name=l5 lab=[2]}
C {bus_tap.sym} 730 -530 2 0 {name=l6 lab=[3]
}
C {bus_tap.sym} 890 -530 2 0 {name=l7 lab=[4]
}
C {bus_tap.sym} 1050 -530 2 0 {name=l8 lab=[5]
}
C {bus_tap.sym} 1210 -580 2 0 {name=l9 lab=[0]
}
C {bus_tap.sym} 1370 -580 2 0 {name=l10 lab=[1]
}
C {bus_tap.sym} 1530 -580 2 0 {name=l11 lab=[2]
}
C {ipin.sym} 140 -530 0 0 {name=p1 lab=B[5:0]}
C {ipin.sym} 140 -580 0 0 {name=p2 lab=T[2:0]}
C {opin.sym} 1570 -300 0 0 {name=p3 lab=DAC_OUT}
