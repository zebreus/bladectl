# bullx-power-script
A hacky script to control the bullx blade system b520 from the commandline

## Usage
To power on blade 1 and 18 in the blade system at 192.168.134.56
```bash
bladectl --host 192.168.134.56 --on 1 --on 18
```
To completly power off blade 1 and 18
```bash
bladectl --host 192.168.134.56 --sleep 1 --sleep 18
```

For more information just see the help at ```bladectl --help```

## Setting a default host

If you are using the script with just one blade system, it may be a good idea to set correct ip address as a default value. To do that change the following line in bladectl.argbash
```
# ARG_OPTIONAL_SINGLE([host], , [The host ip address of the chassis hardware console], [])
```
to
```
# ARG_OPTIONAL_SINGLE([host], , [The host ip address of the chassis hardware console], [YOURIPADDRESS])
```
and run make.
