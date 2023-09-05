library(readxl)
x <- read_excel("D:/R/test1/data.xlsx", 
                   sheet = "data2", col_types = c("text", 
                                                  "numeric", "numeric", "text"))
View(x)

# boxplot
boxplot(x$Height ~ x$Crop)
boxplot(Height ~ Crop, data = x)

# multiple comparison of means

# 1- Tukey.HSD test
install.packages("agricolae")
library(agricolae)

help("agricolae-package")
??'agricolae-package'

model <- aov(Height ~ Crop, data = x)
out <- HSD.test(model, "Crop", group = TRUE, console = TRUE, main = "Tukey test")
plot(out)

# 2- LSD.test
model <- aov(Height ~ Crop, data = x)
out <- LSD.test(model, "Crop", group = TRUE, console = TRUE, main = "LSD test")
plot(out)

# 3- Duncan test
model <- aov(Height ~ Crop, data = x)
out <- duncan.test(model, "Crop", group = TRUE, console = TRUE, main = "Duncan test")
plot(out)

# grouping
boxplot(Height ~ Crop * water, data = x, las = 2, xlab = "")
model1 <- aov(Height ~ Crop * water, data = x)
out1 <- HSD.test(model1, c("Crop","water"), group = TRUE, console = TRUE, main = "Tukey test")
plot(out1, horiz = TRUE, las = 2)

# How to save a plot
jpeg(file ="Tukey test.tiff",
     width = 6, height = 4, units = "in", res = 300)
boxplot(Height ~ Crop * water, data = x, las = 2, xlab = "")
dev.off()

jpeg(file ="Tukey test plot.tiff",
     width = 6, height = 4, units = "in", res = 300)
plot(out1, las = 2)
dev.off()