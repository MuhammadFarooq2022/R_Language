#exporting builtin data sets as excel file 
install.packages("writexl")
library(writexl)
write_xlsx(CO2, path = "D:\\R")

#ggplot2 tips and tricks
install.packages("ggplot2")
library(ggplot2)
ggplot(data = trees, mapping = aes(x=trees$Girth, y=trees$Height))+
  geom_point()+ geom_smooth(method = "lm")

ggplot(trees, aes(trees$Girth, trees$Volume))+ geom_line()+ 
  geom_point()+ geom_smooth(method = "lm")

ggplot(trees, aes(x= trees$Volume, y=trees$Height))+ geom_point()+ 
  geom_line()+ geom_smooth(method = "lm")+
  labs(title= "Trees", x= "Volume (cm^3)", y= "Height (cm)")

plot1 <- ggplot(trees, aes(x= trees$Volume, y=trees$Height))+ geom_point()+ 
  geom_line()+ geom_smooth(method = "lm")+
  labs(title= "Trees", x= "Volume (cm^3)", y= "Height (cm)")

plot1+ggsave("plot1.tiff")
plot1+ggsave("plot1.tiff", units = "in", width = 8, height = 6, dpi = 600, compression="lzw")
plot1+coord_flip()

#scatter plot in R
x <- cars
View(x)
ggplot(x, aes(x$speed, x$dist))+  geom_point()+ 
  geom_smooth(method = "lm", se=T, level=0.75)

#scatter plot with multiple lines
ggplot(Orange, aes(Orange$age, Orange$circumference, col=Orange$Tree))+
  geom_point(size=5, alpha=0.75, shape=18)

#change in shape
ggplot(Orange, aes(Orange$age, Orange$circumference, shape=Orange$Tree))+
  geom_point(size=5, alpha=0.75)

#change in size
ggplot(Orange, aes(Orange$age, Orange$circumference, col=Orange$Tree))+
  geom_point(size=10, alpha=0.6)+
  labs(title= "Orange", x= "Age", y= "Circumference", col="Tree Type")

ggplot(Orange, aes(Orange$age, Orange$circumference))+
  geom_point(size=4, alpha=0.6)+
  geom_line(aes(linetype=Orange$Tree), size=1)

#geom line
ggplot(Orange, aes(Orange$age, Orange$circumference, col=Orange$Tree))+
  geom_line()+
  labs(title= "Orange", x= "Age", y= "Circumference", col="Tree Type")

#Box plot
ggplot(Orange, aes(Orange$age, Orange$circumference, fill=Orange$Tree))+
  geom_boxplot()

#bubble plot
install.packages("viridis")
library(viridis)
x <- quakes
nrow(x)
sample_x <- x[seq(from=1, to=1000, by=10),]
ggplot(sample_x, aes(sample_x$lat, sample_x$long))+ 
  geom_point(aes(size=mag, col=mag))+ guides(size=FALSE)+
  scale_color_viridis_b(option = "B")+
  scale_size_continuous(range = c(1,9))+
  labs(title= "Graph", x= "Latitude", y= "Longitude")+
  ggsave("Bubbleplot.pdf")
