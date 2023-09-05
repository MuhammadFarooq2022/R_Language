install.packages("gganimate")
install.packages("gifski")
install.packages("av")
install.packages("gapminder")
install.packages("viridisLite")
install.packages("viridis")
install.packages("dplyr")
library(ggplot2)
library(gganimate)
library(gifski)
library(av)
library(gapminder)
library(viridisLite)
library(viridis)
library(dplyr)
head(gapminder)
nrow(gapminder)

#simple Graph
ggplot(gapminder, aes(gdpPercap, lifeExp))+geom_point()

#size of pop
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop))+geom_point()

#Color code by country
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, col=country))+geom_point(show.legend = F)

#
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, col=country))+geom_point(show.legend = F, alpha=0.8)

#color change for beauty
AN1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, col=country))+geom_point(show.legend = F, alpha=0.8)+
  scale_colour_viridis_d()+scale_size(c(1,11))+ scale_x_log10()+ 
  labs(title = 'Year: {frame_time}', x="GDP Per Capita", y= "life Expectency")+ 
  transition_time(year)+shadow_wake(wake_length = 0.1, alpha = FALSE)+ ease_aes("linear")+
  facet_wrap(~continent, nrow = 3)
AN1
animate(AN1, duration = 10, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")

#Line plot animated
p <- ggplot(airquality, aes(Day, Temp, group = Month, color = factor(Month)))+
  geom_line() + scale_color_viridis_d() + 
  labs(x = "Day of Month", y = "Temperature") +
  theme(legend.position = "top")
p
p1 <- p + transition_reveal(Day)+geom_point()+transition_reveal(Day)
animate(p1, duration = 10, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")

#Tips
install.packages("devtools")
library(devtools)
devtools::install_github('thomasp85/gganimate')

#Bar plot animated
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))

p2 <- ggplot(mean.temp, aes(Month, Temp, fill = Temp))+
  geom_col()+
  scale_fill_distiller(palette = "Reds", direction = 1)+
  theme_minimal()+
  theme(panel.grid = element_blank(),
        panel.grid.major.y = element_line(color = "white"),
        panel.ontop = TRUE)
p2  

p3 <- p2+transition_states(Month, wrap = FALSE)+
  shadow_mark()
animate(p3, duration = 10, fps = 20, width = 300, height = 300, renderer = gifski_renderer())
anim_save("output3.gif")

