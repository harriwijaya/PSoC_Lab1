#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/harri001/Lab20150323/poly_proj/solution_poly/.autopilot/db/a.g.bc ${1+"$@"}
