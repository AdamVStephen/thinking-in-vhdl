TODO


1) Create lower clocks : via shift registers, via circuitry, via a clock wizard.

2) Create multiple instances of the design with different clocking and duty cycles.

3) Use the design as the basis for a morse code output....

4) How to switch between different instances (if else....)

  - based on time (sequence of 0.1, 1, 10, 100)
  - based on a smoother modulated (multiply by sin something)
  - chirp combination
  - based on user input via button
  - based on user input via GPIO
  - based on user input via light dependent resistor and ADC
  - based on user input via PWM signal from another board or PI GPIO....
  - based on user input via I2C
  - based on user input via SPI
  - based on user input via RS232 serial
  - based on user input via JTAG ?


  5) Use ofJTAG and virtual JTAG as opposed to putting cnt in the output port


  6) use of cnt with additional port IO defined in the XDC.

7) Minimal USB interfaces via GPIO - host/device mode ??
