#Install packages
install.packages("psych")
install.packages("corrplot")
install.packages("RColorBrewer")
library(psych)
library(corrplot)
library(RColorBrewer)

#psych package
data("iris")

x <- corr.test(iris[-5])
x
pairs.panels(iris[-5])

#Import your dataset
x1 <- read_excel("data.xlsx")

m <- cor(x1[ , -1])

corrplot(m)

?corrplot

corrplot(m, type="upper", order="hclust", method="pie",
         col=brewer.pal(n=8, name="RdYlBu"))

#mixed corrplot
corrplot.mixed(m)

corrplot.mixed(m, lower.col = "black", number.cex=0.8)

corrplot.mixed(m, lower = "square", upper = "pie", ti.col="Red")
