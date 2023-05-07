# Keeping Up

The pace of change in FPGA space is extremely agressive, and changing the tool chain regularly can be necessary.

##Advantages

The tools are evolving very fast, and so moving to the latest version means

1. Benefits of new techniques and optimisations.
1. Support for additional cores and applications.
1. ML application support (subject to device)
1. Bug fixes for earlier issues and faults.
1. Better performance and faster compile cycles.

## Disadvantages

1. No guaranteed backwards compatibility.  Not per se, but due to other issues as below.
1. Designs for old toolchains may have workarounds for bugs, and reference deprecated features.
1.1 Corollary : old projects may fail to build with new toolchains.
1. New toolchains may have improved workflows and expectations
1.1. Corollary : old project instructions may be outdated, old projects may lack new required artifacts.
1. FPGA projects are not just the VHDL code and core; the embedded linux (default and setup) and other artifacts may cause project problems.
