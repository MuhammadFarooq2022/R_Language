#1-heatmap
x <- mtcars
heatmap(mtcars)

x <- as.matrix(mtcars)
heatmap(x, scale = "column")

#2-gplots
install.packages("gplots")
library(gplots)
heatmap.2(x, scale="column", col = bluered(100),
          trace = "none")
?heatmap.2()

#3-pheatmap
install.packages("pheatmap")
library(pheatmap)
pheatmap(x, scale = "column", cutree_rows = 4, cutree_cols = 2)

#4-ggplot2
install.packages("ggplot2")
library(ggplot2)
y <- iris

install.packages("reshape")
library(reshape)

y1 <- melt(iris)

ggplot(y1, aes(y1$Species, y1$variable, fill=y1$value))+
  geom_tile()+ scale_fill_gradient(low = "yellow", high = "red")
