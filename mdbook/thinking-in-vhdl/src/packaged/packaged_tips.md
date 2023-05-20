# Using Packaged System : Tips

The packaged zip file makes working with the application similarly easy to the general RedPitaya approach.

## DHCP Networking

All RedPitaya NIC MAC addresses begin with the same triplet "00:26:32" which is [registered by](https://macaddress.webwat.ch/hwaddr/00:26:32) Instrumentation Technologies D.d, Slovenia.
This is the RedPitaya parent company. The Alpine linux distro has been nicely configured so that the DHCP interaction requests to associate the local host name
`rp-######.local` with whatever IP address is allocated by the LAN DHCP server where `######` are the suffix triple of the mac address.  i.e.

```
If the output of ifconfig on the system shows
HWaddr 00:26:32:F0:96:FB
then the hostname will be defined as
rp-F096FB.local
```

## Web Interface

The packaged system provides bash scripts which start and stop the PL applications by reloading different
firmware via the `/dev/xdevcfg` device.  A simple HTTP server provides a convenient UI to exposing the
available scripts and triggering them via a development browser rather than through a ssh connection.

The server is implemented in only 123 lines of C and so has minimal functionality, but it suffices.
The source code is in /media/mmcblk0p1/apps/server.  It runs on port 80.  It is a very nice example
program for C/Linux beginners.  If it finds a path to `apps/start.sh` then it does a fork/exec to 
run the shell script.

The available apps are defined by the RedPitaya configuration and the server maps some memory returned
by a sysconf call to introspect on some kind of register/ID information.  This is used to return
either `index.html` or `index_122_88.html` where the latter is for a RedPitaya board that has a sample
rate of 122.88MS/s and the former for the 125MS/s version.

## Apps

The following apps are provided with the shell script initialisation support on the 125 MS/s board:

1. LED Blinker
2. SDR transceiver
3. SDR transciever compatible with HPSDR (High Performance Software Defined Radio)
4. SDR receiver compatible with HPSDR (High Performance Software Defined Radio)
5. Embedded SDR transceiver
6. Wideband SDR transceiver.
7. Multiband WSPR transceiver
8. Multiband FT8 transceiver
9. Pulsed NMR system
10. Multichannel pulse height analyzer
11. Vector Network Analyyzer.

## SDR Projects (tr)

Some SDR terminology is useful to be able to navigate through the demos.

1. Software Defined Radio
1. High Performance Software Defined Radio
1. Transceiver = Combined device that transmits and receives
1. WSPR (pronounced whisper) is a Weak Signal Propagation reporter : protocol for probing propagation paths
1. FT8 (Franke & Taylor 8) : a frequency shift keying technique : 77 bits send in 15 second cycles of 12.64s TX, 2.36s decode time.  A form useful for very weak signals.





