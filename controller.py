import os
import sys

nodes = range(8, 25 + 1)
pktsizes = (512, 1024, 2048, 4096)

try:
    os.remove("del_ratio.txt")
except FileNotFoundError:
    pass

for num_nodes in nodes:
    for pktsize in pktsizes:
        os.system("./controller.sh 8 512")
        sys.exit(0)
    # with open("del_ratio.txt", "a") as f:
    #     f.write("\n")


# pktsize in cbrgen.tcl from 512 to 4096
