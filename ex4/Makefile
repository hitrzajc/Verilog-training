# Makefile for SystemVerilog simulation with Icarus Verilog
#
# Usage:
#   make            - compile and run the simulation
#   make compile    - only compile (produce simv)
#   make run        - only run the compiled simulation
#   make wave       - open waveform in GTKWave
#   make clean      - remove generated files
#
# Files:
#   ex1.v      - design under test (SystemVerilog)
#   tb_ex1.sv  - testbench

# ---- Tool configuration ----
IVERILOG   := iverilog
VVP        := vvp
GTKWAVE    := gtkwave

# -g2012 enables SystemVerilog (IEEE 1800-2012) support in Icarus
IVFLAGS    := -g2012 -Wall

# ---- Project files ----
# TOP        := tb_multiplexer
SRC        := comparator.sv
TB         := tb_comparator.sv
SIMV       := simv.out
VCD        := wave.vcd

# ---- Default target: compile and run ----
all: run

# ---- Compile design + testbench ----
compile: $(SIMV)

$(SIMV): $(SRC) $(TB)
	$(IVERILOG) $(IVFLAGS) -o $(SIMV) $(SRC) $(TB)

# ---- Run simulation ----
run: $(SIMV)
	$(VVP) $(SIMV)

# ---- Open waveform ----
wave: run
	$(GTKWAVE) $(VCD) &

# ---- Clean up ----
clean:
	rm -f $(SIMV) $(VCD)

.PHONY: all compile run wave clean