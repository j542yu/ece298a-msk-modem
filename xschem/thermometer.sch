v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 110 -540 110 -450 {
lab=THERM_IO}
N 110 -330 110 -240 {
lab=T0}
N 260 -540 260 -450 {
lab=THERM_IO}
N 260 -330 260 -240 {
lab=T1}
N 260 -540 410 -540 {
lab=THERM_IO}
N 410 -540 410 -450 {
lab=THERM_IO}
N 410 -330 410 -240 {
lab=T2}
N 410 -540 560 -540 {
lab=THERM_IO}
N 560 -540 560 -450 {
lab=THERM_IO}
N 560 -330 560 -240 {
lab=T3}
N 560 -540 710 -540 {
lab=THERM_IO}
N 710 -540 710 -450 {
lab=THERM_IO}
N 710 -330 710 -240 {
lab=T4}
N 710 -540 860 -540 {
lab=THERM_IO}
N 860 -540 860 -450 {
lab=THERM_IO}
N 860 -330 860 -240 {
lab=T5}
N 860 -540 1010 -540 {
lab=THERM_IO}
N 1010 -540 1010 -450 {
lab=THERM_IO}
N 1010 -330 1010 -240 {
lab=T6}
N 110 -540 260 -540 {
lab=THERM_IO}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 110 -420 0 0 {name=R11
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 110 -360 0 0 {name=R12
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 110 -240 0 0 {name=p5 lab=T0}
C {ipin.sym} 260 -240 0 0 {name=p6 lab=T1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 260 -420 0 0 {name=R19
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 260 -360 0 0 {name=R20
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 410 -420 0 0 {name=R21
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 410 -360 0 0 {name=R22
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 560 -420 0 0 {name=R17
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 560 -360 0 0 {name=R18
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 410 -240 0 0 {name=p7 lab=T2}
C {ipin.sym} 560 -240 0 0 {name=p8 lab=T3}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 710 -420 0 0 {name=R23
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 710 -360 0 0 {name=R24
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 860 -420 0 0 {name=R25
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 860 -360 0 0 {name=R26
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 710 -240 0 0 {name=p9 lab=T4}
C {ipin.sym} 860 -240 0 0 {name=p10 lab=T5}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 1010 -420 0 0 {name=R27
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 1010 -360 0 0 {name=R28
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 1010 -240 0 0 {name=p11 lab=T6}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {iopin.sym} 110 -540 0 1 {name=p1 lab=THERM_IO}
