#Data Wrangling and Data Transformation
library(tidyverse)
library(tidyr)

#Summaries Function
x <- mtcars
view(x)
as_tibble(x)
class(x$mpg)
summarise(x, avg = mean(mpg))
summarise(x, avg = sd(mpg))
summarise(x, avg = median(mpg))
summarise(x, avg = IQR(mpg))
summarise(x, avg = min(mpg))
count(x, mpg)
x %>% summarise(avd = mean(mpg))

#group by
mtcars %>%
  group_by(cyl) %>%
  summarise(avg = mean(mpg))

mtcars %>%
  group_by(vs) %>%
  summarise(avg = mean(mpg))

#row wise
x <- starwars %>% 
  rowwise() %>% 
  mutate(film_count = length(films))

#Manipulate data
x1 <- filter(mtcars, mpg > 20)

data(mtcars)
x2 <- distinct(mtcars, gear)

x2 <- slice(mtcars, 21:25)

x2 <- slice_sample(mtcars, n = 10, replace = TRUE)

x2 <- slice_min(mtcars, mpg, prop = 0.25) #proportion in percent of data

x2 <- slice_head(mtcars, n = 8)

#Order Data
arrange(mtcars, mpg) #by default ascending
arrange(mtcars, desc(mpg)) #descending

#add rows
cars2 <- add_row(cars, speed = 20, dist = 5)

cars2 <- add_row(cars, speed = 20)
cars2[is.na(cars2)] = 0 #to convert NA values into zero              

#Manipulating variables
x <- pull(mtcars, wt)
x

x1 <- select(mtcars, mpg, cyl)
x1 <- select(mtcars, mpg:drat)

x1 <- relocate(mtcars, mpg, cyl, .after = last_col())

summarise(mtcars, mean(mpg)) #for only one variable
x1 <- summarise(mtcars, across(everything(), mean)) # across all variables

mtcars %>% 
  rowwise() %>% 
  mutate(z = (mpg+cyl+disp)/3) #we have to recheck the across functions?

x1 <- mutate(mtcars, gpm =1 / mpg)

x2 <- transmute(mtcars, gpm =1 / mpg)

x1 <- rename(x1, RwithAammar = gpm)

