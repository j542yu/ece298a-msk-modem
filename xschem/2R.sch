v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 240 -230 260 -230 {
lab=#net1}
N 140 -230 180 -230 {
lab=2R_1}
N 210 -210 290 -210 {
lab=GND}
N 320 -230 340 -230 {
lab=#net2}
N 400 -230 420 -230 {
lab=#net3}
N 290 -210 450 -210 {
lab=GND}
N 480 -230 520 -230 {
lab=2R_2}
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
C {iopin.sym} 140 -230 0 1 {name=p1 lab=2R_1 sim_pinnumber=1}
C {iopin.sym} 520 -230 0 0 {name=p2 lab=2R_2 sim_pinnumber=2}
C {gnd.sym} 330 -210 0 0 {name=l1 lab=GND}
C {symbols/ppolyf_u_3k.sym} 370 -230 3 0 {name=R2
W=2e-6
L=30e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 450 -230 3 0 {name=R3
W=2e-6
L=30e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
