# Prerequisite stuff
library(tidyverse)
library(ggthemes)
library(modeldata)

theme_set(theme_minimal(base_size = 12))

combine <- read_csv("data/clean_combine.csv")

glimpse(combine)

condensed_combine <- combine %>%
  mutate(position = fct_collapse(position,
                                 "S" = c("FS", "SS"),
                                 "LB" = c("OLB", "ILB"),
                                 "DT" = c("DT", "NT")
  ))

# How I accomplished what I wanted to do.

bench_avg <- function(yr) {
  benches <- condensed_combine %>%
    filter(bench > 0 & year == yr) %>%
    select(year, bench, position)
  return(benches)
}

plot_bench_avg <- function(yr) {
  plot(bench_year_averages %>%
         filter(bench > 0 & year == yr) %>%
         ggplot(aes(x = bench)) +
         geom_bar())
}

bench_year_averages <- data.frame(year=NA, avg=NA)

bench_year_averages

for(year in 1999:2015) {
  row <- c(year, mean(bench_avg(year)$bench))
  bench_year_averages <- rbind(bench_year_averages, row)
  
}

bench_year_averages %>%
  ggplot(aes(x = year, y = avg)) +
  geom_point()