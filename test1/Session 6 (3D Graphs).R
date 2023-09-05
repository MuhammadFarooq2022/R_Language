install.packages("plot3D")
library(plot3D)
data("iris")
head(iris)
str(iris)
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width

#Labels
scatter3D(x, y, z, clab = c("sepal", "width (cm)"))

#Size of Points
scatter3D(x, y, z, colvar = NULL, col = "red",
          pch = 17, cex = 0.5)

#Full Box
scatter3D(x, y, z, bty = "f", colkey = FALSE, main = "bty = 'f'",
          phi = 45)

#Change in Shape
scatter3D(x, y, z, bty = "f", colkey = FALSE, main = "bty = 'f'",
          phi = 45, pch = 18)

#Colors
scatter3D(x, y, z, pch = 18, bty = "u", colkey = FALSE, 
          main = "bty = 'u'", col.panel = "steelblue", 
          expand = 0.4, col.grid = "darkblue")

scatter3D(x, y, z, pch = 18, bty = "g", col = gg.col(100))

scatter3D(x, y, z, pch = 18, bty = "g", 
          col = ramp.col(c("blue", "yellow", "red")))

#Color Variable
scatter3D(x, y, z, pch = 18, bty = "g",
          col.var = as.integer(iris$Species))

scatter3D(x, y, z, pch = 18, bty = "g",
          col.var = as.integer(iris$Species),
          col = c("#1B9E77", "#D95F02", "#7570B3"),
          ticktype = "detailed", 
          colkey = list(at = c(2, 3, 4), side = 1,
                        addlines = TRUE, length = 0.5, width = 0.5,
                        labels = c("setosa","versicolor","virginica")))
#Angle theta, phi 
scatter3D(x, y, z, theta = 0, phi = 20)

#Labels change
scatter3D(x, y, z, pch = 18, theta = 15, phi = 25,
          main = "Iris Data", xlab = "Sepal.Length",
          ylab = "Petal.Length", zlab = "Sepal.Width")

scatter3D(x, y, z, pch = 20, bty = "g",
          phi = 0, cex = 2, ticktype = "detailed")

#Text Graph
text3D(x, y, z, labels = rownames(iris),
       add = TRUE, colkey = FALSE, cex = 0.5)

#Line Plot
scatter3D(x, y, z, phi = 0, bty = "g", type = "b", 
          ticktype = "detailed", lwd = 4)

#Line + Point Plot
scatter3D(x, y, z, phi = 0, bty = "g", type = "b", 
          ticktype = "detailed", pch = 20,
          cex = c(0.5, 1, 1.5))

#CI Calculation
CI <- list(z = matrix(nrow = length(x),
                      data = rep(0.1, 2*length(x))))
scatter3D(x, y, z, phi = 0, bty = "g", col = gg.col(100),
          pch = 18, CI = CI)

#Bar 3D or HIST 3D
data(VADeaths)
#Hist 3D and ribbon3D with grayish background, rotated, rescaled
hist3D(z = VADeaths, scale = FALSE, expand = 0.01, bty = "g", phi = 20,
       col = "#0072B2", border = "black", shade = 0.2, ltheta = 90,
       space = 0.3, ticktype = "detailed", d = 2)     
