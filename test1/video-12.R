#Scatter plot in R

library(ggplot2)

data("cars")

ggplot(data = cars, aes(x= speed, y= dist))+geom_point()+
  geom_smooth(method = "lm", se=F, level=0.95)

#Scatter plot with multi line
data("Orange")
ggplot(data = Orange, aes(x=age, y=circumference, color=Tree))+
  geom_point(size=4, shape=19)

#Separate by shape
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4, shape=19)+ geom_line(aes(linetype=Tree), linesize=1)+
  labs(x="Age", y="Circumference", title="Graph")+
  ggsave("scatterplot.pdf")

#Bubble plot
install.packages("viridis")
library ("viridis")
data("quakes")
nrow(quakes)
q_sample <- quakes[seq(from=1, to=1000, by=10),]
nrow(q_sample)

ggplot(data= q_sample, aes(x=lat, y=long))+
  geom_point(aes(size=mag, color=mag))+
  guides(size=F)+
  scale_color_viridis_b(option="B")+
  scale_size_continuous(range = c(1,9))+
  labs(x="Latitude", y="Longitude", title="Graph")+
  ggsave("bubbleplot.pdf")

#Jitter plot
data("diamonds")
d_sample <- diamonds[seq(from=1, to=49000, by=10),]
nrow(d_sample)

ggplot(d_sample, aes(cut, price, color=cut))+geom_jitter()+
  ggsave("jitterplot.pdf")
