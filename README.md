# FPGASumGame
This is a verilog project that develops a sum game in which the user generated a hexadecimal pseudo-random number and then uses the swtiches on the board to find another hexadecimal number that if summed to the pseudo-random number, they will achieve a result of 15.
<img width="748" height="642" alt="image" src="https://github.com/user-attachments/assets/4126fd03-75d9-403f-80e8-e5935b60bdd3" />

## Overview
FPGA Sum Game is a game of knowledge on binary and hexadecimal numbers. During the gameplay, the user will generate a pseudo-random number whose value obtained depends on the interval the Random -Number Generator button is pushed. Then the user will find a hexadecimal number to sum to that pseudo-random number trying to find a sum of 15. to obtain the hexadecimal number, the user. combines the switched on the board to find the binary equivalent to that number, in which, a switch on indicates a high digit while an off switch indicates a low digit. If the sum of 15 is obtained the user gains a point to their score. They can play withing a time limit of 99 seconds each match. The system also includes multi-user authentication, score tracking, selectable difficulty levels, and timer-controlled gameplay.

## Key Features

- Single-user authentication using ID.
- Pseudo-random generation using an LFSR.
- Finite State Machine (FSM) controlling the game flow.
- Score tracking.
- Countdown timer for gameplay.
- Seven-segment display interface.

## Technologies

### Languages

- Verilog HDL

### Development Tools

- Intel Quartus Prime
- ModelSim

### Hardware

- Intel DE0-CV FPGA

## Documentation

- [User Manual](UserManual_ElectricBugaloo.pdf)
- [Design Document](DesignDocument_ElectricBugaloo.pdf)

## Videos

- [Presentation](https://1drv.ms/v/c/4b1bf38c88435a6d/IQA5hnCKV3zwQauoOj2K0x9YAZnLpe9W0z_-TdbJSuyopu4?e=JpbPya)
- [Demonstration](https://drive.google.com/file/d/1rsnwzx_ce7sVm7Y996I0xKETXAT0S2v1/view)
