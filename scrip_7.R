# Import data
df <- iris

# one sample t.test

t.test(df$Sepal.Length, mu = 6.5)

# tow sample t-test
# Independent t-test / unpaired t-test

t.test(df$Sepal.Length, df$Petal.Length, paired = FALSE)

# paired t-test kub lagana ha

pre_treatment <- c(rnorm(2000, mean = 150, sd = 10))
post_treatment <- c(rnorm(2000, mean = 144, sd = 9))

# t-test ab lagana hay paired wala

t.test(pre_treatment, post_treatment, paired = TRUE)

# 
library(tidyverse)
df <- iris
df <- df %>% 
  filter(Species %in% c("setosa", "versicolor"))
  
t.test(df$Petal.Width ~ df$Species)

