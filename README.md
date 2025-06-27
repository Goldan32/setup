# Setting up a new computer

## Usage

```bash
git clone https://github.com/Goldan32/setup
cd setup
./main.sh all
## or
./main.sh <package_name>
```

This will install all the packeges defined.

## Expanding

Packages are subdirectories of the root of this repo.

A new package needs 3 things to work correctly:

- `install.sh`
  - Should `exit 0` and `log "Success (already done)"` when no actions need to be performed.
  - Should install the package and
    - `exit 0` and `log "Success"` if succeeded
    - `exit 1`, or some higher number and `log "Failed (reason)"`if failed
- `deps`
  - Is a plain text file
  - Lists other packages that should be installed before this one
- List this package in the `deps` of the `all` package

## How it works

`main.sh`

- Makes an implicit graph of the dependencies of the selected package
- Uses a BFS to traverse the graph
- Writes down each visited node (package) in a list
- Reverses the list
- Installs every package in order, skipping packeges that were already found
- Stops the installs when a package returns a failure exit code

This ensures that a package can only be installed once all of its dependencies are successfully installed.
