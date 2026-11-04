v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 60 -740 860 -340 {flags=graph
y1=-0.0500928
y2=3.49587
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.000101845
x2=0.000136007
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="dac_out_full_r2r
dac_out_6_2_seg
dac_out_5_3_seg"
color="4 10 6"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=1}
T {Simulation} 60 -830 0 0 1 1 {}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {code_shown.sym} 40 -280 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.include design.ngspice
.lib sm141064.ngspice ff
.lib sm141064.ngspice res_ff
"
spice_ignore=false}
C {code_shown.sym} 420 -280 0 0 {name=SIM only_toplevel=false value=".option wnflag=1

.control
    tran 3n 128u
    write tb_8_bit_dac.raw
.endc
"}
C {code_shown.sym} 720 -280 0 0 {name=STIMULI only_toplevel=false value=".include dac_sine_0.5us_5_3.spice

.include dac_sine_0.5us_6_2.spice

.include dac_sine_0.5us_8_0.spice"}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/8_0_dac.sym} 290 -1010 0 0 {name=x2}
C {gnd.sym} 140 -1000 0 1 {name=l2 lab=GND}
C {ipin.sym} 140 -1020 0 0 {name=p10 lab=B_8_0[7:0]}
C {opin.sym} 440 -1250 0 0 {name=p4 lab=DAC_OUT_5_3_SEG}
C {opin.sym} 440 -1020 0 0 {name=p9 lab=DAC_OUT_FULL_R2R}
C {launcher.sym} 800 -150 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_8_bit_dac.raw tran"
}
C {ipin.sym} 140 -1120 0 0 {name=p1 lab=T_6_2[2:0]}
C {ipin.sym} 140 -1140 0 0 {name=p2 lab=B_6_2[5:0]}
C {opin.sym} 440 -1140 0 0 {name=p3 lab=DAC_OUT_6_2_SEG}
C {ipin.sym} 140 -1230 0 0 {name=p5 lab=T_5_3[6:0]}
C {ipin.sym} 140 -1250 0 0 {name=p6 lab=B_5_3[4:0]}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/5_3_dac.sym} 290 -1230 0 0 {name=x1}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/6_2_dac.sym} 290 -1120 0 0 {name=x3}
C {gnd.sym} 140 -1210 0 1 {name=l3 lab=GND}
C {gnd.sym} 140 -1100 0 1 {name=l4 lab=GND}
C {/home/j542yu/Documents/ece298a-msk-modem/xschem/dac.sym} 910 -1240 0 0 {name=x4}
C {lab_pin.sym} 760 -1250 0 0 {name=p7 sig_type=std_logic lab=T_6_2[2:0]}
C {lab_pin.sym} 760 -1230 0 0 {name=p8 sig_type=std_logic lab=B_6_2[5:0]}
C {opin.sym} 1060 -1250 0 0 {name=p11 lab=DAC_OUT}
