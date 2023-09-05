#Publication ready Graphs (Part-1)

#Install following Packages

install.packages("readxl")
install.packages("tidyverse")
install.packages("agricolae")
install.packages("devtools")
install.packages("WriteXLS")
install.packages("ggpubr")
install.packages("ggplot2")
devtools::install_github("JLSteenwyk/ggpubfigs")

#Load All Packages

library(readxl)
library(tidyverse)
library(agricolae)
library(devtools)
library(WriteXLS)
library(ggplot2)
library(ggpubfigs)
library(ggpubr)

#Load Data

data("PlantGrowth") #Builtin Dataset

#Statistical Analysis of Data (TUKEY.HSD test)

value_max = PlantGrowth %>% 
  group_by(group) %>% 
  summarise(max_value = max(weight)) #Calculating the maximum value to draw letters

hsd = HSD.test(aov(weight ~ group, data = PlantGrowth), trt = "group", group = T)
sig.letters <- hsd$groups[order(row.names(hsd$groups)), ]

#Visualization

ggplot(data = PlantGrowth, aes(x = group, y = weight, fill = group))+
  geom_boxplot()+
  stat_boxplot(geom = "errorbar", width = 0.1)+
  geom_text(data = value_max, aes(x = group, y = 0.15 + max_value,
                                   label = sig.letters$groups), vjust = 0)+
  ggtitle("") + xlab("Treatments") + ylab("Plant weight (g)") +
  scale_fill_manual(values = friendly_pal("bright_seven")) + theme_simple() +
  theme(legend.position = "none") +
  ggsave("PlantGrowth.tiff", units = "in", width=8, height=8, dpi=300, compression= "lzw")

  