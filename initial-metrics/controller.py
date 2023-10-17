import os

nodes = [x for x in range(8, 26)]
# nodes = [24]
pktsizes = [512, 1024, 2048, 4096, 8192, 16384]

# Create an empty "del_ratio.txt" file
with open("del_ratio.txt", "w") as del_ratio_file:
    pass

for pktsize in pktsizes:
    for num_nodes in nodes:
        os.system(f"./controller.sh {num_nodes} {pktsize}")


# pktsize in cbrgen.tcl from 512 to 4096
