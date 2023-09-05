# read data
data("iris")

#PCA
x <- prcomp(iris[,-5], center=TRUE, scale.= TRUE)
print(x)
summary(x)

#ggplot2 grouping
iris <- cbind(iris, x$x)

ggplot(iris, aes(PC1, PC2, col=iris$Species, fill=iris$Species))+
  stat_ellipse(geom = "Polygon", col="black", alpha=0.5)+
  geom_point(shape=21, col="black")

#PCA plot
install.packages("factoextra")
install.packages("FactoMineR")
library(factoextra)
library(FactoMineR)

#PCA table
iris.pca <- PCA(iris[,-5], graph=TRUE, scale.unit=TRUE)

#screeplot
fviz_eig(iris.pca, addlabels = TRUE, ylim=c(0,70))

#PCA plot
fviz_pca_var(iris.pca, col.var="cos2",
             gradient.col=c("#FFCC00","#cc9933","#660033","#330033"),
             repel = TRUE)+
  labs(title = "PCA of parameters", x="PC1 (49%)", y="PC2 (23.9%)",
        colour = "cos2")+
  ggsave("PCA.png", units="in", width=6.5, height=5.5)
