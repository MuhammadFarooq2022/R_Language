#Violin plots
library(ggplot2)
data("diamonds")
nrow(diamonds)
x <- diamonds
nrow(x)
ncol(x)
head(x)
str(x)
sample_x <- x[seq(from=1, to=50000, by=50),]
nrow(sample_x)
ggplot(data = sample_x, mapping = aes(x=cut, y=price, col=cut))+
  geom_violin()+ geom_boxplot(width=0.1)+geom_jitter(size=0.5)+
  facet_wrap(~cut, nrow = 1, scales = "free_x")+ theme_bw()+
  ggsave("Violin Plot.tiff", units = "in", width = 8, height = 6,
         dpi = 600, compression="lzw")

ggplot(data = x, mapping = aes(x=cut, y=price, col=cut))+
  geom_violin()+ geom_boxplot(width=0.1)+geom_jitter(size=0.5)
  
  
#Heat Maps
library(ggplot2)
iris
x <- iris
install.packages("reshape")
library(reshape)
x1 <- melt(x)
ggplot(data = x1, mapping = aes(x=Species, y=variable, fill=value))+
  geom_tile()+ scale_fill_gradient(low = "green",high = "red")

# Marginal Plots
library(ggplot2)
install.packages("ggExtra")
library(ggExtra)
data(mpg)
x <- mpg
ggplot(x, aes(cty, hwy))+ geom_count()+ geom_smooth(method = "lm")
p1 <- ggplot(x, aes(cty, hwy))+ geom_count()+ 
  geom_smooth(method = "lm")
p1
ggMarginal(p1, type = "boxplot", fill="transparent")
ggMarginal(p1, type = "histogram", fill="transparent")
ggMarginal(p1, type = "density", fill="transparent")
ggMarginal(p1, type = "violin", fill="transparent")
ggMarginal(p1, type = "densigram", fill="transparent")
help("ggMarginal")
