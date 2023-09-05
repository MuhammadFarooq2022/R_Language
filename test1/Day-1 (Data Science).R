# Numeric Values
2
4
3

#Categorical variable
'R'
'with'
"Aammar"
"at"
"codanics"

#logical operator
TRUE
FALSE

#objects
x 
y
z
plot
Day1
anyother
#but do not use common function of Rstudio
#Always write with out Space (R with Aammar)
#Always use small letters with underscore ( _ ) to name a column or data frame

#to name any object we use <- or =
x <- 2+3+4+8+4+9
y <- 2+6+9+4+5
x
y
2+3+4+8+4+9+2+6+9+4+5
x+y

#How to make a dataset
x <- c(1, 2, 4, 5, 7, 9)
y <- c(2, 6, 8, 9, 12, 14)
x+y

#basic stat
mean(x)
mean(y)
mean(x+y)
mean(2*x+y)
summary(x)
min(x)
max(x)

#functions
log(10)
log(x)

#power
2^3
x^2

#R-builtin datasets
data()
iris
head(iris)
x <- iris
head(x)
view(x)
summary(iris)
summary(iris$Sepal.Length)
x1 <- iris$Sepal.Length
mean(x1)
summary(x1)

#formula and equations
a <- 2
b <- 5
c <- 4
d <- (-b + sqrt(b^2-4*a*c)/(2-3*a))
d

#data generation in R
n <- 1000
x <- seq(1, n)
x <- seq(1, 1000)
x
seq(5, 100)
seq(5, 100, by=10)
x <- seq(5, 100, by=1.5)
sum(x)
summary(x)
log(exp(x))
mean(x)
sd(x)
var(x)

#type of data frame
class(iris)
class(x)
class(iris$Sepal.Length)
class(iris$Species)
var(iris$Sepal.Length)
str(iris)
names(iris)

#subsetting
sl <- iris$Sepal.Length
str(sl)
mean(sl)
head(sl)
mean(iris$Sepal.Width)

#use of logical operator
z <- 2
z = 2

z <- 2==3
z

z <- 2==2
z

#levels to see the names inside a categorical variable
levels(iris$Species)
list(iris)

#matrix or matrices
mat <- matrix(1:12, 4,3)
mat

#vectors
x <- c(1,3,5,7,9,11)
y <- c(2,4,6,8,10,12)
z <- c("a","b","c","d","e","f")
x
y
z
data <- cbind(x, y, z)

p1 <- data.frame(x, y, z)
p1
sort(p1$x)
rank(p1$x)
summary(p1)

#simple way
x <- c("Orange"=10, "Mangoes"=5, "Peach"=6)
x

#advanced subsetting
iris
head(iris)
x <- iris[1:10,]
x

z <- iris[1:10,1:4]
z

z1 <- iris[1:10, -5]
z1

iris[50:125,1:3]
iris[50:125, -5:-4]

p1[c(1,3)] #to select a specific column
p1

iris
head(iris)
levels(iris$Species)

sub1 <- subset(iris, iris$Species=="virginica")
sub1

d1 <- subset(iris, iris$Species=="virginica" | iris$Species=="setosa")
d1

a <- subset(iris, iris$Sepal.Width <= 3.0)
a
b <- subset(iris, iris$Sepal.Width >= 3.0)
b

x <- which(iris$Species=="virginica")
x

#method 3
c("virginica", "setosa") %in% iris$Species

match(c("virginica", "setosa"),iris$Species)

which(iris$Species %in% c("virginica", "setosa"))


install.packages("corrplot")
library(corrplot)

c <- cor(iris[,-5])
c
corrplot(c)

install.packages("PerformanceAnalytics")
install.packages("xts")
install.packages("zoo")
library(PerformanceAnalytics)
library(zoo)
library(xts)
