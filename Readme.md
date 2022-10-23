# Time series forecasting with LSTM

Using a dataset containing the [power consumption of Tetouan city](https://archive.ics.uci.edu/ml/datasets/Power+consumption+of+Tetouan+city), an LSTM based Deep Neural Network is trained to forecast 3 features.

In the repository, a .mat file is included that contains the mean and standard deviation values of each feature, with which a zero z-score is calculated. In order to get the actual power consumption forecast from the network, do the inverse operation of the zero z-score (add the mean value and multiple by the standard deviation).

The model learns quite well on the dataset, which is shown by it's low validation and testing Root Mean Square Error (RMSE) and requires relatively low epochs and hardware to be trained quickly (with a [GeForce GTX 1060](https://www.nvidia.com/en-gb/geforce/graphics-cards/geforce-gtx-1060/specifications/) it takes less than a minute to train).

The network can be utilized in one of two ways, Open Loop or Closed Loop Forecasting. The former, uses actual ground truth data as input to predict subsequent time steps, while the latter uses the prediction of the previous time step to predict the next.

This application of Recurrent Neural Networks, showcases the ability to associate information given earlier to these networks in order to predict future values.