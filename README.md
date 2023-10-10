# ZEST_source_code

This is the source code of our paper: ZEST: A Zero-Shot Learning Framework for Unseen IoT Device Classification

## Convert_pcap_to_csv


## Create_device_sequence

## Create windows



## ZEST Code
1. The data is splited into **seen** devices and **unseen** devices. 
2. Train a supervised self-attention based model for only **seen** devices. 
3. Use the pretrained model to extract attributes for both **seen** and **unseen** devices.
4. Train a CVAE model to learn the mapping between attributes and data space.
5. Use the decoder of CVAE model to generate Pesudo data for **unseen** devices.
6. Train a supervised classifier to do the classification.
