# Laboratory of Innovative Software 2022 @ UniPI - Experimenting with Sancus

This is a short tutorial to set up a minimal Sancus platform to experiment with it.

## Needed packages

Install:
* cmake
* msp430-gcc
* msp430-elf-gcc
* iverilog
* gtkwave
* python3{,-pip}
* tk

On Ubuntu:
```bash
$ sudo apt-get install build-essential git binutils-msp430 gcc-msp430 msp430-libc msp430mcu iverilog gtkwave tk python3 python3-pip
```

To install `msp430-elf-gcc`:
```bash
$ wget https://distrinet.cs.kuleuven.be/software/sancus/downloads/ti-mspgcc-binutils-sancus_6.4.0.32-1_amd64.deb
$ sudo dpkg -i ti-mspgcc-binutils-sancus_6.4.0.32-1_amd64.deb
```

## Clone the Sancus repo

```bash
$ git clone https://github.com/sancus-tee/sancus-core.git
$ cd sancus-core
```

## Build the Sancus config and fixing errors
We don't need the fully-fledged Sancus toolchain, but we still need some basic config, i.e., we need the `config.v` file
in `core/rtl/verilog`.

```bash
$ cmake .
```

## Running an example

Simply run:
```bash
$ cd core/sim/rtl_sim/bin
$ ./msp430sim test-name
```
where `test-name` is the name of one of the tests in `core/sim/rtl_sim/src`.

## Running your own example

You can paste (and modify) the `.s43` and `.v` files you found in this package in `core/sim/rtl_sim/src` to make your
own tests. You can inspect the resulting file (`tb_openMSP430.vcd` in the current directory) using `gtkwave`
(interesting stuff to look at: all the wires starting with `inst_`, the registers (`r0`, ..., `r15`) and the clock
signal `mclk`).

## Solving some problems

1. On my machine the script `omsp430_config.sh` in the `core/sim/rtl_sim/bin` folder causes problems, which are solved
   by changing the first line to `#include "pmem.h"`  (tested also on a fresh Ubuntu 20.04LTS and there it works);
2. Something else?
