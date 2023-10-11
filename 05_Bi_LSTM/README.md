# Supervised learning: IoT device classification

Train a Bi-LSTM on the packet windows. Learn to classify windows into IoT classes.

# Usage

- Make sure you have previously generated the window dataset
- The training is implemented in `train_from_npz.ipynb`
- The model checkpoints can be stored in a configurable folder
- In Google Colab, make sure you activate a GPU and high RAM, using the "Runtime" -> "Change runtime type" menu