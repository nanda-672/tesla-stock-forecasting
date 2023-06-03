setwd("C://")
data = read.csv("dataset/TSLA.csv")

library(forecast)
library(tseries)
data_1 = ts(data$`Open`)
plot(data_1, main="Grafik nilai Open saham Tesla", ylab="value", xlab="bulan",type='o')

data_2 = diff(data_1)
plot(data_2, main="Grafik diferensiasi nilai Open saham Tesla", ylab="value", xlab="bulan",type='o')
adf.test(data_2)

acf(data_1, main='Autokorelasi nilai open price saham Tesla')
pacf(data_1, main='Parsial autokorelasi nilai open price saham Tesla')

acf(data_2, main='Autokorelasi nilai open price saham Tesla (dif)')
pacf(data_2, main='Parsial autokorelasi nilai open price saham Tesla (dif)')

data_3 = diff(data_2)
model = auto.arima(data_1)
model_3 = auto.arima(data_3)
summary(model)

(prediksi = forecast(model_3, h = 3))
plot(prediksi, main="Grafik prediksi nilai open price saham Tesla Inc. (diferensiasi 2 kali)", ylab = "dollar", xlab="bulan ke", type='o')

(prediksi = forecast(model, h = 3))
plot(prediksi, main="Grafik prediksi nilai open price saham Tesla Inc.", ylab = "dollar", xlab="bulan ke", type='o')
