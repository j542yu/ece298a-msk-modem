v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 60 -740 860 -340 {flags=graph
y1=-0.518331
y2=3.45709
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-8.42634e-06
x2=0.000149067
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="dac_out_r2r
dac_out_seg"
color="4 10"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1}
T {Simulation} 60 -830 0 0 1 1 {}
N 420 -970 460 -970 {
lab=DAC_OUT_SEG}
N 620 -980 660 -980 {
lab=GND}
N 660 -960 660 -930 {
lab=B_R[7:0]}
N 960 -980 1000 -980 {
lab=DAC_OUT_R2R}
C {8_bit_dac.sym} 270 -960 0 0 {name=x1}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {lab_pin.sym} 120 -950 0 0 {name=p3  lab=T[6:0]}
C {lab_pin.sym} 120 -970 0 0 {name=p5  lab=B[4:0]}
C {lab_pin.sym} 460 -970 0 1 {name=p7 lab=DAC_OUT_SEG}
C {code_shown.sym} 40 -280 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.include design.ngspice
.lib sm141064.ngspice ff
.lib sm141064.ngspice res_ff
"
spice_ignore=false}
C {code_shown.sym} 420 -280 0 0 {name=STIMULI only_toplevel=false value=".option wnflag=1

.control
    tran 10n 256u
    write tb_8_bit_dac.raw
.endc
"}
C {code_shown.sym} 720 -280 0 0 {name=INCLUDE only_toplevel=false value=".include dac_sine_1.0us_5_3.spice

.include dac_sine_1.0us_8_0.spice"}
C {ipin.sym} 130 -1100 0 0 {name=p1 lab=B[4:0]}
C {ipin.sym} 130 -1060 0 0 {name=p2 lab=T[6:0]}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/full_r2r.sym} 810 -970 0 0 {name=x2}
C {gnd.sym} 620 -980 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 660 -930 0 0 {name=p6  lab=B_R[7:0]}
C {lab_pin.sym} 1000 -980 0 1 {name=p8 lab=DAC_OUT_R2R}
C {ipin.sym} 690 -1060 0 0 {name=p10 lab=B_R[7:0]}
C {ipin.sym} 230 -1060 0 1 {name=p4 lab=DAC_OUT_SEG}
C {ipin.sym} 810 -1060 0 1 {name=p9 lab=DAC_OUT_R2R}
C {launcher.sym} 840 -190 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_8_bit_dac.raw tran"
}
