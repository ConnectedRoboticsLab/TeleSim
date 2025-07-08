Overview：
TeleSim is a comprehensive hardware-in-the-loop testbed and benchmark dataset designed to evaluate telerobotic system performance under varying network conditions. This repository contains the simulation framework and benchmark dataset for network-aware teleoperation research.<br>

Repository Structure：<br>
TeleSim/<br>
├── README.md                 # This file <br>
├── dataset/<br>
│   └── TeleSim_Dataset.csv  # Main dataset (300 trials)<br>
└── sim/                     # OMNeT++ simulation files<br>
    ├── telesim.ini          # Simulation configuration<br>
    ├── TeleSimNetwork.ned   # Network topology definition<br>
    ├── setup.sh             # Network interface setup script<br>
    └── run.sh               # Experiment execution script<br>

Software used:<br>
Ubuntu 20.04<br>
OMNeT++ 6.1 <br>
INET Framework 4.5 <br>
VLC Media Player 3.0.9.2 Vetinari<br>
Wireshark 3.2.3<br>
MSU VQMT Free 14.1<br>


Hardware used:<br>
RGB-D Camera: Intel RealSense D435i<br>
VR Headset: HTC VIVE Focus 3<br>
Robot Arm: Ufactory Lite 6<br>
Workstation: Intel i9-14900HX / 32 GB RAM / NVIDIA RTX 4060<br>

Access our paper:
https://arxiv.org/abs/2507.04425 
