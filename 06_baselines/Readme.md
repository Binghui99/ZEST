## Baselines 

There are 4 baselines, all of them are based on the Bi-LSTM model we mentioned above. 
But VAE-K use VAE to reduce the dimension
They utilize different solutions to do the classification. 


#### VAE-K
-It employs VAE to extract features and applys k-means to perform clustering subsequently.

-You can cite by Bibtex: 
@inproceedings{ICC_unsuper,
  author       = {Zhang {\it et al.}, Shize},
  title        = {{Unsupervised IoT Fingerprinting Method via Variational Auto-encoder
                  and K-means}},
  booktitle    = {{IEEE} {ICC} },
  year         = {2021},
}


#### SeqCR
-It ultilizes BiLSTM to extract features, and uses k-means to do clustering 

#### SeqCS

-It ultilizes BiLSTM to extract features, and uses seeded k-means to do clustering 

#### DEFT

-It ultilizes BiLSTM to extract features, and uses seeded k-means to do clustering. Then use Random forest to enhance the performance. 


-You can cite by Bibtex: 

@ARTICLE{DEFT-2019, 
author={Thangavelu {\it et al.}, Vijayanand}, 
journal={IEEE Internet of Things Journal}, 
title={{DEFT: A Distributed IoT Fingerprinting Technique}}, 
year={2019}, 
volume={6}, 
number={1}, 
pages={940-952},
}
