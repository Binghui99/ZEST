#This is the main code for our ZEST Model 

#Input
The input of the model is a sequence of 200 packets, each packet with 8 features as we mentioned in our paper. 

#File description
There are two jupyter notebook files: 

## ZEST_SANE.ipynb
1. We deisgned a self-attention based feature extractor.
2. It is pretrained on **seen** devices.
3. Then it is used to generate attributes for both seen and unseen classes.

## ZEST_SANE_CVAE_SVM
1. It contains all the code for ZEST model
2. After extract attributes, we ultize a CVAE model to learn the mapping between attributes and traffic data.
3. Use the decoder of CVAE model to generate Pesudo data for **unseen** devices.
4. Train a supervised classifier (SVM) to do the classification.







