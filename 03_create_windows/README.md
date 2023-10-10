# Create packet windows in compressed numpy format

Generate the dataset for window-based device classification.

# Usage

To generate the dataset, run the jupyter notebook `csv_to_npz_windows.ipynb`, the dataset generation happens in the function `csv_sequences_to_npz_windows()`.

Make sure you have previously generated the device sequences.

# Dataset format

The dataset is stored as `*.npz` file: a compressed numpy array.

Inside the npz file, you can find:
- `x`: the windows that serve as input to a ML model
- `y`: the labels that serve as ground truth

The dimensions of the numpy arrays are as follows:
- `x`: WINDOWS x WINDOW_LENGTH x FEATURES. This is a long list of windows, where each window consists of consecutive packets for one IoT device.
- `y`: WINDOWS x 1 x CLASSES. This is a long list of labels, in one-hot encoding format.