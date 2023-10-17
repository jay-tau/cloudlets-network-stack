import csv

# Read the wireless.tr file
with open("temp.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    with open("wireless.tr", "r") as f:
        for line in f:
            print(line.split())
            writer.writerow(line.split())
            # break
