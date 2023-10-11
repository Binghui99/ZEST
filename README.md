# ZEST_source_code

This is the source code of our paper: ZEST: A Zero-Shot Learning Framework for Unseen IoT Device Classification

## Convert_pcap_to_csv
## The goal

On the [UNSW website](https://iotanalytics.unsw.edu.au/iottraces.html), IoT traffic
data is available in two formats:
* CSV data: 2 weeks
* PCAP data: 2 months

Since we want lots of CSV data, we convert the large PCAP dataset to CSV. For
this purpose, we use the bash script here.

## Usage

* Download PCAP data from UNSW website, put data in `../../pcap_unsw` folder
* Create the destination folder: `../../csv_from_pcap/`
* In `unsw_pcap_to_csv.sh`, set `pcapFiles` array to the files you want to convert
* Run the script: `./unsw_pcap_to_csv.sh`

Note: `tshark` has to be in the path.

## Converter logic

The converter does the following filtering and extraction:
* Only keep UDP and TCP packets
* ICMP failure packets with 2 protocols are ignored
* Fragmented an reassembled packets are ignored for the moment, they lack a port in PCAP

Conversion logic:

| CSV file | PCAP file |
|----------|-------------|
| Packet_ID | `frame.number` |
| TIME | `frame.time_epoch` |
| Size | `frame.len` |
| MAC_source | `eth.src` |
| MAC_destination | `eth.dst` |
| IP_source | `ip.src` |
| IP_destination | `ip.dst` |
| Layer_4_protocol | `ip.proto` |
| Port_source | `tcp.srcport` or `udp.srcport` |
| Port_destination | `tcp.dstport` or `udp.dstport` |


## Create_device_sequence






## Create windows



## ZEST Code
1. The data is splited into **seen** devices and **unseen** devices. 
2. Train a supervised self-attention based model for only **seen** devices. 
3. Use the pretrained model to extract attributes for both **seen** and **unseen** devices.
4. Train a CVAE model to learn the mapping between attributes and data space.
5. Use the decoder of CVAE model to generate Pesudo data for **unseen** devices.
6. Train a supervised classifier to do the classification.
