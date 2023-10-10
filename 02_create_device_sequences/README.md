# Create sequences per IoT device and store as CSV

Extract traffic features from raw packets.

- Input: raw packet data in CSV format
- Output: packet sequences per device in CSV format. For each packet, we extract the following features:
  - Packet size
  - Time since last packet
  - Direction (in/out)
  - Protocol (transport layer - UDP/TCP)
  - Source port (-1 if random, 1 if 1...1024)
  - Destination port (-1 if random, 1 if 1...1024)
  - Source IP address (internal/external)
  - Destination IP address (internal/external)

## How to generate sequences

Run the jupyter notebook `from_csv_to_sequence.ipynb`. In particular, the function `create_features_from_csv()` generates the sequences.