# Claes Testbench Example

Some notes on following the YouTube 10 minute walkthrough of a 3-to-8 decoder testbench in Vivado 2020.1.
The screencast proceeds nicely at pace, which is good, but if you want to catch individual steps and are
new to Vivado, I transcribe the main points in the instructions below. Alternatively, reduce the youtube
playback speed.

## Instructions

- Source settings.sh for the version of Vivado (2020.1)
- Run vivado (these instructions based on ubuntu 18.04 system)
- Create new project
-- Claes used a Xilinx pynq-z2 reference board, not available on my system, I used a zedboard
-- RTL project providing sources later checkbox ticked
-- Project Manager > Add Sources > Add or create **design** sources
-- Create file of type VHDL named Decoder_3_to_8 local to project
-- Accept the `Define Module` wizard defaults (name same, behavioural architecture, no I/O ports added)
-- Open the VHDL source thus created and make the following changes.
-- Uncomment the `use IEEE.NUMERIC_STD.ALL` to enable use of arithmetic with signed or unsigned values.
-- Add two ports named D_IN and F_OUT both are std_logic_vector, the first of size three, the second size eight.
-- Implement the behavioural architecture which is a with/select block that lists a lookup table of FOUT given D_IN
-- The lookup table values provides definitions for all of the 8 possible 3 bit values 0 through 7 where the output
sets the N'th bit in the 8 bit word (this implements raising 2 to the power of the digital input).
-- The lookup table also defines a catch all for `others` even though all bit patterns are defined.  I presume this is
because we have to allow for a signal in hardware to be undefined.
-- Project Manager > Add Sources > Add or create **simulation** sources
-- Add a new file `Decoder_3_to_8_db` and accept the defaults
-- Edit the newly created and templated tb file in the simulation sources.
-- Comment fields changed and the IEEE numeric library is pulled in.
-- Within the *architecture* section of the testbench we instantiate a component of type Decoder_3_to_8
-- Also declare a time constant (10ns), testbed in/out signals of matching types to the port (3 bit, 8 bit)
-- Within the behavioural begin/end section
--- Instantiate a dut (design under test) block which maps the testbed signals to the DUT port
--- Instantiate a process (named simulation)
--- Assert pattern zero  aka `000` on the D_IN_tb signal and wait for the time constant
--- Assert pattern 1 aka `001` on the D_IN_tb signal and wait fo rthe time constant.
--- Add a pattern assignment for all of the possible input values

## Commentary on Workflow

The following observations are from the point of someone very new to Vivado.

1. Add Sources wizard distinguishes 3 cases to add/create : constraints; design sources; simulation sources.
1.1 To understand : the difference between all three.
1. Add Source wizard creates a `Decoder_3_to_8.vhd` file in `sources_1/new/` with a default template.
1.1 Template has comments, library, entity definition, architecture definition block
1. Behavioural block implementation of a case type statement defining a LUT
1.1 Remember to count from 0.  So a std_logic_vector(7 downto 0) is an 8 bit entity.
1. The design source file gets added to the simulation sources folder (possibly as a symlink?)

## Commentary on Testbench Methodology

There is a common mode failure at play here.

The decoder logic is encapsulated in the correctness of the lookup table, the relationship 
between input patterns and output patterns, and the completeness of the table.
The test code merely repeats the same assumptions in the first example, and indeed,
    this is a minimal example of how to define stimulus and allow visual check of the behaviour.

    The improved implementation 

## Commentary on Vivado

The collection of tools is neatly stitched together via the parallel options of UI actions (e.g. `Run Simulation` button) and the equivalent
tcl commands which execute in the Tcl Console.  Simulation runs for example the following command as part of the workflow

```
xvhdl --incr --relax -prj Decoder_3_to_8_tb_vhdl.prj
```

Remember to spell some things in USA english (Behavioral).

### Version Control and Project Portability

Best practice which is recommended is to export a top level tcl script which can regenerate everything.  Koheron makes good use of this.

http://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html recommends

1. Vivado
1.1 ip_repo
1.1 src
1.1.1 bd
1.1.1.1 design_1.tcl
1.1.1 hdl
1.1 build.tcl
1.1 build.bat

To get at the top level template script, use `File > Write Project Tcl` (2014 speak) which in 2020.1 money is `File > Project > Write Tcl`.

Beware Google results since you can find comments, application notes and solutions from 2013 and further back, and not all
information remains relevant to all projects/environments.  Here are a few principles and links which seem current.

1. Useful files and extensions to be familiar with are
1.1 \*.vhd files : the VHDL sources for components and test benches
1.1 \*.xdc files (TBA)
1.1 \*.xpr project files
1.1 \*.srcs/ project sources
1.1 \*.tcl scripts that can include scripts to fully regenerate a project

Files which can generally be ignored or regenerated

1. cache/
1. runs/
1.sim/
1. .hw/
1 .ip_user_files/
1 .jou
1. .log
1. .str

### SIMULATION

Running the simulation stage gives errors via two output streams : one is the explicit `Messages` tab, and the second is the `Tcl Console`.


## Commentary on VHDL

1. entity/Port : unexpectedly, the first port terminates in semi-colon, but the last does not.

## References

- https://youtube.com/watch?v=7aVCG7MBYaA
= https://stackoverflow.com/questions/57398637/what-files-to-check-into-git-in-a-vivado-project-file
- http://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html (well written article, but nearly a decade old)

## TODO

1. How to link to sections within MD ?
1. Can vim C-x, C-a do binary arithmetic ?
1. How to get vim keybindings within Vivado editors (or use editors outside of vivado)

