#Publication ready Graphs (Part-2)

#Install following Packages

install.packages("readxl")
install.packages("tidyverse")
install.packages("agricolae")
install.packages("devtools")
install.packages("esquisse")
install.packages("hrbrthemes")
devtools::install_github("JLSteenwyk/ggpubfigs")

#Load All Packages

library(readxl)
library(tidyverse)
library(agricolae)
library(devtools)
library(esquisse)
library(hrbrthemes)
library(ggpubfigs)

#Load Data

data("midwest") #Scatter plot
data("iris")
data("mtcars")
data("PlantGrowth")

#The megic

esquisser()

ggplot(PlantGrowth) +
  aes(x = group, y = weight, fill = group) +
  geom_boxplot() +
  scale_fill_viridis_d(option = "viridis", direction = 1) +
  labs(
    x = "Treatments",
    y = "Plant Weight (g)",
    title = "Boxplot-Autoggplot",
    fill = "Treatments"
  ) +
  theme_classic()
