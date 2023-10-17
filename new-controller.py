import os
import sys
import subprocess

nodes = range(8, 25 + 1)
pktsizes = (512, 1024, 2048, 4096)

# try:
#     os.remove("del_ratio.txt")
# except FileNotFoundError:
#     pass
for x in range(4, 100) :
    os.system(f"./controller.sh {x} ")

# subprocess.run("./new-controller.sh 8")

# for num_nodes in nodes:
#     for pktsize in pktsizes:
#         os.system("./new-controller.sh 8")
#         sys.exit(0)
    # with open("del_ratio.txt", "a") as f:
    #     f.write("\n")


# pktsize in cbrgen.tcl from 512 to 4096
