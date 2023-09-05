# Import the packages----
library(readxl)
library(ggplot2)
library(plotly)
library(tidyverse)
library(bestNormalize)
library(ggthemes)
library(ggpubr)
library(multcompView)
library(skimr)
# Import the dataset----
data("diamonds")
titanic <- read.csv("https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/problem12.html")

# Explore the dataset----
summary(diamonds)
str(diamonds)
# Changed the name to df
df <- diamonds
# Separate the categorical and numerical variable 
df_cat <- df %>% select_if(is.factor) %>%  as.data.frame()
df_num <- df %>% select_if(is.numeric) %>%  as.data.frame()

# Simple having a glimpse of data can help us as well
glimpse(df)
head(df)

# Ploting to have an idea about this data
ggplot(df, aes(x=carat)) + geom_histogram()
ggplot(df, aes(x=price)) + geom_histogram()

# Scatterplot
ggplot(df, aes(x=carat, y=price)) + 
  geom_point() + geom_smooth()

cor(df$carat, df$price, method = 'pearson')
cor(df$carat, df$price, method = 'spearman')

# What if the price of diamond depends on cut ?
ggplot(df, aes(y=carat, x=price, color=cut)) + 
  geom_point() + geom_smooth() +
  facet_wrap(~cut, ncol = 5)

ggplot(df, aes(x=cut, fill=cut)) +
  geom_bar()

df_summary <- df %>% 
                  group_by(cut) %>% 
                  summarize(mean_price = mean(price), sd_price = sd(price),
                            min=min(price), max=max(price))

ggplot(df_summary, aes(x=cut, y=mean_price, fill=cut)) +
  geom_bar(stat = "identity") +
  geom_errorbar(ymin=df_summary$mean_price - df_summary$sd_price, ymax=df_summary$mean_price + df_summary$sd_price)

# Summary statistics calculation
df1 <- df
# normalize the data and then plot again
df1$price <- log10(df$price)
df_summary <- df1 %>% 
  group_by(cut) %>% 
  summarize(mean_price = mean(price),
            sd = sd(price),
            min = min(price),
            max = max(price))

# bar plot and error bar plot with log10 scale
ggplot(df_summary, aes(x=cut, y=mean_price, fill=cut)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_price - sd, ymax = mean_price + sd), width = 0.2) +
  scale_y_continuous(name = "Mean Price (log10 scale)", breaks = scales::pretty_breaks())

df_summary <- df1 %>% 
  group_by(cut) %>% 
  summarize(mean_price = mean(price),
            sd = sd(log10(price)),
            min = min(log10(price)),
            max = max(log10(price))) %>% 
arrange(desc(mean_price))

# Visualization did not provide any specific information about the mean difference among cut variable value,
# Therefore, we will be using ANOVA test to find the differences.

anova <- aov(price ~ cut, data=df)
summary(anova) # if p < 0.05 then we will proceed for posthoc tests.
TukeyHSD(anova)

# Simple anova to show on box plot
ggplot(diamonds, aes(x = cut, y=price, fill=cut)) +
  geom_boxplot() +
  stat_compare_means(method =  "anova", label = "p.format", hide.ns = TRUE)

# One way ANOVA with lettering----
df_summary <- df %>% 
  group_by(cut) %>% 
  summarize(mean_price = mean(price),
            sd = sd(price),
            min = min(price),
            max = max(price)) %>% 
arrange(desc(mean_price))

anova <- aov(price ~ cut, data=df)
summary(anova) # if p < 0.05 then we will proceed for posthoc tests.
tukey <- TukeyHSD(anova)
tukey
group_letter <- multcompLetters4(anova, tukey)
group_letter 
group_letter <- as.data.frame.list(group_letter$cut)  
df_summary$group_letter <- group_letter$Letters

ggplot(df_summary, aes(x = cut, y = mean_price, fill = cut)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_price - sd, ymax = mean_price + sd), width = 0.2) +
  scale_y_continuous(name = "Mean Price (log10 scale)", breaks = scales::pretty_breaks()) +
  geom_text(aes(label = group_letter, y = mean_price + sd, size = 0.5), vjust = -0.4)

# Load the  sunburst R package example----
library(plotly)

d <- data.frame(
  ids = c(
    "North America", "Europe", "Australia", "North America - Football", "Soccer",
    "North America - Rugby", "Europe - Football", "Rugby",
    "Europe - American Football","Australia - Football", "Association",
    "Australian Rules", "Autstralia - American Football", "Australia - Rugby",
    "Rugby League", "Rugby Union"
  ),
  labels = c(
    "North<br>America", "Europe", "Australia", "Football", "Soccer", "Rugby",
    "Football", "Rugby", "American<br>Football", "Football", "Association",
    "Australian<br>Rules", "American<br>Football", "Rugby", "Rugby<br>League",
    "Rugby<br>Union"
  ),
  parents = c(
    "", "", "", "North America", "North America", "North America", "Europe",
    "Europe", "Europe","Australia", "Australia - Football", "Australia - Football",
    "Australia - Football", "Australia - Football", "Australia - Rugby",
    "Australia - Rugby"
  ),
  stringsAsFactors = FALSE
)

fig <- plot_ly(d, ids = ~ids, labels = ~labels, parents = ~parents, type = 'sunburst')

fig


# skimr package for EDA ----
df <- diamonds
skim(df) %>% summary()

df %>% group_by(cut) %>% skim()

