#load packages
library(tidyverse) # forcats gets loaded with tidyverse
library(modeldata) # contains example data, including ames

# the Lot_Shape variable has 4 levels
table(ames$Lot_Shape)

# let's combine the levels to only have two
ames <- ames %>%
  mutate(Lot_Shape = fct_collapse(Lot_Shape,
                                  "Regular" = c("Regular", "Slightly_Irregular"),
                                  "Irregular" = c("Moderately_Irregular", "Irregular")))


# now we have only two levels
table(ames$Lot_Shape)
