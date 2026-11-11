v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -380 970 -380 {bus=true
lab=B[4:0]}
N 150 -460 270 -460 {
lab=#net1}
N 1120 -460 1990 -460 {
lab=DAC_OUT}
N 1080 -260 1920 -260 {bus=true
lab=T[6:0]}
N 170 -430 170 -370 {
lab=VGND}
N 280 -150 300 -150 {
lab=VGND}
N 300 -180 300 -150 {
lab=VGND}
N 300 -150 410 -150 {
lab=VGND}
N 160 -210 410 -210 {
lab=VGND}
N 430 -180 430 -150 {
lab=VGND}
N 410 -150 430 -150 {
lab=VGND}
N 180 -180 180 -150 {
lab=VGND}
N 150 -340 150 -320 {
lab=VGND}
N 150 -340 170 -340 {
lab=VGND}
N 170 -370 170 -340 {
lab=VGND}
N 400 -390 400 -350 {
lab=VGND}
N 400 -350 1080 -350 {
lab=VGND}
N 1080 -390 1080 -350 {
lab=VGND}
N 570 -390 570 -350 {
lab=VGND}
N 740 -390 740 -350 {
lab=VGND}
N 910 -390 910 -350 {
lab=VGND}
N 1120 -320 1120 -240 {
lab=VGND}
N 1120 -240 1900 -240 {
lab=VGND}
N 1900 -320 1900 -240 {
lab=VGND}
N 1650 -320 1650 -240 {
lab=VGND}
N 1780 -320 1780 -240 {
lab=VGND}
N 1520 -320 1520 -240 {
lab=VGND}
N 1380 -320 1380 -240 {
lab=VGND}
N 1250 -320 1250 -240 {
lab=VGND}
N 410 -210 430 -210 {
lab=VGND}
N 430 -210 430 -180 {
lab=VGND}
N 100 -150 280 -150 {
lab=VGND}
N 100 -210 160 -210 {
lab=VGND}
C {dac_sub_r2r.sym} 350 -430 0 0 {name=x1}
C {dac_sub_r2r.sym} 520 -430 0 0 {name=x2}
C {dac_sub_r2r.sym} 690 -430 0 0 {name=x3}
C {dac_sub_r2r.sym} 860 -430 0 0 {name=x4}
C {dac_sub_r2r.sym} 1030 -430 0 0 {name=x5}
C {bus_tap.sym} 290 -380 0 0 {name=l1 lab=[0]}
C {bus_tap.sym} 460 -380 0 0 {name=l2 lab=[1]}
C {bus_tap.sym} 630 -380 0 0 {name=l3 lab=[2]}
C {bus_tap.sym} 800 -380 0 0 {name=l4 lab=[3]}
C {bus_tap.sym} 970 -380 0 0 {name=l5 lab=[4]}
C {ipin.sym} 260 -380 0 0 {name=p1 lab=B[4:0]}
C {title.sym} 200 -70 0 0 {name=l7 author="Judy Yu, Gracia Xia"}
C {dac_sub_therm.sym} 1150 -370 0 0 {name=x6}
C {dac_sub_therm.sym} 1280 -370 0 0 {name=x7}
C {dac_sub_therm.sym} 1410 -370 0 0 {name=x8}
C {dac_sub_therm.sym} 1550 -370 0 0 {name=x9}
C {dac_sub_therm.sym} 1680 -370 0 0 {name=x10}
C {dac_sub_therm.sym} 1810 -370 0 0 {name=x11}
C {dac_sub_therm.sym} 1930 -370 0 0 {name=x12}
C {bus_tap.sym} 1140 -260 0 0 {name=l8 lab=[0]}
C {bus_tap.sym} 1270 -260 0 0 {name=l9 lab=[1]}
C {bus_tap.sym} 1400 -260 0 0 {name=l10 lab=[2]}
C {bus_tap.sym} 1540 -260 0 0 {name=l11 lab=[3]}
C {bus_tap.sym} 1670 -260 0 0 {name=l12 lab=[4]}
C {bus_tap.sym} 1800 -260 0 0 {name=l13 lab=[5]}
C {bus_tap.sym} 1920 -260 0 0 {name=l14 lab=[6]}
C {ipin.sym} 1080 -260 0 0 {name=p2 lab=T[6:0]}
C {opin.sym} 1990 -460 0 0 {name=p3 lab=DAC_OUT}
C {symbols/ppolyf_u_1k.sym} 150 -370 0 1 {name=R2
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 150 -430 0 1 {name=R3
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 280 -180 0 1 {name=R4
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 410 -180 0 1 {name=R5
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 160 -180 0 1 {name=R7
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {iopin.sym} 150 -320 0 1 {name=p4 lab=VGND}
C {lab_pin.sym} 100 -150 0 0 {name=p5 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 400 -350 0 0 {name=p6 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 1150 -240 3 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 100 -210 0 0 {name=p8 sig_type=std_logic lab=VGND}
