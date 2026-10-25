v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -540 170 -450 {
lab=THERM_3_BIT_IO}
N 320 -540 320 -450 {
lab=THERM_3_BIT_IO}
N 320 -540 470 -540 {
lab=THERM_3_BIT_IO}
N 470 -540 470 -450 {
lab=THERM_3_BIT_IO}
N 470 -540 620 -540 {
lab=THERM_3_BIT_IO}
N 620 -540 620 -450 {
lab=THERM_3_BIT_IO}
N 620 -540 770 -540 {
lab=THERM_3_BIT_IO}
N 770 -540 770 -450 {
lab=THERM_3_BIT_IO}
N 770 -540 920 -540 {
lab=THERM_3_BIT_IO}
N 920 -540 920 -450 {
lab=THERM_3_BIT_IO}
N 920 -540 1070 -540 {
lab=THERM_3_BIT_IO}
N 1070 -540 1070 -450 {
lab=THERM_3_BIT_IO}
N 170 -540 320 -540 {
lab=THERM_3_BIT_IO}
N 90 -490 1050 -490 {
lab=VREF_L}
N 1050 -490 1050 -360 {
lab=VREF_L}
N 900 -490 900 -360 {
lab=VREF_L}
N 750 -490 750 -360 {
lab=VREF_L}
N 600 -490 600 -360 {
lab=VREF_L}
N 450 -490 450 -360 {
lab=VREF_L}
N 300 -490 300 -360 {
lab=VREF_L}
N 150 -490 150 -360 {
lab=VREF_L}
N 170 -330 170 -250 {
lab=T[0]}
N 320 -330 320 -250 {
lab=T[1]}
N 470 -330 470 -250 {
lab=T[2]}
N 620 -330 620 -250 {
lab=T[3]}
N 770 -330 770 -250 {
lab=T[4]}
N 920 -330 920 -250 {
lab=T[5]}
N 1070 -330 1070 -250 {
lab=T[6]}
N 80 -240 1060 -240 {lab=T[6:0] bus=true}
C {symbols/ppolyf_u_3k.sym} 170 -420 0 0 {name=R11
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 170 -360 0 0 {name=R12
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 80 -240 0 0 {name=p0 lab=T[6:0]}
C {symbols/ppolyf_u_3k.sym} 320 -420 0 0 {name=R19
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 320 -360 0 0 {name=R20
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 470 -420 0 0 {name=R21
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 470 -360 0 0 {name=R22
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 620 -420 0 0 {name=R17
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 620 -360 0 0 {name=R18
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 770 -420 0 0 {name=R23
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 770 -360 0 0 {name=R24
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 920 -420 0 0 {name=R25
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 920 -360 0 0 {name=R26
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 1070 -420 0 0 {name=R27
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 1070 -360 0 0 {name=R28
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {iopin.sym} 170 -540 0 1 {name=p1 lab=THERM_3_BIT_IO}
C {ipin.sym} 90 -490 0 0 {name=p2 lab=VREF_L}
C {bus_tap.sym} 160 -240 0 0 {name=l2 lab=[0]}
C {bus_tap.sym} 310 -240 0 0 {name=l3 lab=[1]}
C {bus_tap.sym} 460 -240 0 0 {name=l4 lab=[2]}
C {bus_tap.sym} 610 -240 0 0 {name=l5 lab=[3]}
C {bus_tap.sym} 760 -240 0 0 {name=l6 lab=[4]}
C {bus_tap.sym} 910 -240 0 0 {name=l7 lab=[5]}
C {bus_tap.sym} 1060 -240 0 0 {name=l8 lab=[6]}
