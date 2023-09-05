library(ggplot2)
library(plotly)
data("iris")
p <- ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Species))+
  geom_point()
p
ggplotly(p)

data("volcano")
head(volcano)
plot_ly(z =~volcano) %>% add_surface()
plot_ly(z = volcano, type = "surface")

#different surfaces
x1 = c(1,2,3,4,5)
y1 = c(1,2,3,4,5)
z1 = rbind(
  c(0, 1, 0, 1, 0),
  c(1, 0, 1, 0, 1),
  c(0, 1, 0, 1, 0),
  c(1, 0, 1, 0, 1),
  c(0, 1, 0, 1, 0))
p1 <- plot_ly(
  type = "surface",
  contours = list( 
    x = list(show = TRUE, start = 1.5, end = 2, size = 0.04, color = "blue"),
    y = list(show = TRUE, start = 0.5, end = 0.8, size = 0.05)),
  x = ~x1,
  y = ~y1,
  z = ~z1)
p1  

#scatter plot  
p1 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)
p1

p1 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
              marker = list(size = 10, color = "blue",
                            line = list(color = "black", width = 2)))
p1

#line + scatter plot
x_0 <- rnorm(100, mean = 5)
x_1 <- rnorm(100, mean = 0)
x_2 <- rnorm(100, mean = -5)
x <- c(1:100)

d1 <- data.frame(x, x_0, x_1, x_2)

fig <- plot_ly(d1, x = ~x) 
#fig <- fig %>% = ,
fig <- fig %>% add_trace(y = ~x_0, name = "x 0",mode = "lines")
fig <- fig %>% add_trace(y = ~x_1, name = "x 1",mode = "lines+markers")
fig <- fig %>% add_trace(y = ~x_2, name = "x 2",mode = "markers")

fig

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species)

d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(
  d, x = ~carat, y = ~price,
  color = ~carat, size = ~carat)

#Piechart
labels = c('Oxygen','Hydrogen','Carbon_Dioxide','Nitrogen')
values = c(4500, 2500, 1053, 500)

fig <- plot_ly(type='pie', labels=labels, values=values, 
               textinfo='label+percent',
               insidetextorientation='radial')
fig

#bar plot
x = c("giraffes", "orangutans", "monkeys")
y = c(20, 14, 23)
plot_ly(type = "bar", x = x, y = y, color = x )

#bar plot on iris
plot_ly(data = iris, type = "bar", 
        x = iris$Sepal.Length, 
        y = iris$Sepal.Width,
        color = iris$Species)

dt <- group_by(iris,Species) %>% 
  summarise(Means = mean(Sepal.Length), sd = sd(Sepal.Length))

dt  

plot_ly(data = dt, type = "bar", 
        x = dt$Species, 
        y = dt$Means,
        color = dt$Species)
