library(readxl)
data <- read_excel("data.xlsx", sheet = "data2", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
View(data)

mean(data$Height)
mean(data$Weight)
median(data$Height)
median(data$Weight)

min(data$Height)
max(data$Height)

range(data$Height)

quantile(data$Height, .25)
quantile(data$Height, .75)

sd(data$Height)

var(data$Height)

lapply(data[, 2:3], mean)
lapply(data[, 2:3], sd)
lapply(data[, 2:3], var)

summary(data)

# annova
aov(data$Height ~ data$Crop)
a1 <- aov(data$Height ~ data$Crop)
summary(a1)
TukeyHSD(a1)

# group annova
a2 <- aov(data$Height ~ data$Crop * data$water)
summary(a2)
TukeyHSD(a2)
