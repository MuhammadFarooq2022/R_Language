install.packages("tinytex")
library(tinytex)

#One way ANOVA
#ANOVA between two variable in a factor
CRD 
x <- subset(iris, iris$Species=="virginica" | iris$Species=="setosa")
model <- aov(Sepal.Length ~ Species, data = x)
summary(model)

#ANOVA
#CRD Completely randomized Design
iris
levels(iris$Species)
model <- aov(Sepal.Length ~ Species, data = iris)
summary(model)
TukeyHSD(model)

#Two way ANOVA
ToothGrowth
model3 <- aov(len ~ supp + as.factor(dose), data = ToothGrowth)
summary(model3)
TukeyHSD(model3)

library(ggplot2)
ggplot(ToothGrowth, aes(supp, len, fill=as.factor(dose)))+ geom_boxplot()

#Another way 
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(data = ToothGrowth, aes(x = dose, y = len))+
  geom_boxplot()

#use following method to plot significant levels
install.packages("ggsignif")
library(ggsignif)

ggplot(data = ToothGrowth, aes(x = dose, y = len))+
  geom_boxplot()+
  geom_signif(comparisons = list(c("0.5", "1"),
                                 c("0.5", "2"),
                                 c("1", "2")),
              map_signif_level = TRUE,
              y_position = c(30,35,40))

#barplot

ggplot(data = ToothGrowth, aes(x = dose, y = len))+
  geom_col()+
  geom_signif(comparisons = list(c("0.5", "1"),
                                 c("0.5", "2"),
                                 c("1", "2")),
              map_signif_level = TRUE,
              y_position = c(500,550,600))

p <- ggplot(data = ToothGrowth, aes(x = dose, y = len, fill = dose))+
  geom_bar(stat = "identity")+
  geom_signif(comparisons = list(c("0.5", "1"),
                                 c("0.5", "2"),
                                 c("1", "2")),
              map_signif_level = TRUE,
              y_position = c(500,550,600),
              test = "t.test")+theme_minimal()
p

#How to show statistical lettering on any plot
#1- ANOVA model
chickwts
model <- aov(weight ~ feed, data = chickwts)
tukey <- TukeyHSD(model)
tukey

#lettering file
install.packages("multcompView")
library(multcompView)
abc <- multcompLetters4(model, tukey)
abc

#calculate the mean
library(dplyr)
m1 <- group_by(chickwts, feed) %>%
  summarise(w=mean(weight),
            std = sd(weight)) %>%
  arrange(desc(w))
m1

#how to combine a column in data frame
abc <- as.data.frame.list(abc$feed)
m1$abc <- abc$Letters
m1

#barplot
p <-ggplot(m1, aes(feed, w, fill=feed))+ geom_bar(stat = "identity",
                                              show.legend = FALSE)+
  geom_errorbar(aes(ymin=w-std, ymax=w+std), width=0.25)+
  geom_text(aes(label=abc, y=w+std), vjust=-0.5)+
  theme_minimal()+
  scale_fill_manual(values = c("#FF6666",
                               "#fad026",
                               "#DC7760",
                               "#FFF200",
                               "#6c1c7B",
                               "#D9DE1F"))+ylim(0,450)  
p
library(plotly)
ggplotly(p)

#boxplot
ggplot(chickwts, aes(feed, weight, fill=feed))+ geom_boxplot()+
  geom_text(aes(label=let, y=weight), hjust=-0.5)+
  theme_minimal()+
  scale_fill_manual(values = c("#FF6666",
                               "#fad026",
                               "#DC7760",
                               "#FFF200",
                               "#6c1c7B",
                               "#D9DE1F"))+ylim(0,450)

