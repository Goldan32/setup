#!/usr/bin/env /usr/bin/python3

from os import path as op
import sh

root_dir = op.dirname(op.abspath(__file__))

asd = map(lambda x: x.strip(), sh.ls("-1", f"{root_dir}"))

def selectDirs(x):
    if op.isdir(op.join(root_dir, x.strip())):
        return True
    return False

items = filter(selectDirs, asd)

for i, item in enumerate(items):
    print(f"{i}: {item}")

