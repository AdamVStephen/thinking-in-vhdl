
# My First Core

Well - actually, my first look at one of Pavel Demin's cores (or IP blocks.).

From the led blinker project which instantiates a port_slicer, we know that there must besome VHDL code
in the project which performs this operation.  Indeed the cores/port_slicer_v1_0 directory contains
two source files.

```
core_config.tcl
- This defines how the block should be rendered in the GUI.
- And which parameters can be configured from the GUI.
- Three parameters are exposed : the width of the input port, the index of the highest and lowest bits.
- Implicitly, the behaviour is to extract and propagate the slice.
port_slincer.v
- Declares a timescale 1ns/1ps (syntax meaning what?)
- Creates a named module
- Declares the three parameters with default values (by default slices all of a 32 bit port)
- Defines input and output wires to be named din/dout
- assigns dout as the indexed set of bits from din
```
