## -- your turn: help me cut this code down.
library(tidyverse)

head(diamonds)

diamonds |>
  mutate(
    price_per_carat = price / carat
  ) |>
  group_by(cut) |>
  summarise(
    price_mean = mean(price_per_carat),
    price_sd = sd(price_per_carat),
    mean_colour = mean(color)
  )

# how do we reduce the lines of code to give the same warning message
diamonds |>
  group_by(cut) |>
  summarise(
    mean_colour = mean(color)
  )

# can we make it smaller?
diamonds |>
  summarise(
    mean_colour = mean(color)
  )

mean(diamonds$color)

head(diamonds$color)
