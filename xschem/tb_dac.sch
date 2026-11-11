v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 140 -610 940 -210 {flags=graph
y1=-11.2286
y2=10.9888
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=6.41818e-07
x2=2.92822e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="dac_parax_out
dac_sch_out"
color="4 9"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0}
N 220 -1160 220 -1020 {bus=true
lab=B_5_3[4:0]}
N 230 -1130 260 -1130 {
lab=B_5_3[0]}
N 230 -1100 260 -1100 {
lab=B_5_3[1]}
N 230 -1070 260 -1070 {
lab=B_5_3[2]}
N 230 -1040 260 -1040 {
lab=B_5_3[3]}
N 230 -1010 260 -1010 {
lab=B_5_3[4]}
N 170 -970 170 -770 {bus=true
lab=T_5_3[6:0]}
N 180 -980 260 -980 {
lab=T_5_3[0]}
N 180 -950 260 -950 {
lab=T_5_3[1]}
N 180 -920 260 -920 {
lab=T_5_3[2]}
N 180 -890 260 -890 {
lab=T_5_3[3]}
N 180 -860 260 -860 {
lab=T_5_3[4]}
N 180 -830 260 -830 {
lab=T_5_3[5]}
N 180 -800 260 -800 {
lab=T_5_3[6]}
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
C {code_shown.sym} 1000 -270 0 0 {name=STIMULI only_toplevel=false value=".include /home/j542yu/Documents/ece298a-msk-modem/xschem/simulation/dac_ramp_sampling-50.0MHz_3.3V_5_3.spice"}
C {ipin.sym} 170 -700 0 0 {name=p1 lab=B_5_3[4:0]}
C {ipin.sym} 170 -680 0 0 {name=p2 lab=T_5_3[6:0]}
C {opin.sym} 470 -700 0 0 {name=p3 lab=DAC_SCH_OUT}
C {code_shown.sym} 1000 -530 0 0 {name=CORNER only_toplevel=false value=".include /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /usr/local/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical"}
C {dac_5_3_parax.sym} 430 -980 0 0 {name=x2}
C {lab_pin.sym} 220 -1160 0 0 {lab=B_5_3[4:0]}
C {bus_tap.sym} 220 -1140 1 0 {name=l2 lab=[0]}
C {bus_tap.sym} 220 -1110 1 0 {name=l3 lab=[1]}
C {bus_tap.sym} 220 -1080 1 0 {name=l4 lab=[2]}
C {bus_tap.sym} 220 -1050 1 0 {name=l5 lab=[3]}
C {bus_tap.sym} 220 -1020 1 0 {name=l6 lab=[4]}
C {lab_pin.sym} 170 -770 0 0 {name=p5 lab=T_5_3[6:0]}
C {bus_tap.sym} 170 -970 0 0 {name=l7 lab=[0]}
C {bus_tap.sym} 170 -940 0 0 {name=l8 lab=[1]}
C {bus_tap.sym} 170 -910 0 0 {name=l9 lab=[2]}
C {bus_tap.sym} 170 -880 0 0 {name=l10 lab=[3]}
C {bus_tap.sym} 170 -850 0 0 {name=l11 lab=[4]}
C {bus_tap.sym} 170 -820 0 0 {name=l12 lab=[5]}
C {bus_tap.sym} 170 -790 0 0 {name=l13 lab=[6]}
C {opin.sym} 590 -1130 0 0 {name=p4 lab=DAC_PARAX_OUT}
C {gnd.sym} 360 -650 0 0 {name=l14 lab=GND}
C {gnd.sym} 520 -760 0 0 {name=l15 lab=GND}
C {code_shown.sym} 990 -640 0 0 {name=PARAX only_toplevel=false value=".include /home/j542yu/Documents/ece298a-msk-modem/mag/dac_5_3.sim.spice"}
