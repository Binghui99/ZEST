# Convert PCAP data from UNSW website to CSV like on UNSW website

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

