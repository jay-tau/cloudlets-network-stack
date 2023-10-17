To approach the development of the network protocol stack for the distributed cloudlet architecture, it's important to break down the tasks into a logical order. Here is a suggested order of tasks:

1. **Understanding Requirements and Constraints:**

   - Begin by thoroughly understanding the requirements and constraints of the cloudlet architecture. Gather detailed information about node characteristics, scalability needs, real-time communication requirements, and network infrastructure constraints.

2. **Protocol Stack Whiteboarding:**

   - Design the overall structure of the network protocol stack. Consider how different layers will interact and address the specific needs of the cloudlet architecture.

3. **Neighbor Discovery Mechanism:**

   - Develop the mechanism for neighbor discovery, including how nodes will broadcast and respond to neighbor information. This is crucial for building the initial network topology.

4. **Initialization and Node Information Broadcast:**

   - Implement the initialization process where nodes broadcast their essential information, including task affinities, IDs, available resources (bandwidth, storage, CPU), and any other relevant details.

5. **Communication Protocol:**

   - Develop the communication protocol that nodes will use to exchange data and tasks. Ensure that it prioritizes nodes based on task affinity, data load, and CPU utilization while considering available network bandwidth.

6. **MAC Protocol Implementation:**

   - Implement the MAC (Medium Access Control) protocol, initially using pure CSMA during network setup and later transitioning to a TDMA-based protocol after neighbor discovery. Define communication cycles, time slots, and rules for static and dynamic slots.

7. **Dynamic Time Slot Handling:**

   - Implement the handling of dynamic time slots for non-real-time communication, allowing nodes to reserve these slots as needed while considering their smaller size compared to static slots.

8. **Security and Reliability Measures:**

   - Introduce security measures, including bus guardians with high communication range for monitoring and error detection. Implement timing and control mechanisms. Consider utilizing the Precision Time Protocol for time synchronization.

9. **Wireless Communication Setup:**

   - Set up wireless communication using the ISM band with 2.4 GHz transceivers on each SOC. Ensure that communication is reliable and efficient.

10. **Testing and Optimization:**

    - Rigorously test the network protocol stack in various scenarios, including different network sizes and configurations. Optimize the stack for performance, scalability, and real-time guarantees.

11. **Documentation and Reporting:**

    - Create comprehensive documentation that includes the network protocol stack's design, implementation details, and guidelines for deployment. Prepare reports and findings from testing and optimization.

12. **Scalability and Future Considerations:**

    - Ensure that the network protocol stack can scale seamlessly as the cloudlet architecture grows. Consider future enhancements and improvements.

13. **Deployment and Monitoring:**
    - Deploy the network protocol stack in the cloudlet architecture. Continuously monitor its performance and make adjustments as necessary based on real-world usage.

By following this structured approach, you can incrementally build and refine the network protocol stack, ensuring that it meets the specific requirements and constraints of the distributed cloudlet architecture.

Sure, here's the text formatted in pretty Markdown:

# AODV++

## 1. The AODV Codebase:

- `aodv.cc` and `aodv.h` are the main implementation and header files for the AODV protocol.
  - `aodv_packet.h` defines the packet structure for AODV.
  - `aodv_rqueue.cc`, `aodv_rqueue.h` handle the AODV request queue.
  - `aodv_rtable.cc`, `aodv_rtable.h` deal with the AODV routing table.
  - `aodv_logs.cc` manages logs for AODV events.

## 2. Initialize Node Parameters:

Start by adding node-specific parameters (like task affinities, ID, bandwidth availability, storage space, and CPU availability) in the `aodv.cc` and `aodv.h` files. This will ensure every node in our simulation has these attributes.

## 3. Modify Packet Structure:

Since our protocol requires nodes to broadcast specific information (e.g., task affinities, ID, bandwidth, storage status), we'll likely need to modify or extend the current packet structure in `aodv_packet.h` to include these fields. This will change the Control Overhead Ratio and probably the latency too.

## 4. Implement Neighbor Discovery Mechanism:

- Modify the broadcasting mechanism in `aodv.cc` to include the new node parameters we've added.
- Add logic for nodes to wait a random amount of time before broadcasting their info. This might involve changes to the broadcasting functions in `aodv.cc` and possibly introducing some timers.
- Implement the neighbor cache mechanism.

## 5. Modify Routing Mechanism:

The AODV protocol primarily deals with route discovery and maintenance. Depending on how similar or different our protocol's routing mechanism is from AODV, we may need significant modifications in the `aodv.cc`, `aodv_rqueue.cc`, and `aodv_rtable.cc` files.
Implement logic for task/data offloading based on our described criteria.

## 6. MAC Layer Changes:

This might be the trickiest part, especially if we're switching from CSMA to TDMA. We'll need to look beyond the AODV files and delve into the MAC layer implementation of NS2. However, if we're planning to implement this at the AODV level (which might not be the cleanest way but could be feasible for a proof of concept), then we'll embed the logic within the AODV files.
Implement TDMA mechanism, slot reservations, bus guardians, etc.

## 7. Debugging & Testing:

As we make modifications, frequently compile and test to ensure everything is working as expected. Use the logging mechanisms (possibly in `aodv_logs.cc`) to debug any issues.
Implement unit tests for each of our features to ensure they behave as expected.

### QUESTIONS TO ASK

Do we require a separate `node.cc` class to define the parameters of a node?
