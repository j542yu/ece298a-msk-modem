v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 110 -560 910 -160 {flags=graph
y1=-1.3475
y2=6.62438
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.10113e-08
x2=8.47003e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk
rst_n
in
enable"
color="4 10 12 8"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=3}
C {title.sym} 180 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {launcher.sym} 800 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_transmit_stimuli.raw tran"
}
C {code_shown.sym} 1020 -540 0 0 {name=CORNER only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical"}
C {code_shown.sym} 1020 -240 0 0 {name=STIMULI only_toplevel=false value=".include modulator_5_3_stimuli.spice"}
C {code_shown.sym} 1020 -430 0 0 {name=SIM only_toplevel=false value=".option wnflag=1

.control
    tran 5n 5us
    write tb_transmit_stimuli.raw
.endc
"}
