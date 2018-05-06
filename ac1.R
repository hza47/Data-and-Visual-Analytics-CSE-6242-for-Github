#Activity 1
# Go to the desired directory
getwd()
setwd ('C:/Users/vchugh/Documents/Academics/Georgia Tech/Spring 2018/CS 6242 Data and Visual Analytics/Activity 1/')

#Initialize Library
library(stringr)
library(ggplot2)

#Load the CSV File
surveyInfo <- read.csv ('ac1_survey.csv')

#Keep only the numeric values from what is your favourite number and load the numeric values in a new column
What.is.your.favorite.number.numeric <- str_extract(surveyInfo$What.is.your.favorite.number. , "[[:digit:]]+")
What.is.your.favorite.number.numeric[is.na(What.is.your.favorite.number.numeric)] <- ""

#Change the string value to numeric
What.is.your.favorite.number.numeric = as.numeric(What.is.your.favorite.number.numeric)
surveyInfo$What.is.your.favorite.number.numeric = What.is.your.favorite.number.numeric

#Cretae a data frame with the frequency distribution of the favourite numbers.
a <- as.data.frame(table(What.is.your.favorite.number.numeric))

#Order the values so that the values are displayed incrementally on the x -axis.
a[order(a$What.is.your.favorite.number.numeric),]

#Do a scatter plot
plot(a$What.is.your.favorite.number.numeric, a$Freq, xlab = "Favourite Number", ylab = "Frequency", main = "Distribution of Favourite Numbers")

##hist(as.numeric(What.is.your.favorite.number.numeric), xlim = c(0,100), col = "RED", breaks = 10, ylim = c(0,1000))
#hist(AirPassengers, breaks=c(100, seq(200,700, 150))) #Make a histogram for the AirPassengers dataset, start at 100 on the x-axis, and from values 200 to 700, make the bins 150 wide
