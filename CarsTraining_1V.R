library(readr)
CarsTraining<- read.csv("C:/Users/T450S/Desktop/Floriana/Ubiqum/Data Analytics II/Task 1/Cars/cars.csv")
attributes(CarsTraining)
summary(CarsTraining)
str(CarsTraining)
names(CarsTraining)
CarsTraining$name.of.car
CarsTraining$distance.of.car<-as.numeric(CarsTraining$distance.of.car)
str(CarsTraining)
hist(CarsTraining$distance.of.car)
is.na(CarsTraining)
names(CarsTraining)<-c("CarName","CarSpeed","CarDistance")
attributes(CarsTraining)
set.seed(123)
trainSize<-round(nrow(CarsTraining)*0.7)
testSize<-nrow(CarsTraining)-trainSize
trainSize
testSize
training_indices<-sample(seq_len(nrow(CarsTraining)),size = trainSize)
trainSet<-CarsTraining[training_indices,]
testSet<-CarsTraining[-training_indices,]
CarModel<-lm(CarDistance~ CarSpeed, trainSet)
summary(CarModel)
CarDistancePrediction<-predict(CarModel,testSet)
CarDistancePrediction
testSet$Prediction <- CarDistancePrediction
