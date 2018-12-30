import dsstore
import os
import sys

if __name__ == "__main__":
    d = dsstore.DS_Store(sys.stdin.read(), debug=False)
    files = d.traverse_root()
    print("Count: ", len(files))
    for f in files:
        print(f)

