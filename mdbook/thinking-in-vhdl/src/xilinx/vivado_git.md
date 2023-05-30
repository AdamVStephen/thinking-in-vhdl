# Vivado and Git

The driving philosophy of the Vivado tool suite is *that which can be automated, shall be automated*. This is underpinned
by the Tcl control scripts which can be used to run headless processes which don't need the UI elements.

The Vivado tool chain has a lot of steps from design to bitstream (and other binary artficacts such as MCS files).  This obscures
the relationship between project files in the working directory, and which need to be version controlled, which should be
regenerated.

This note brings together some of the best advice, definitions and tips that I have collated in my initial Vivado journey.
Caveat : I am a beginner, so a professional hardware engineer may have a different view.

The notes below are written with respect to Vivado 2020.2.

TODO: check if anything is new in Vivado 2022, 2023.

## Vivado Documentation

Bucking the engineering standard position, using the Vivado built-in help lists XAPP1165 `Using Vivado Design Suite with Version Control Systems`.
A PDF and set of design files is available (albeit via the robustly defended AMD/Xilinx license agreement walls.).

TODO: note for IP management, this is actually very good practice.

Without compromising the confidentiality of the details, the strategy recommended offers three sample workflows.

1. IP management under version control
 - IP can include files with extensions
   - .coe
   - .vho
   - .xci
   - .xml
 - A Tcl script is used to scan IP files and create a batch/shell script which will run git commands to check them in to a repository.
2. Project that is not using Vivaod project flow
 - Files include a top level `non-projecA` tcl script, `src` and `sim` directories with HDL code (.v, .vhd) and constraints (.xdc) files
3. Project that uses project flow
 - This augments the non-project files with `.wcfg` (waveform config?) definitions in `debug`, `sim` and `scripts` levels.  
 It also includes a top level project Tcl script as well as s tcl script to manage the git commands.

 The recommended `cli` for this approach is to use the Tcl control scripts with the `vivado -mode batch` prefix.

### Vivado Input Files

The 2021 [Vivado input files](https://docs.xilinx.com/r/2021.2-English/ug893-vivado-ide/Input-Files) lists the types of IDE input files.
These are grouped as follows

1. Design source files (vhdl, verilog, verilog header, system verilog)
2. I/O port lists (can be imported from CSV in I/O planning projects)
3. Module level netlists and cores (edif, ngc, ngo)
4. Top level netlists (edif, ngc)
5. Xilinx IP and IP integrator block designs (xci, xcix, bd)
6. Constraint files (sdc (synopsys design constraints), xdc (Xilinx design constraints))
7. Other 
 - BMM = Block RAM Memory Map
 - ELF = Executable and Linkable Format
 - MIF = memory contents of a core/cell/simulation mode
 - COE = initial memory and coefficient contents for core generation

### Vivado Project Files

These can be generated from Vivado with the `write_project_tcl` command and invoked with 

```
vivado -source script/project.tcl -notrace
```

The sequence of actions runs through

1. Creating the project
2. Setting the project paths and properties (the board type for example)
3. Provisioning a created sources directory with the IP and HDL design files (assumed to have local copies in the repo)
4. Mapping the file roles into the Vivado properties (which is the top level design file, which files are designs, constraints etc.)
5. Driving a first titeration of synthesis, implementation 

### Vivado Non Project Files

The non-project flow script has some additional features compared to the project flow version.
Although written (or at least last edited by) the same author (shout out to Jim Wu from Xilinx)
  it has a radically different style and is much more a programmer's utility. 
  It has a nicely organised way of parsing a list of project files, and automatically
  detecting the type using the suffix.
  It then uses internal vivado commands to sequentially read the sources, design constraints, IP files
  and then run the design and implementation commands at a lower level.


Both are interesting to study further and apply to the Spartan7 project below.


## Example Project : Spartan7 QMtech Demos

We take as a goal the question of how to optimally distribute variations on the theme of the set of demonstration
projects provided by the QMtech company which exercise their Spartan7 XC7S15 board.

Four projects are provided on the [QMtech github](TODO) repository which are provided as zip files.   We look first
at which files the QMtech devs decided to share.

### QMTech Zip SBOM : Project 01 LED blinker.

The LED project as shipped consists of a set of [80 files in 6 directories](./led_01_tree_full.md).

In comparison with the Vivado project version control description above, some of these appear to be snapshots
from a working filesystem.  There is also a top level project file (.xpr)

So : does Vivado include a "make clean" option?  And what other options do we have for sharing a project.

1. `File > Project > Write Tcl` brings up a write project to Tcl dialogue with options to include properties, sources, object values 
and also a choice to recreate block designs using tcl.  **The file contains absolute paths to the original sources, and
does not make copies**
1. `File > Project > Archive` brings up a dialogue to create a zip file with all the sources, settings and other files.
1. `reset_project` command in the Tcl resets the project to starting condition

Experimenting with these options, we observe the following.

1. 
1.
1. `reset_project` cleans out 73 of the 80 files leaving the sources, constraints, project file, one lpr file, the hardware xml
file, one prm file and one mcs file.  Running the "Generate bitstream" target via the IDE


### Project Non Flow Example

Taking the `project` non flow example from the design note 1555 and applying it to the LED demo, needed the following steps.

1. Create a `files_list.txt` using `find . -name "*.v" -o -name "*.xdc"`
2. Populate a directory with a copy of the files given the same relative paths.
3. Extract the correct part number from the project (e.g. via the Write Tcl script)
4. Identify which of the design sources is the top level (led_top)
5. Work out the correct invocatio, in this case :

```
vivado -mode batch \
         -source ./vivado_non_project.tcl \
         -notrace \
         -tclargs -cmd run \
         -ifn ./file_list_led.txt \
         -top led_top \
         -part xc7s15ftgb196-1
```

The commands invoked by the `vivado_non_project.tcl` script created the bitstream directly, with no GUI launch.
*Note no xpr project file needed*.  The build from the command line took 0m54 and so was faster.

The files going with this demonstration are in the `examples` part of the accompanying book repository
at `examples/vivado/project_vcs/non_project_demo`.

To apply the instruction which creates a batch file of git instructions, 

   ```
   vivado -mode batch \
         -source ./vivado_non_project.tcl \
         -notrace \
         -tclargs -cmd vcs \
         -ifn ./file_list_led.txt \
         -top led_top \
         -part xc7s15ftgb196 \
         -out git.sh
   ```
To clean out the directory using git, `git clean -f -x`

For convenience, these commands are latched in a `Makefile`  with targets `clean`, `all` and `git.sh`.




