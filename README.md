# FPGASumGame
This is a verilog project that develops a sum game in which the user generated a hexadecimal pseudo-random number and then uses the swtiches on the board to find another hexadecimal number that if summed to the pseudo-random number, they will achieve a result of 15.
<img width="812" height="562" alt="image" src="https://github.com/user-attachments/assets/4ab7c383-2399-41bf-bd60-9455c4b06caa" />


## Overview
FPGA Sum Game is a game of knowledge on binary and hexadecimal numbers. During the gameplay, the user will generate a pseudo-random number whose value obtained depends on the interval the Random -Number Generator button is pushed. Then the user will find a hexadecimal number to sum to that pseudo-random number trying to find a sum of 15. to obtain the hexadecimal number, the user. combines the switched on the board to find the binary equivalent to that number, in which, a switch on indicates a high digit while an off switch indicates a low digit. If the sum of 15 is obtained the user gains a point to their score. They can play withing a time limit of 99 seconds each match. The system also includes multi-user authentication, score tracking, selectable difficulty levels, and timer-controlled gameplay.

## Key Features

- Single-user authentication using ID.
- Pseudo-random generation.
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

- [User Manual](userManual_Lab3_DEOLIVEIRAVENANCIO_Victor.pdf)
- [Design Document](designDoc_Lab3_DEOLIVEIRAVENANCIO_Victor.pdf)

## Videos

- [Demonstration](https://drive.google.com/file/d/1HiRbVAlXNJ48m4y17WinU6Nvm92eGyte/view?usp=sharing)
