#Title: "7 Step guide to make Publication Ready Bar graphs from Scratch"
# Install these packages and load them:

install.packages("multcompView")
install.packages("dplyr")

library(ggplot2)
library(ggthemes)
library(multcompView)
library(dplyr)

#1- Load or import your data
data("chickwts")
tibble(chickwts) #tibble is a function of dplyr package

# 2- Calculate *means* of you treatment groups and the *standard deviation* SD to show on error bars as follows:
mean_data <- group_by(chickwts, feed) %>% #feed is our treatment in this example
  summarise(weight_mean=mean(weight), sd = sd(weight)) %>% #to calculate mean and SD
  arrange(desc(weight_mean)) #to arrange in descending order
tibble(mean_data)

# 3- This step involves performing analysis of variance *ANOVA*, using built in **aov()** function.
library(stats)
anova <- aov(weight ~ feed, data = chickwts)
summary(anova)

# 4- If the ANOVA is significantly different then, we will draw a multiple mean comparison test (TUKEY HSD, LSD, or Duncan Multiple Range) on *anova* object from previous step.
tukey <- TukeyHSD(anova)
tukey

# 5- Draw multiple comparison letters using *multcomp* R package as follows:
group_letters <- multcompLetters4(anova, tukey)
group_letters
#extracting group letters
group_letters <- as.data.frame.list(group_letters$feed)
#adding to the mean_data
mean_data$group_letters <- group_letters$Letters
tibble(mean_data)

# 6- Drawing the *publication ready Barplot* in ggplot2
p <- ggplot(mean_data, aes(x = feed, y = weight_mean)) +
  geom_bar(stat = "identity", aes(fill = feed), show.legend = FALSE, width = 0.6) + #barplot
  geom_errorbar( #this argument is putting sd as error bars
    aes(ymin = weight_mean-sd, ymax=weight_mean+sd), 
    width = 0.1
  ) + 
  geom_text(aes(label = group_letters, y = weight_mean + sd), vjust=-0.4) + #add letters
  scale_fill_brewer(palette = "BrBG", direction = 1) + #theme setting
  labs(#this will add labels 
    x = "Feed Type",
    y = "Chicken Weight (g)",
    title = "Publication Ready Barplot",
    subtitle = "Made by #RwithAammar",
    fill = "Feed Type"
  ) +
  ylim(0,410)+ #change your yaxis limits based on the letters
  ggthemes::theme_par(); p

# 7- Saving upto 4K barplots in R
tiff('Barplot.tiff', units="in", width=10, height=6, res=300, compression = 'lzw')
p
dev.off()
