v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 60 -740 860 -340 {flags=graph
y1=-4.1e-09
y2=3.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-13
x2=1.4e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=DAC_OUT
color=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1148723968}
T {Simulation} 60 -830 0 0 1 1 {}
N 420 -970 460 -970 {
lab=DAC_OUT}
C {8_bit_dac.sym} 270 -960 0 0 {name=x1}
C {title.sym} 160 -50 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {lab_pin.sym} 120 -950 0 0 {name=p3 sig_type=std_logic lab=T[6:0]}
C {lab_pin.sym} 120 -970 0 0 {name=p5 sig_type=std_logic lab=B[4:0]}
C {lab_pin.sym} 460 -970 0 1 {name=p7 sig_type=std_logic lab=DAC_OUT}
