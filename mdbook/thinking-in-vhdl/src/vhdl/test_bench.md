# Test Bench

Graham Naylor's RedPitaya SDR example introduces a simple custom IP core and the associated test bench
for a core that generates an edge.  The remainder of the radio work-up focusses on block level design
and data flow for the demodulator and associated other features.

What is not shown in this introduction is how to take the jump from a simple IP core with a testbench, to a 
higher level block design in need of a test bench.  Google shows that this is a common question.  One
handy reference cited by a helpfulXilinx bod is to [the ultimate guide to fpga test benches](https://hardwarebee.com/the-ultimate-guide-to-fp-ga-test-benches)

## Basic Vivado Testbench Example

[Vincent Claes](https://www.youtube.com/watch?v=7aVCG7MBYaA) offers a bsic introduction to writing a test bench (though mute the audio).
The format is a 10 minute screencast as the demo goes through the process of using Vivado 2020.1 to implement a 3-to-8 decoder test bench.

To reproduce this, I start with Vivado 2020.1 running on [ukaea-fpga](../resources/ukaea-fpga-dev-workstation.md../resources/ukaea-fpga-dev-workstation.md).

