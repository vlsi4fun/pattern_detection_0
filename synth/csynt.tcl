yosys -import
read_liberty -lib Nangate45_typ.lib
read_verilog ../rtl/pattern_detection.v
hierarchy -check -top pattern_detection
procs
opt
fsm
opt
show
break
memory
opt
techmap
opt
dfflibmap -liberty Nangate45_typ.lib
opt
abc -liberty Nangate45_typ.lib
flatten
clean -purge
write_verilog -noattr synth.v
show
