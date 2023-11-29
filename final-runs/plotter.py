import matplotlib.pyplot as plt

# Read the data from the text file
with open("del_ratio.txt", "r") as file:
    lines = file.read().splitlines()

# Split the data into groups of 4 values
data_groups = [lines[i : i + 18] for i in range(0, len(lines), 18)]

# Define the x-axis values for each group
x_values = list(range(8, 26))
legends = [512, 1024, 2048, 4096, 8192, 16384]

# Create a plot for each group of data
for i, data_group in enumerate(data_groups):
    # legend_label = f"Legend {i + 1}"
    legend_label = f"Packet Size = {legends[i]}"
    y_values = [float(value) for value in data_group]
    plt.plot(x_values, y_values, label=legend_label)

# Set plot labels and title
plt.xlabel("Number of Nodes")
plt.ylabel("Packet Delivery Ratio")
plt.title("Packet Delivery Ratio vs Number of Nodes")

# Set the y-axis range from 0 to 100
plt.ylim(0, 100)

# Add a legend
plt.legend()

# Display the plot
plt.show()