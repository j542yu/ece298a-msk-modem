v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 110 -560 910 -160 {flags=graph
y1=-0.164584
y2=1.06804
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.74001e-06
x2=2.2615e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="dac_sch_out

in
enable"
color="4 10 9"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=3}
C {title.sym} 180 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {launcher.sym} 800 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/mixed/mixed.raw tran"
}
C {code_shown.sym} 1020 -540 0 0 {name=CORNER only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical"}
C {code_shown.sym} 1020 -240 0 0 {name=STIMULI only_toplevel=false value=".include modulator_5_3_stimuli.spice"}
C {code_shown.sym} 1020 -430 0 0 {name=SIM only_toplevel=false value=".option wnflag=1

.control
    tran 1n 15us
    write tb_transmit_5_3.raw
.endc
"}
C {dac_5_3.sym} 1050 -870 0 0 {name=x2}
C {opin.sym} 1290 -880 0 0 {name=p7 lab=DAC_SCH_OUT}
C {gnd.sym} 1090 -830 0 0 {name=l17 lab=GND}
C {ipin.sym} 900 -880 0 0 {name=p4 sig_type=std_logic lab=B[4:0]}
C {ipin.sym} 900 -860 0 0 {name=p6 sig_type=std_logic lab=T[6:0]}
C {code_shown.sym} 1020 -170 0 0 {name=DIGITAL only_toplevel=false value="adut [ clk rst_n enable in ] [ B[4] B[3] B[2] B[1] B[0] T[6] T[5] T[4] T[3] T[2] T[1] T[0] ] null dut
.model dut d_cosim simulation="../../mixed/modulate_5_3.so""}
