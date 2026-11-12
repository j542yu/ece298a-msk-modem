v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 110 -560 910 -160 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10e-6
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=""
color=""
dataset=-1
unitx=1
logx=0
logy=0
}
N 600 -1080 600 -940 {bus=true
lab=B[4:0]}
N 560 -1050 590 -1050 {
lab=B[0]}
N 560 -1020 590 -1020 {
lab=B[1]}
N 560 -990 590 -990 {
lab=B[2]}
N 560 -960 590 -960 {
lab=B[3]}
N 560 -930 590 -930 {
lab=B[4]}
N 650 -890 650 -690 {bus=true
lab=T[6:0]}
N 560 -900 640 -900 {
lab=T[0]}
N 560 -870 640 -870 {
lab=T[1]}
N 560 -840 640 -840 {
lab=T[2]}
N 560 -810 640 -810 {
lab=T[3]}
N 560 -780 640 -780 {
lab=T[4]}
N 560 -750 640 -750 {
lab=T[5]}
N 560 -720 640 -720 {
lab=T[6]}
N 90 -760 230 -760 {
lab=#net1}
C {tt_um_transmit_5_3_parax.sym} 400 -900 0 0 {name=x1}
C {title.sym} 180 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {gnd.sym} 490 -680 0 0 {name=l2 lab=GND}
C {vsource.sym} 460 -650 0 1 {name=V1 value=3.3 savecurrent=false}
C {gnd.sym} 460 -620 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 600 -1080 0 1 {lab=B[4:0]}
C {bus_tap.sym} 600 -1060 3 1 {name=l4 lab=[0]}
C {bus_tap.sym} 600 -1030 3 1 {name=l5 lab=[1]}
C {bus_tap.sym} 600 -1000 3 1 {name=l6 lab=[2]}
C {bus_tap.sym} 600 -970 3 1 {name=l7 lab=[3]}
C {bus_tap.sym} 600 -940 3 1 {name=l8 lab=[4]}
C {lab_pin.sym} 650 -690 0 1 {name=p5 lab=T[6:0]}
C {bus_tap.sym} 650 -890 0 1 {name=l9 lab=[0]}
C {bus_tap.sym} 650 -860 0 1 {name=l10 lab=[1]}
C {bus_tap.sym} 650 -830 0 1 {name=l11 lab=[2]}
C {bus_tap.sym} 650 -800 0 1 {name=l12 lab=[3]}
C {bus_tap.sym} 650 -770 0 1 {name=l13 lab=[4]}
C {bus_tap.sym} 650 -740 0 1 {name=l14 lab=[5]}
C {bus_tap.sym} 650 -710 0 1 {name=l15 lab=[6]}
C {vsource.sym} 90 -730 0 1 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} 90 -700 0 0 {name=l16 lab=GND}
C {ipin.sym} 230 -740 0 0 {name=p1 lab=clk}
C {ipin.sym} 230 -720 0 0 {name=p2 lab=rst_n}
C {ipin.sym} 230 -1050 0 0 {name=p3 lab=in}
C {launcher.sym} 800 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_transmit_5_3.raw tran"
}
C {code_shown.sym} 1020 -540 0 0 {name=CORNER only_toplevel=false value=".include $ngspice_dir/design.ngspice
.lib $ngspice_dir/sm141064.ngspice typical
.lib $ngspice_dir/sm141064.ngspice res_typical"}
C {code_shown.sym} 1020 -430 0 0 {name=SIM only_toplevel=false value="blabla"}
C {code_shown.sym} 1020 -350 0 0 {name=STIMULI only_toplevel=false value="blabla"}
