This is the main code for our ZEST Model 


The input of the model is a sequence of 200 packets, each packet with 8 features as we mentioned in our paper. 

There are two jupyter notebook files, one name ""




1. The data is splited into **seen** devices and **unseen** devices. 
2. Train a supervised self-attention based model for only **seen** devices. 
3. Use the pretrained model to extract attributes for both **seen** and **unseen** devices.
4. Train a CVAE model to learn the mapping between attributes and data space.
5. Use the decoder of CVAE model to generate Pesudo data for **unseen** devices.
6. Train a supervised classifier to do the classification.




