#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/harri001/Lab1_32bits/poly_proj/solution_poly/.autopilot/db/a.g.bc ${1+"$@"}
