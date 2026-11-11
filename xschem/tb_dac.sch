v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 140 -610 940 -210 {flags=graph
y1=2.18771
y2=3.89021
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=4.11632e-06
x2=5.49148e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="dac_5_3_out
dac_out"
color="4 9"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=2}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {launcher.sym} 820 -140 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac.raw tran"
}
C {dac_5_3.sym} 320 -690 0 0 {name=x1}
C {code_shown.sym} 1000 -430 0 0 {name=SIM only_toplevel=false value=".option wnflag=1

.control
    tran 200p 7us
    write tb_dac.raw
.endc
"}
C {code_shown.sym} 1000 -270 0 0 {name=STIMULI only_toplevel=false value=".include dac_ramp_sampling-50.0MHz_3.3V_5_3.spice

.include sim_dac_ramp.spice"}
C {ipin.sym} 170 -700 0 0 {name=p1 lab=B_5_3[4:0]}
C {ipin.sym} 170 -680 0 0 {name=p2 lab=T_5_3[6:0]}
C {opin.sym} 470 -700 0 0 {name=p3 lab=DAC_OUT}
C {code_shown.sym} 1000 -530 0 0 {name=CORNER only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical"}
C {code_shown.sym} 995 -610 0 0 {name=PARAX only_toplevel=false value=".include /home/j542yu/Documents/ece298a-msk-modem/mag/dac_5_3.mag.sim.spice"}
