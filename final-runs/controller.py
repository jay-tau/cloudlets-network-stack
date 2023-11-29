import os

nodes = [10, 20, 30, 40, 50]
pktsizes = [512, 1024, 2048, 4096]
ifq = [20, 30, 40, 50]

# Create an empty "del_ratio.txt" file
with open("del_ratio.txt", "w") as del_ratio_file:
    pass

for pktsize in pktsizes:
    for num_nodes in nodes:
        for ifq_length in ifq:
            os.system(f"./controller.sh {num_nodes} {pktsize} {ifq_length}")
