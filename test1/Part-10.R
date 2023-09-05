#Data wrangling and Data Transformation
install.packages("tidyverse")
install.packages("tidyr")
library(tidyverse)
library(tidyr)

#builtin data sets in R
data()

#data types are more important that data itself...
#data structure is more important than data significance...

###Step-1 Set your home directory (ctrl+shift+h)
###Step-2 Import your data in R (readxl, readcsv) 
###Step-3 Data Structure and type
###Step-4 Data Transformation and tidy tips and tricks
###Step-5

##Step-3 Data Structure and type----
###Data types
###numeric
num <- 2.2
class(num)

#Character
chr <- "RwithAammar"
class(chr)

#Logical
logi <- TRUE
class(logi)

#How to confirm a class/data type of variable:
num
is.numeric(num)
chr
is.character(chr)
logi
is.logical(logi)

#Data structure
data("diamonds")
x <- diamonds
x
head(x)
str(x)
class(x$carat)
class(x$price)
class(x$x)
class(x["carat"])
as.data.frame(x)
as_tibble(x)
glimpse(x)

#Convert into right data type?
x$carat <- as.numaric(x$carat)
class(x$carat)
glimpse(x)
str(x)

#Vector
vec1 <- c(1,2,3,4,6,9,0,-1,0.5)
class(vec1)
#Factor
vec2 <- c("blue", "red", "purple", "green")
class(vec2)
vec2_fac <- as.factor(vec2)
class(vec2_fac)
vec2_fac

#Continuous variables (1- numbers, and 2- Integer)
#string_Character
#vector
#factor
#logical

##Step-4 Data Transformation and tidy tips and tricks----
###how to transform a data type
num1 <- "3.2"
class(num1)

num1 <- as.numeric(num1) #use this to convert
class(num1)

num2 <- c(1,2,3,4,5,-1.5,1.5,0.5)
num2
class(num2)
num2 <- as.character(num2)
class(num2)
print(num2) #or num2 only are same things
as.numeric(num2)

#convert to logical
num2 <- as.logical(num2)
class(num2)
num2

#tidy means to collect data and make it usable for statistics  in R
x <- CO2
glimpse(x)
as_tibble(x)
as.data.frame(x)

x1 <- chickwts
as_tibble(x1)

##manipulating data
install.packages("dslabs")
library(dslabs)
data("diamonds")
x <- diamonds
head(x)
#add a column
as_tibble(x)
x <- mutate(x, a = x+y)
as_tibble(x)

x <- mutate(x, mean = mean(x+y+z))
as_tibble(x)

x <- mutate(x, sd = sd(x+y+z))
as_tibble(x)

x <- mutate(x, mean = mean/1000) # you can change units of a variable
as_tibble(x)

#subsetting
as_tibble(x)
x_a1 <- filter(x, a == 7.93)
as_tibble(x_a1)

x_a2 <- filter(x, cut=="Ideal") # subsetting a character variable
as_tibble(x_a2)

#subsetting using select function
as_tibble(x)
x1 <- select(x, cut, color, x)
as_tibble(x1)

#task for Assignment 
data("murders")
x <- murders
as_tibble(x)

 #criterial = pop >5^6
 #region = south
 #any plot for both 

#Less code for more output
#dplyr pipe %>%-
 ## object
 ## diamonds
 ## filter
 ## select
 ## mutate

p1 <- diamonds %>%
  filter(cut=="Ideal") %>%
  select(cut, color, x) %>%
  mutate(y=x*2)

p1 <- p1 %>%
  mutate(z = x+y)
# or we can use this
p1 <- mutate(p1, z = x+y)
p1

