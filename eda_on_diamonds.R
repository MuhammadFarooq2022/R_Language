# EDA on Diamonds dataset----

library(ggplot2)
library(tidyverse)

data("diamonds")

View(diamonds)
str(diamonds)
summary(diamonds)
glimpse(diamonds)

ggplot(diamonds, aes(x= carat, y = price)) +
  geom_point()

ggplot(diamonds, aes(x= carat, y = price, color = cut)) +
  geom_point() +
  facet_wrap(~cut)

# summarize with dply
mean(diamonds$price)

diamonds %>% 
  group_by(cut) %>% 
  summarise(mean(price))

ks.test(diamonds$price)
