v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 90 -210 90 -150 {
lab=GND}
N 110 -280 110 -240 {
lab=R_node}
C {gnd.sym} 90 -150 0 1 {name=l1 lab=GND}
C {ipin.sym} 110 -120 3 0 {name=p1 lab=in}
C {iopin.sym} 110 -280 0 0 {name=p3 lab=R_node}
C {symbols/ppolyf_u_1k.sym} 110 -150 0 0 {name=R7
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_1k.sym} 110 -210 0 0 {name=R1
W=2e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {title.sym} 170 -50 0 0 {name=l2 author="Judy Yu, Gracia Xia"}
