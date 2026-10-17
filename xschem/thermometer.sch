v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 110 -540 110 -450 {
lab=THERM_IO}
N 260 -540 260 -450 {
lab=THERM_IO}
N 260 -540 410 -540 {
lab=THERM_IO}
N 410 -540 410 -450 {
lab=THERM_IO}
N 410 -540 560 -540 {
lab=THERM_IO}
N 560 -540 560 -450 {
lab=THERM_IO}
N 560 -540 710 -540 {
lab=THERM_IO}
N 710 -540 710 -450 {
lab=THERM_IO}
N 710 -540 860 -540 {
lab=THERM_IO}
N 860 -540 860 -450 {
lab=THERM_IO}
N 860 -540 1010 -540 {
lab=THERM_IO}
N 1010 -540 1010 -450 {
lab=THERM_IO}
N 110 -540 260 -540 {
lab=THERM_IO}
N 80 -490 990 -490 {
lab=VREF_L}
N 990 -490 990 -360 {
lab=VREF_L}
N 840 -490 840 -360 {
lab=VREF_L}
N 690 -490 690 -360 {
lab=VREF_L}
N 540 -490 540 -360 {
lab=VREF_L}
N 390 -490 390 -360 {
lab=VREF_L}
N 240 -490 240 -360 {
lab=VREF_L}
N 90 -490 90 -360 {
lab=VREF_L}
N 110 -330 110 -250 {
lab=T[0]}
N 260 -330 260 -250 {
lab=T[1]}
N 410 -330 410 -250 {
lab=T[2]}
N 560 -330 560 -250 {
lab=T[3]}
N 710 -330 710 -250 {
lab=T[4]}
N 860 -330 860 -250 {
lab=T[5]}
N 1010 -330 1010 -250 {
lab=T[6]}
N 80 -240 1000 -240 {lab=T[6:0] bus=true}
C {symbols/ppolyf_u_3k.sym} 110 -420 0 0 {name=R11
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 110 -360 0 0 {name=R12
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 80 -240 0 0 {name=p0 lab=T[6:0]}
C {symbols/ppolyf_u_3k.sym} 260 -420 0 0 {name=R19
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 260 -360 0 0 {name=R20
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 410 -420 0 0 {name=R21
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 410 -360 0 0 {name=R22
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 560 -420 0 0 {name=R17
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 560 -360 0 0 {name=R18
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 710 -420 0 0 {name=R23
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 710 -360 0 0 {name=R24
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 860 -420 0 0 {name=R25
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 860 -360 0 0 {name=R26
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 1010 -420 0 0 {name=R27
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 1010 -360 0 0 {name=R28
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {iopin.sym} 110 -540 0 1 {name=p1 lab=THERM_IO}
C {ipin.sym} 80 -490 0 0 {name=p2 lab=VREF_L}
C {bus_tap.sym} 100 -240 0 0 {name=l2 lab=[0]}
C {bus_tap.sym} 250 -240 0 0 {name=l3 lab=[1]}
C {bus_tap.sym} 400 -240 0 0 {name=l4 lab=[2]}
C {bus_tap.sym} 550 -240 0 0 {name=l5 lab=[3]}
C {bus_tap.sym} 700 -240 0 0 {name=l6 lab=[4]}
C {bus_tap.sym} 850 -240 0 0 {name=l7 lab=[5]}
C {bus_tap.sym} 1000 -240 0 0 {name=l8 lab=[6]}
