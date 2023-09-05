library(readxl)
my_data <- read_excel("data.xlsx", sheet = "data", 
                      col_types = c("text", "numeric", "numeric"))
View(my_data)

str(my_data)

head(my_data)

tail(my_data)

plot(my_data)

boxplot(my_data$Height, my_data$Weight)

boxplot(my_data$Height ~ my_data$Crop)
