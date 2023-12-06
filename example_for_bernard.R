library(tidyverse)
library(tidymodels)
library(ggpubr)
library(ggokabeito)

theme_set(theme_minimal(base_size = 13))

plot_island <- function(island_name){
  penguins %>%
    filter(island == island_name) %>%
    ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
    geom_point() +
    scale_color_okabe_ito() +
    labs(title = island_name)
}

islands <- unique(penguins$island)

plot_list <- map(islands, plot_island)

ggarrange(plotlist = plot_list, ncol = 2, nrow = 2)
