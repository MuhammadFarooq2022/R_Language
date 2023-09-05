library(readxl)
my_data <- read_excel("data.xlsx", sheet = "data", 
                      col_types = c("text", "numeric", "numeric"))
View(my_data)

# strip chart
stripchart(my_data$Height)
stripchart(my_data$Height ~ my_data$Weight)

# histogram
hist(my_data$Height)
hist(my_data$Weight)

# scatter plot
plot(my_data$Weight, my_data$Height)

# qqnorm plot
qqnorm(my_data$Height)

# barplot
barplot(my_data$Height)

# mosaic plot
mosaicplot(~ my_data$Crop+my_data$Height)
