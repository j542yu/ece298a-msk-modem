v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 140 -610 940 -210 {flags=graph
y1=-1.35264
y2=4.61933
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=3.90866e-06
x2=9.75832e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="dac_5_3_out"
color="4"
dataset=-1
unitx=1
logx=0
logy=0
}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {launcher.sym} 820 -140 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac.raw tran"
}
C {dac_seg_5_3.sym} 320 -690 0 0 {name=x1}
C {code_shown.sym} 1000 -430 0 0 {name=SIM only_toplevel=false value=".option wnflag=1

.control
    tran 100p 16us
    write tb_dac.raw
.endc
"}
C {code_shown.sym} 1000 -270 0 0 {name=STIMULI only_toplevel=false value=".include dac_sine_sampling-50.0MHz_if-3.5MHz_5_3.spice"}
C {ipin.sym} 170 -700 0 0 {name=p1 lab=B_5_3[4:0]}
C {ipin.sym} 170 -680 0 0 {name=p2 lab=T_5_3[6:0]}
C {opin.sym} 470 -700 0 0 {name=p3 lab=DAC_5_3_OUT}
C {sky130_fd_pr/corner.sym} 980 -600 0 0 {name=CORNER only_toplevel=true corner=tt}
