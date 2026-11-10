v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 340 -450 340 -390 {
lab=R_node_in}
N 460 -420 530 -420 {
lab=R_node_out}
N 280 -270 280 -240 {
lab=in}
N 280 -420 280 -390 {
lab=R_node_in}
N 280 -420 340 -420 {
lab=R_node_in}
N 460 -450 460 -390 {
lab=R_node_out}
N 260 -360 260 -300 {
lab=GND}
N 370 -370 430 -370 {
lab=GND}
N 370 -430 430 -430 {
lab=GND}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {sky130_fd_pr/res_high_po_1p41.sym} 280 -360 0 0 {name=R1
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_1p41.sym} 370 -450 3 0 {name=R2
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_1p41.sym} 370 -390 3 0 {name=R3
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {ipin.sym} 280 -240 3 0 {name=p1 lab=in}
C {iopin.sym} 530 -420 0 0 {name=p2 lab=R_node_out}
C {iopin.sym} 280 -420 0 1 {name=p3 lab=R_node_in}
C {sky130_fd_pr/res_high_po_1p41.sym} 280 -300 0 0 {name=R4
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_1p41.sym} 430 -450 3 0 {name=R5
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_1p41.sym} 430 -390 3 0 {name=R6
L=42.3
model=res_high_po_1p41
spiceprefix=X
mult=1}
C {gnd.sym} 260 -300 0 1 {name=l2 lab=GND}
C {lab_pin.sym} 400 -370 3 0 {name=p4 sig_type=std_logic lab=GND}
C {lab_pin.sym} 400 -430 3 0 {name=p5 sig_type=std_logic lab=GND}
