# ANOVA

# Import Dataset

install.packages("palmerpenguins")
library(palmerpenguins)

df <- penguins
colnames(df)

# Finding unique values

unique(df$species)
unique(df$island)

# t-test
t.test(df$bill_length_mm ~ df$sex)

library(tidyverse)

ggplot(df, aes(sex, bill_length_mm, fill=sex)) + geom_boxplot()

data <- df %>%
  select(species, flipper_length_mm) %>%
  drop_na()

# Summary
summary(data)

data %>%
  group_by(species) %>%
  summarise(mean(flipper_length_mm))

ggplot(data) +
  aes(species, flipper_length_mm, col=species) +
  geom_jitter() + theme(legend.position = "none")

# Normal distribution

data %>%
  group_by(species) %>%
  summarise(shapiro_pvalue = shapiro.test(flipper_length_mm) $ p.value)

s_w <- shapiro.test(data$flipper_length_mm)
summary(s_w)

# Anova

# Normal
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)

hist(res_aov$residuals)
qqnorm(res_aov$residuals)

shapiro.test(res_aov$residuals)

# Homogeneous

install.packages("car")
library(car)

leveneTest(flipper_length_mm ~ species,data = data)

install.packages("lattice")
library(lattice)

dotplot(flipper_length_mm ~ species, data = data)

ggplot(data) +
  aes(species, flipper_length_mm, fill = species) +
  geom_boxplot()

# Calculate mean and sd for plots and AOV figures
aggregate(flipper_length_mm ~ species, data = data,
          function(x) round(c(mean = mean(x), sd = sd(x)), 2))

# Another way
df1 <- group_by(data, species) %>%
  summarise(
    mean = mean(flipper_length_mm, na.rm = TRUE),
    sd = sd(flipper_length_mm, na.rm = TRUE))
df1

# ANOVA (aik tariqa)
oneway.test(flipper_length_mm ~ species, data = data, var.equal = TRUE)
oneway.test(flipper_length_mm ~ species, data = data, var.equal = FALSE)

# ANOVA (dosra tariqa)
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)

# PostHOC Test
install.packages("multcomp", dependencies = TRUE)
library(multcomp)

# TukeyHSD
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
post_test <- glht(res_aov,
                  linfct = mcp(species = "Tukey"))
summary(post_test)

plot(post_test)

plot(TukeyHSD(res_aov))

# Dunnet test
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
dun <- glht(res_aov,
                  linfct = mcp(species = "Dunnet"))
summary(dun)

# Tow way ANOVA
install.packages("multcompView")
library(ggthemes)
library(tidyverse)
library(multcompView)

df <- ToothGrowth
df$dose <- as.factor(df$dose)

# Calculate two way ANOVA
anova <-aov(len ~ supp*dose, data = df)
summary(anova)

# Tukey HSD
tukey <- TukeyHSD(anova)
tukey

# Lettering nikalna
letters <- multcompLetters4(anova, tukey)
letters

# Convert them into a dataframe
letters <- data.frame(letters$'supp:dose'$Letters)
letters

# Mean and sd
df_mean <- df %>%
  group_by(supp, dose) %>% 
  summarise(len_mean = mean(len), sd = sd(len)) %>% 
  arrange(desc(len_mean))
df

tibble(df_mean)

# letters
df_mean$letters <- letters$letters..supp.dose..Letters
df_mean

# Plot
p <- ggplot(df_mean) +
  aes(dose, len_mean, group = supp, fill = supp) +
  geom_bar(stat = 'identity', position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin = len_mean-sd, ymax = len_mean+sd), width = 0.1,
                    position = position_dodge(0.9)) +
  geom_text(aes(label = letters, y = len_mean+sd), vjust = -0.4,
            position = position_dodge(0.9)) +
  scale_fill_manual(values = c("blue", "red")) +
  labs(x= "Dose", y="Length (mm)", 
       title = "Tooth Growth Publication Ready Plot",
       fill = "Supplement");p
ggsave("Plot.pdf", p, width = 10, height = 8, units = "in")
