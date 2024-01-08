# ZEST_source_code

This is the source code of our paper: ZEST: Attention-based Zero-Shot Learning for Unseen IoT Device Classification.
[https://arxiv.org/abs/2310.08036](https://arxiv.org/abs/2310.08036)
## This paper is accepted by IEEE NOMS 2024



## Convert_pcap_to_csv
### The goal

On the [UNSW website](https://iotanalytics.unsw.edu.au/iottraces.html), IoT traffic
data is available in two formats:
* CSV data: 2 weeks
* PCAP data: 2 months

Since we want lots of CSV data, we convert the large PCAP dataset to CSV. For
this purpose, we use the bash script here.

### Usage

* Download PCAP data from UNSW website, put data in `../../pcap_unsw` folder
* Create the destination folder: `../../csv_from_pcap/`
* In `unsw_pcap_to_csv.sh`, set `pcapFiles` array to the files you want to convert
* Run the script: `./unsw_pcap_to_csv.sh`

Note: `tshark` has to be in the path.

### Converter logic

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

### How to generate sequences

Run the jupyter notebook `from_csv_to_sequence.ipynb`. In particular, the function `create_features_from_csv()` generates the sequences.




## Create windows


Generate the dataset for window-based device classification.

### Usage

To generate the dataset, run the jupyter notebook `csv_to_npz_windows.ipynb`, the dataset generation happens in the function `csv_sequences_to_npz_windows()`.

Make sure you have previously generated the device sequences.

### Dataset format

The dataset is stored as `*.npz` file: a compressed numpy array.

Inside the npz file, you can find:
- `x`: the windows that serve as input to a ML model
- `y`: the labels that serve as ground truth

The dimensions of the numpy arrays are as follows:
- `x`: WINDOWS x WINDOW_LENGTH x FEATURES. This is a long list of windows, where each window consists of consecutive packets for one IoT device.
- `y`: WINDOWS x 1 x CLASSES. This is a long list of labels, in one-hot encoding format.


## Supervised learning: IoT device classification

Train a Bi-LSTM on the packet windows. Learn to classify windows into IoT classes.

### Usage

- Make sure you have previously generated the window dataset
- The training is implemented in `train_from_npz.ipynb`
- The model checkpoints can be stored in a configurable folder
- In Google Colab, make sure you activate a GPU and high RAM, using the "Runtime" -> "Change runtime type" menu


# ZEST Code

This is the main code for our ZEST framework

1. The data is splited into **seen** devices and **unseen** devices. 
2. Train a supervised self-attention based model for only **seen** devices. 
3. Use the pretrained model to extract attributes for both **seen** and **unseen** devices.
4. Train a CVAE model to learn the mapping between attributes and data space.
5. Use the decoder of CVAE model to generate Pesudo data for **unseen** devices.
6. Train a supervised classifier to do the classification.



## Baselines 

There are 4 baselines, all of them are based on the Bi-LSTM model we mentioned above. 
But VAE-K use VAE to reduce the dimension
They utilize different solutions to do the classification. 


#### VAE-K
-It employs VAE to extract features and applys k-means to perform clustering subsequently.

-You can refer to: 
**Zhang, S., Wang, Z., Yang, J., Bai, D., Li, F., Li, Z., ... & Liu, X. (2021, June). Unsupervised IoT Fingerprinting Method via Variational Auto-encoder and K-means. In ICC 2021-IEEE International Conference on Communications (pp. 1-6). IEEE.**



#### SeqCR
-It ultilizes BiLSTM to extract features, and uses k-means to do clustering 

#### SeqCS

-It ultilizes BiLSTM to extract features, and uses seeded k-means to do clustering 

#### DEFT

-It ultilizes BiLSTM to extract features, and uses seeded k-means to do clustering. Then use Random forest to enhance the performance. 


-You can refer to :
**Thangavelu, V., Divakaran, D. M., Sairam, R., Bhunia, S. S., & Gurusamy, M. (2018). DEFT: A distributed IoT fingerprinting technique. IEEE Internet of Things Journal, 6(1), 940-952.**


