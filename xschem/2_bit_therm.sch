v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 -480 230 -390 {
lab=THERM_2_BIT_IO}
N 380 -480 380 -390 {
lab=THERM_2_BIT_IO}
N 380 -480 530 -480 {
lab=THERM_2_BIT_IO}
N 530 -480 530 -390 {
lab=THERM_2_BIT_IO}
N 530 -480 680 -480 {
lab=THERM_2_BIT_IO}
N 680 -480 680 -390 {
lab=THERM_2_BIT_IO}
N 230 -480 380 -480 {
lab=THERM_2_BIT_IO}
N 660 -430 660 -300 {
lab=VREF_L}
N 510 -430 510 -300 {
lab=VREF_L}
N 360 -430 360 -300 {
lab=VREF_L}
N 210 -430 210 -300 {
lab=VREF_L}
N 230 -270 230 -190 {
lab=T[0]}
N 380 -270 380 -190 {
lab=T[1]}
N 530 -270 530 -190 {
lab=T[2]}
N 680 -270 680 -190 {
lab=T[3]}
N 150 -430 660 -430 {
lab=VREF_L}
N 140 -180 670 -180 {bus=true
lab=T[3:0]}
C {symbols/ppolyf_u_3k.sym} 230 -360 0 0 {name=R11
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 230 -300 0 0 {name=R12
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 140 -180 0 0 {name=p0 lab=T[3:0]}
C {symbols/ppolyf_u_3k.sym} 380 -360 0 0 {name=R19
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 380 -300 0 0 {name=R20
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 530 -360 0 0 {name=R21
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 530 -300 0 0 {name=R22
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 680 -360 0 0 {name=R17
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 680 -300 0 0 {name=R18
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {iopin.sym} 230 -480 0 1 {name=p1 lab=THERM_2_BIT_IO}
C {ipin.sym} 150 -430 0 0 {name=p2 lab=VREF_L}
C {bus_tap.sym} 220 -180 0 0 {name=l2 lab=[0]}
C {bus_tap.sym} 370 -180 0 0 {name=l3 lab=[1]}
C {bus_tap.sym} 520 -180 0 0 {name=l4 lab=[2]}
C {bus_tap.sym} 670 -180 0 0 {name=l5 lab=[3]}
C {title.sym} 170 -60 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
