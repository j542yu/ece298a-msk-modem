v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 240 -230 260 -230 {
lab=#net1}
N 320 -230 370 -230 {
lab=oneR_2}
N 140 -230 180 -230 {
lab=1R_1}
N 210 -210 290 -210 {
lab=GND}
C {title.sym} 170 -50 0 0 {name=l7 author="Judy Yu, Gracia Xia"}
C {symbols/ppolyf_u_3k.sym} 210 -230 3 0 {name=R1
W=2e-6
L=30e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 290 -230 3 0 {name=R29
W=2e-6
L=30e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {iopin.sym} 140 -230 0 1 {name=p1 lab=1R_1 sim_pinnumber=1}
C {iopin.sym} 370 -230 0 0 {name=p2 lab=1R_2 sim_pinnumber=2}
C {gnd.sym} 250 -210 0 0 {name=l1 lab=GND}
