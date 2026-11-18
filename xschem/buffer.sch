v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 190 -300 390 -300 {
lab=#net1}
N 290 -300 290 -280 {
lab=#net1}
N 190 -440 190 -360 {
lab=#net2}
N 390 -440 390 -360 {
lab=#net3}
N 230 -470 350 -470 {
lab=#net2}
N 290 -470 290 -430 {
lab=#net2}
N 190 -430 290 -430 {
lab=#net2}
N 390 -440 480 -440 {
lab=#net3}
N 530 -440 600 -440 {
lab=#net4}
N 480 -470 480 -440 {
lab=#net3}
N 480 -470 560 -470 {
lab=#net3}
N 190 -500 600 -500 {
lab=VDD}
N 420 -530 420 -500 {
lab=VDD}
N 600 -440 600 -280 {
lab=#net4}
N 60 -340 60 -280 {
lab=#net5}
N 60 -310 100 -310 {
lab=#net5}
N 100 -310 100 -250 {
lab=#net5}
N 530 -250 530 -240 {
lab=#net5}
N 530 -250 560 -250 {
lab=#net5}
N 330 -220 330 -180 {
lab=VSS}
N 250 -250 250 -240 {
lab=#net5}
N 250 -240 530 -240 {
lab=#net5}
N 100 -250 250 -250 {
lab=#net5}
N 60 -220 600 -220 {
lab=VSS}
N 60 -440 60 -400 {
lab=VDD}
C {symbols/nfet_03v3.sym} 170 -330 0 0 {name=M1
L=0.5u
W=4u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 410 -330 0 1 {name=M2
L=0.5u
W=4u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 210 -470 0 1 {name=M3
L=0.5u
W=8.5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 370 -470 0 0 {name=M4
L=0.5u
W=8.5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 580 -250 0 0 {name=M5
L=0.5u
W=7.5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {capa.sym} 510 -440 1 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 420 -530 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 270 -250 0 0 {name=M6
L=0.5u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 580 -470 0 0 {name=M7
L=0.5u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 80 -250 0 1 {name=M8
L=0.5u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 330 -180 0 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 390 -330 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 190 -330 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 60 -250 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 600 -250 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 190 -470 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 390 -470 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 600 -470 0 1 {name=p9 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 60 -440 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {iopin.sym} 100 -120 0 1 {name=p11 lab=VDD}
C {iopin.sym} 100 -90 0 1 {name=p12 lab=VSS}
C {ipin.sym} 100 -60 0 0 {name=p13 lab=VPLUS}
C {ipin.sym} 100 -30 0 0 {name=p14 lab=VMINUS}
C {lab_pin.sym} 150 -330 0 0 {name=p15 sig_type=std_logic lab=VPLUS}
C {lab_pin.sym} 430 -330 0 1 {name=p16 sig_type=std_logic lab=VMINUS}
C {lab_pin.sym} 290 -250 0 1 {name=p17 sig_type=std_logic lab=VSS}
C {isource.sym} 60 -370 0 0 {name=I0 value=\{Ibias\}}
