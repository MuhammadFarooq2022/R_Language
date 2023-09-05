## Important packages to be used in R----
## Reading data----
library("readxl") # to import xlsx data
library("readr")  # CSV and other files
library("datapasta") # copy clipboard

## To handle data
library("dplyr")
library("tidyr")

## Writing data and export into files
library("WriteXLS")
library("writexl")

## Story telling with visualization
library("ggplot2")
library("ggpubr")
library("plotly")
library("ggthemes")
library("viridis")

## Set of most packages
library("tidyverse")

# Let's use these packages and turn them into data driven decision making
data()

data("diamonds")
remove(diamonds)

# let's explore the data
??diamonds
summary(diamonds)
glimpse(diamonds)
head(diamonds, 10)
tail(diamonds)
str(diamonds)

# Visualization and explore the categorical data ----

qplot(diamonds$cut)

qplot(cut, data = diamonds)
