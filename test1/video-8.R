#How to use built in data sets of R
data() #All data sets in R
View(CO2) #To view data sets in R console
View(PlantGrowth)
View(iris)
View(mtcars)
View(trees)
View(npk) #npk data for factorial design

head(CO2) #To show first 6 rows of the data
names(CO2)#To show the names of the columns
nrow(CO2) #To show the numbers of rows
ncol(CO2) #To show the numbers of columns

install.packages("writexl") #To save .xlsx files
library(writexl)

write_xlsx(CO2, path = "D:\\R\\test1\\CO2.xlsx") #Command line to save .xlsx files

library(ggplot2) #To plot graphs and figures

ggplot(trees, aes(Girth, Height))+geom_point()+geom_smooth(method = "lm") #Scatter plot