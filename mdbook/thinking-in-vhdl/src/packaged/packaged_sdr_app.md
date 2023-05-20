# SDR Application

Software defined radio has been a popular development topic for both hobbyists and professionals.
High speed DSP processing is necessary to mix and extract signal information with carrier frequencies.
The RedPitaya 125 MSPS ADC is adequate to attempt extraction and processing of Radio Frequency 
signals up to around 60MHz.

## Hardware Blocks

The [detailed description](http://pavel-demin.github.io/red-pitaya-notes/sdr-receiver-hpsdr/)
can be summarised roughly as a chain of filter and downsampling blocks which yield a final output
stram of 24bit data at 48-192ksps.  This is sent to a FIFO from where the CPU can extract the data,
with a pair of config and status registers allowing the CPU to control the hardware circuitry.

At 48ksps, 24 bit data, the full data rate readout is 144kB/s or approximately 1Mbps of raw data
when sent out of the RedPitaya over an ethernet link.

## Software Applications

### GNU Radio

### Windows SDK


### Data Extraction Protocol


