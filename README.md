# bullx-power-script

Control the bullx blade system b520 from the commandline

## Installation

You can run this script with nix:

```bash
nix run github:zebreus/bladectl

nix run github:zebreus/bladectl -- --help
```

Alternativley you can use argbash to create a normal shell script and install the dependencies (curl, sed and grep) manually.

## Usage

To power on blade 1 and 18 in a blade system at 192.168.134.56

```bash
bladectl --host 192.168.134.56 --on 1 --on 18
```

To completly power off blade 1 and 18

```bash
bladectl --host 192.168.134.56 --sleep 1 --sleep 18
```

For more information just see the help at `bladectl --help`

## Setting a default host

If you are using the script with just one blade system, it may be a good idea to set correct ip address as a default value. To do that you can set the environment variable `BLADECTL_HOST` to the ip address of your blade system.
