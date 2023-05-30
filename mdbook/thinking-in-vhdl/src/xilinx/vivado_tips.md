# Vivado Tips

More out of order vivado tips noted as I work through some initial projects.

## Performance

Windows, Dell laptop with (L1254) on the most minimal LED blinker project possible.
To run the basic synthesis and implementation for a very small Spartan 7 part 
from `reset-project` state to bitstram generated took 2m34.

Unix, AMD monster on exactly the same project took 1m08. Twice as fast, but using
16 jobs in parallel.  Still a hefty compile time compared to C.  But a lot going
on under the hood.
