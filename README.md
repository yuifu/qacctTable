# qacctTable.jl
A parser to convert output from `qacct` of the Open Grid Schduler into a markdown-friendly table formt. This parser is written in Julia.

Currently, only "hostname|jobnumber|jobname|ru_wallclock|maxvmem|taskid" are included in the output.

# Usage

```
qacct -j 123456 | julia qacctTable.jl
```
