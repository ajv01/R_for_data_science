library(tidyverse)
data <- read_csv("../R_for_data_science/data_files/vaccination_willingness.csv") %>% 
    rename(country = X.1, 
           August = "Total Agree - August 2020",
           October = "Total Agree - October 2020")

# Transforming from wide format to long format
# method 1
data %>% 
    pivot_longer(cols = -country, names_to = "month", values_to = "percentages")

# method 2
data <- data %>% gather(month, percentages, 2:3)

data %>% 
    ggplot(mapping = aes(x = percentages, y = country, color = month)) +
    geom_line(color = "black") +
    geom_point() +
    geom_label(mapping = aes(label = percentages))

    

ggsave("dumbell_graph.tiff", width = 6, height = 4)
