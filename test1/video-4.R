library(readxl)
my_data <- read_excel("data.xlsx", sheet = "data", 
                      col_types = c("text", "numeric", "numeric"))
View(my_data)

boxplot(my_data$Height~my_data$Crop)

# labeling
boxplot(Height~Crop, data = my_data)

boxplot(Height~Crop, data = my_data, main='Boxplot of Experiment',
        xlab = "Crop Type", ylab = "Plant Height(cm)")

# coloring
boxplot(Height~Crop, data = my_data, main='Boxplot of Experiment',
        xlab = "Crop Type", ylab = "Plant Height(cm)", col="#32a8a2",
        border = "#3a32a8")

# grouping of treatment
library(readxl)
my_data2 <- read_excel("data.xlsx", sheet = "data2", 
                       col_types = c("text", "numeric", "numeric", 
                                     "text"))
View(my_data2)
my_data2$Crop <- factor(my_data2$Crop, levels = c('Wheat','Maize',
                                                  'Rice','Potato'))
boxplot(my_data2$Height ~ my_data2$Crop * my_data2$water,
        main='Boxplot of Experiment')
