v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 -130 230 -70 {
lab=GND}
N 250 -200 250 -160 {
lab=R_node}
C {sky130_fd_pr/res_high_po_1p41.sym} 250 -130 0 0 {name=R1
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_1p41.sym} 250 -70 0 0 {name=R4
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {gnd.sym} 230 -70 0 1 {name=l1 lab=GND}
C {ipin.sym} 250 -40 3 0 {name=p1 lab=in}
C {iopin.sym} 250 -200 0 0 {name=p3 lab=R_node}
