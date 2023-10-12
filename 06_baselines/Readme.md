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
