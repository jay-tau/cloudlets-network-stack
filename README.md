AODV ++

1. The AODV Codebase:

- `aodv.cc` and `aodv.h` are the main implementation and header files for the AODV protocol.
  - `aodv_packet.h` defines the packet structure for AODV.
  - `aodv_rqueue.cc`, `aodv_rqueue.h` handle the AODV request queue.
  - `aodv_rtable.cc`, `aodv_rtable.h` deal with the AODV routing table.
  - `aodv_logs.cc` manages logs for AODV events.

2. Initialize Node Parameters:

   - Start by adding node-specific parameters (like task affinities, ID, bandwidth availability, storage space, and CPU availability) in the `aodv.cc` and `aodv.h` files. This will ensure every node in our simulation has these attributes.

3. Modify Packet Structure:

   - Since our protocol requires nodes to broadcast specific information (e.g., task affinities, ID, bandwidth, storage status), we'll likely need to modify or extend the current packet structure in `aodv_packet.h` to include these fields. This will change the Control Overhead Ratio and probably the latency too.

4. Implement Neighbor Discovery Mechanism:

   - Modify the broadcasting mechanism in `aodv.cc` to include the new node parameters we've added.
   - Add logic for nodes to wait a random amount of time before broadcasting their info. This might involve changes to the broadcasting functions in `aodv.cc` and possibly introducing some timers.
   - Implement the neighbor cache mechanism.

5. Modify Routing Mechanism:

   - The AODV protocol primarily deals with route discovery and maintenance. Depending on how similar or different our protocol's routing mechanism is from AODV, we may need significant modifications in the `aodv.cc`, `aodv_rqueue.cc`, and `aodv_rtable.cc` files.
   - Implement logic for task/data offloading based on our described criteria.

6. MAC Layer Changes:

   - This might be the trickiest part, especially if we're switching from CSMA to TDMA. we'll need to look beyond the AODV files and delve into the MAC layer implementation of NS2. However, if we're planning to implement this at the AODV level (which might not be the cleanest way but could be feasible for a proof of concept), then we'll embed the logic within the AODV files.
   - Implement TDMA mechanism, slot reservations, bus guardians, etc.

7. Debugging & Testing:
   - As we make modifications, frequently compile and test to ensure everything is working as expected. Use the logging mechanisms (possibly in `aodv_logs.cc`) to debug any issues.
   - Implement unit tests for each of our features to ensure they behave as expected.

QUESTIONS TO ASK

Do we require a separate node.cc class to define the parameters of a node?
