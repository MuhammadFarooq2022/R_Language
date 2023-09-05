install.packages("data.table")

library(data.table)
library(tidyverse)
library(dplyr)
library(dslabs)

data(heights)
# heights <- setDT(heights)

summary(heights)

mean(heights$height)

ind <- heights$height > 68.3
sum(ind)

a_b <- heights$height > 68.3
female <- heights$sex == "Female"

ind <- a_b & female
sum(ind)

mean(heights$sex == "Female")

min(heights$height)

i <- which.min(heights$height)
i

match(50,heights$height)
heights$sex[1032]

heights$sex[match(50, heights$height)]

max(heights$height)

x <- 50:82
x

sum(!(x %in% heights$height))

female <- heights$sex == "Female"
sum(female)

male <- heights$sex == "Male"
sum(male)

nrow(heights)

heights2 <- mutate(heights, ht_cm = height * 2.54)
head(heights2)

index <- heights2$ht_cm[18]
index

mean(heights2$ht_cm)

females <- filter(heights2, sex == "Female")
head(females)

nrow(females)

mean(females$ht_cm)

data(olive)
head(olive)

plot(olive$palmitic, olive$palmitoleic)

hist(olive$eicosenoic)

boxplot(palmitic~region, data = olive)
