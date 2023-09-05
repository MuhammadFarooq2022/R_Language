#install packages
install.packages("ggplot2")
install.packages("ggpval")
install.packages("ggthemes")

#load packages
library(ggplot2)
library(ggpval)
library(ggthemes)

#draw a plot
data("ToothGrowth")

p <- ggplot(ToothGrowth)+
  aes(x = supp, y= len, fill = supp)+
  geom_boxplot(shape="circle", width=0.5)+
  stat_boxplot(geom ="errorbar", width= 0.1)+
  scale_fill_viridis_d(option = "inferno", direction = 1)+
  labs(x="Supplement", y="Length", fill = "Supplement")+
  ggthemes::theme_par()+
  facet_wrap(vars(dose));p

#add p_value
add_pval(p, pairs = list(c(1,2)), test="t.test")
help("add_pval")
