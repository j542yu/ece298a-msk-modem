v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 400 -480 440 -480 {
lab=#net1}
N 400 -480 400 -390 {
lab=#net1}
N 550 -480 590 -480 {
lab=#net2}
N 550 -480 550 -390 {
lab=#net2}
N 700 -480 740 -480 {
lab=#net3}
N 700 -480 700 -390 {
lab=#net3}
N 250 -480 250 -390 {
lab=#net4}
N 250 -270 250 -180 {
lab=B0}
N 400 -270 400 -180 {
lab=B1}
N 550 -270 550 -180 {
lab=B2}
N 700 -270 700 -180 {
lab=B3}
N 100 -480 100 -390 {
lab=#net4}
N 100 -270 100 -180 {
lab=VREF_L}
N 250 -480 300 -480 {
lab=#net4}
N 350 -480 400 -480 {
lab=#net1}
N 500 -480 550 -480 {
lab=#net2}
N 650 -480 700 -480 {
lab=#net3}
N 100 -480 250 -480 {
lab=#net4}
N 840 -480 880 -480 {
lab=#net5}
N 840 -480 840 -390 {
lab=#net5}
N 840 -270 840 -180 {
lab=B4}
N 800 -480 840 -480 {
lab=#net5}
N 940 -480 980 -480 {
lab=R2R_OUT}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 320 -480 1 0 {name=R1
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {title.sym} 170 -40 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 470 -480 1 0 {name=R2
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 400 -360 0 0 {name=R5
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 400 -300 0 0 {name=R6
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 550 -360 0 0 {name=R3
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 550 -300 0 0 {name=R4
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 620 -480 1 0 {name=R7
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 770 -480 1 0 {name=R8
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 700 -360 0 0 {name=R9
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 700 -300 0 0 {name=R10
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 250 -360 0 0 {name=R13
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 250 -300 0 0 {name=R14
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 100 -360 0 1 {name=R15
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 100 -300 0 1 {name=R16
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 250 -180 0 0 {name=p1 lab=B0}
C {ipin.sym} 400 -180 0 0 {name=p2 lab=B1}
C {ipin.sym} 550 -180 0 0 {name=p3 lab=B2}
C {ipin.sym} 700 -180 0 0 {name=p4 lab=B3}
C {opin.sym} 980 -480 2 1 {name=p5 lab=R2R_OUT}
C {ipin.sym} 100 -180 0 0 {name=p6 lab=VREF_L}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 910 -480 1 0 {name=R11
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {ipin.sym} 840 -180 0 0 {name=p7 lab=B4}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 840 -360 0 0 {name=R12
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/symbols/ppolyf_u_3k.sym} 840 -300 0 0 {name=R17
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
