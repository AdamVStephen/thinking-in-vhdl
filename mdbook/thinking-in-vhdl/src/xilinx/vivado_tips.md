# Vivado Tips

More out of order vivado tips noted as I work through some initial projects.

## Performance

Windows, Dell laptop with (L1254) on the most minimal LED blinker project possible.
To run the basic synthesis and implementation for a very small Spartan 7 part 
from `reset-project` state to bitstram generated took 2m34.

Unix, AMD monster on exactly the same project took 1m08. Twice as fast, but using
16 jobs in parallel.  Still a hefty compile time compared to C.  But a lot going
on under the hood.


## Windows Batch Mode

On a system where powershell scripts are prevented by policy, the following tweak works.

Create `vivado.bat` on the desktop with the following command

```
vivado -mode batch -source ./vivado_non_project.tcl -notrace -tclargs -cmd run -ifn ./file_list_led.txt -top led_top -part xc7s15ftgb196-1
```

Execute the batch file by double clicking on it.  The cmd.exe invocation reads the batch files provided with the Xilinx
install and with that environment set, drops into powershell.  This can be used to then run things like the 
non project flow script that builds the Spartan S7 LED example
.
