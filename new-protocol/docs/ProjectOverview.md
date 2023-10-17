## Problem Statement: Network Protocol Stack for Distributed Cloudlet Architecture

### Overview

We are tasked with designing a network protocol stack for a distributed cloudlet architecture. The cloudlet network consists of a medium-sized and sparsely distributed set of nodes, primarily based on Snapdragon 410c, 820c, or 833 System on Chips (SOCs). Each node in the cloudlet is connected to multiple end devices via common IoT communication protocols, while also maintaining connections to the cloud infrastructure through wired or wireless means. The goal is to create a lightweight network protocol stack that considers node characteristics such as task affinity, available bandwidth, storage space, and CPU availability. The protocol must support real-time communication and adapt to dynamic changes in the cloudlet architecture.

### Protocol Design Principles

- **Lightweight Approach**: Given the limited memory of the nodes, the network protocol stack must minimize memory usage to prioritize processing and storage capabilities.
- **Real-Time Communication**: Real-time communication with guaranteed latencies and delivery rates is essential, ruling out collision-based protocols like CSMA-CD or CSMA-CA.
- **Dynamic Cloudlet Architecture**: The protocol must accommodate the dynamic nature of cloudlet networks, where nodes can be added, shutdown, or removed as needed.
- **Cross-Layer Protocol Stack**: Instead of a traditional layered network stack, we opt for a cross-layer protocol stack to ensure lightweight design and real-time performance.
- **Node Identification**: Each cloudlet node will be assigned a unique ID based on its role in the system, and this ID will play a vital role in the network protocol design.
- **Node Capabilities**: Different SOC types, such as 410c for data gathering, 820c for machine learning, and 833 for computer vision, have varying capabilities that need to be considered.

### Network Size and Scalability

The cloudlet network may consist of as few as 20 nodes or as many as 50 nodes, making it one of the largest cloudlet systems to date. The network protocol stack should be designed to scale effectively regardless of the network's size.

### Network Protocol Stack Details

#### Initialization

- The node with the lowest ID initiates network initialization.
- It broadcasts information about task affinities, ID, available network bandwidth, data storage (lightly loaded, moderately loaded, heavily loaded), and CPU utilization (lightly loaded, moderately loaded, heavily loaded).
- Nodes that receive the broadcast make entries in a neighbor cache and wait for a random duration before broadcasting their information to neighbors.

#### Neighbor Discovery

- Nodes determine when to broadcast a neighbor discovery message if they haven't heard from neighbors for an extended period.
- Upon receiving a neighbor discovery message, nodes wait for a random delay based on factors like data load, CPU utilization, and task affinity before broadcasting their information.

#### Communication

- To offload data or tasks, a node selects a neighbor with the highest task affinity, lowest data load, and CPU utilization.
- Node priority is given to CPU utilization and task affinity when migrating tasks and to memory space when migrating data.
- Available network bandwidth influences the selection of a neighbor for communication.
- Initially, the MAC protocol is pure CSMA, but it transitions to a TDMA-based protocol after neighbor discovery.
- Communication is divided into cycles, each comprising static and dynamic time slots.
- Static time slots are allocated based on node IP addresses and neighbor relationships.
- Dynamic time slots, used for non-real-time communication, can be reserved at the end of static time slots.
- Dynamic time slots are smaller than static ones, and the ideal static-to-dynamic time slot ratio will be determined experimentally.
- If dynamic time slots become full, nodes may wait until the next communication cycle.
- Two bus guardians with high communication range ensure secure and reliable communication, monitoring and correcting data corruption or timing issues.
- Precision Time Protocol is employed for time synchronization between nodes, and two time slots are reserved for bus guardians at the start of each communication cycle.
- Communication between nodes and cloudlets primarily occurs wirelessly in the 2.4 GHz ISM band, necessitating transceivers on each SOC.

The proposed network protocol stack should effectively meet the requirements of the distributed cloudlet architecture, offering lightweight, real-time, and scalable communication capabilities while considering the diverse capabilities of different SOC types.
