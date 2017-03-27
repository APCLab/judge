# judge

batch compile/judge for windows

## requirement

- `Visual Stduio 2015`

## compile

```batch
compile.bat [soucre directory] [distant directory] [log output directory]
```

- `soucre directory`: input soruce files (`*.c` or `*.cpp`)
- `distant directory`: execuable files output directory (`*.exe`)
- `log output directory`: *(optional)* compiling log files output directory (`*.txt`)

## feed test data

```batch
feed.bat [test data] [execuables] [output]
```

- `test data`: test data file
- `execuables`: directory of execuable files to be tested
- `output`: directory of output results
