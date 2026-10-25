v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 400 -480 440 -480 {
lab=#net1}
N 400 -480 400 -390 {
lab=#net1}
N 550 -480 590 -480 {
lab=#net2}
N 550 -480 550 -390 {
lab=#net2}
N 700 -480 740 -480 {
lab=#net3}
N 700 -480 700 -390 {
lab=#net3}
N 250 -480 250 -390 {
lab=#net4}
N 250 -270 250 -180 {
lab=B[0]}
N 400 -270 400 -180 {
lab=B[1]}
N 550 -270 550 -180 {
lab=B[2]}
N 700 -270 700 -180 {
lab=B[3]}
N 100 -480 100 -390 {
lab=#net4}
N 250 -480 300 -480 {
lab=#net4}
N 350 -480 400 -480 {
lab=#net1}
N 500 -480 550 -480 {
lab=#net2}
N 650 -480 700 -480 {
lab=#net3}
N 100 -480 250 -480 {
lab=#net4}
N 840 -480 880 -480 {
lab=#net5}
N 840 -480 840 -390 {
lab=#net5}
N 840 -270 840 -180 {
lab=B[4]}
N 800 -480 840 -480 {
lab=#net5}
N 940 -480 980 -480 {
lab=#net6}
N 80 -420 80 -360 {
lab=VREF_L}
N 80 -360 80 -300 {
lab=VREF_L}
N 230 -420 230 -300 {
lab=VREF_L}
N 80 -420 230 -420 {
lab=VREF_L}
N 380 -360 380 -300 {
lab=VREF_L}
N 380 -420 380 -360 {
lab=VREF_L}
N 230 -420 380 -420 {
lab=VREF_L}
N 530 -420 530 -300 {
lab=VREF_L}
N 380 -420 530 -420 {
lab=VREF_L}
N 680 -360 680 -300 {
lab=VREF_L}
N 680 -420 680 -360 {
lab=VREF_L}
N 530 -420 680 -420 {
lab=VREF_L}
N 820 -360 820 -300 {
lab=VREF_L}
N 820 -420 820 -360 {
lab=VREF_L}
N 680 -420 820 -420 {
lab=VREF_L}
N 330 -460 330 -420 {
lab=VREF_L}
N 470 -460 470 -420 {
lab=VREF_L}
N 620 -460 620 -420 {
lab=VREF_L}
N 770 -460 770 -420 {
lab=VREF_L}
N 820 -420 910 -420 {
lab=VREF_L}
N 910 -460 910 -420 {
lab=VREF_L}
N 100 -270 100 -240 {
lab=VREF_L}
N 80 -240 100 -240 {
lab=VREF_L}
N 400 -270 400 -250 {
lab=B[1]}
N 400 -330 400 -310 {
lab=#net7}
N 380 -300 380 -280 {
lab=VREF_L}
N 550 -270 550 -250 {
lab=B[2]}
N 550 -330 550 -310 {
lab=#net8}
N 530 -300 530 -280 {
lab=VREF_L}
N 700 -270 700 -250 {
lab=B[3]}
N 700 -330 700 -310 {
lab=#net9}
N 680 -300 680 -280 {
lab=VREF_L}
N 250 -270 250 -250 {
lab=B[0]}
N 250 -330 250 -310 {
lab=#net10}
N 230 -300 230 -280 {
lab=VREF_L}
N 100 -330 100 -310 {
lab=#net11}
N 100 -270 100 -250 {
lab=VREF_L}
N 80 -300 80 -280 {
lab=VREF_L}
N 840 -270 840 -250 {
lab=B[4]}
N 840 -330 840 -310 {
lab=#net12}
N 820 -300 820 -280 {
lab=VREF_L}
N 980 -480 1020 -480 {
lab=#net6}
N 980 -480 980 -390 {
lab=#net6}
N 980 -270 980 -180 {
lab=B[5]}
N 1080 -480 1120 -480 {
lab=R2R_6_BIT_OUT}
N 960 -360 960 -300 {
lab=VREF_L}
N 960 -420 960 -360 {
lab=VREF_L}
N 960 -420 1050 -420 {
lab=VREF_L}
N 1050 -460 1050 -420 {
lab=VREF_L}
N 980 -270 980 -250 {
lab=B[5]}
N 980 -330 980 -310 {
lab=#net13}
N 960 -300 960 -280 {
lab=VREF_L}
N 910 -420 960 -420 {
lab=VREF_L}
N 70 -170 970 -170 {bus=true
lab=B[5:0]}
N 80 -280 80 -240 {
lab=VREF_L}
C {symbols/ppolyf_u_3k.sym} 330 -480 3 0 {name=R1
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 470 -480 3 0 {name=R2
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 400 -360 0 0 {name=R5
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 400 -280 0 0 {name=R6
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 550 -360 0 0 {name=R3
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 550 -280 0 0 {name=R4
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 620 -480 3 0 {name=R7
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 770 -480 3 0 {name=R8
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 700 -360 0 0 {name=R9
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 700 -280 0 0 {name=R10
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 250 -360 0 0 {name=R13
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 250 -280 0 0 {name=R14
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 100 -360 2 1 {name=R15
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 100 -280 2 1 {name=R16
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {opin.sym} 1120 -480 2 1 {name=p3 lab=R2R_6_BIT_OUT sim_pinnumber=3}
C {ipin.sym} 80 -240 0 0 {name=p2 lab=VREF_L sim_pinnumber=2}
C {symbols/ppolyf_u_3k.sym} 910 -480 3 0 {name=R11
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 840 -360 0 0 {name=R12
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 840 -280 0 0 {name=R17
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {bus_tap.sym} 240 -170 0 0 {name=l2 lab=[0]}
C {bus_tap.sym} 390 -170 0 0 {name=l3 lab=[1]}
C {bus_tap.sym} 540 -170 0 0 {name=l4 lab=[2]}
C {bus_tap.sym} 690 -170 0 0 {name=l5 lab=[3]}
C {bus_tap.sym} 830 -170 0 0 {name=l6 lab=[4]}
C {ipin.sym} 70 -170 0 0 {name=p1 lab=B[5:0] sim_pinnumber=1}
C {title.sym} 340 650 0 0 {name=l1 author="Judy Yu, Gracia Xia"}
C {title.sym} 170 -50 0 0 {name=l7 author="Judy Yu, Gracia Xia"}
C {symbols/ppolyf_u_3k.sym} 1050 -480 3 0 {name=R18
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 980 -360 0 0 {name=R19
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} 980 -280 0 0 {name=R20
W=2e-6
L=20e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {bus_tap.sym} 970 -170 0 0 {name=l8 lab=[5]}
