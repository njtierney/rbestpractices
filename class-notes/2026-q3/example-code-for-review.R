library(readr)
england_wales_names <- read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-06-16/england_wales_names.csv'
)

england_wales_names_tidy <- england_wales_names |>
  janitor::clean_names()

summary(england_wales_names)

library(visdat)

england_wales_names_tidy |> slice_sample(n = 1000) |> vis_dat()

library(naniar)

miss_var_summary(england_wales_names_tidy)

england_wales_names_tidy

england_wales_names_tidy$sex |> unique()

library(ggplot2)

ggplot(england_wales_names_tidy, aes(x = year, y = number, colour = sex)) +
  geom_line()

england_wales_names_tidy |>
  ggplot(aes(x = year, y = number, colour = sex, group = sex)) +
  geom_line()

england_wales_names_tidy |>
  filter(year == 1996) |>
  ggplot(aes(x = year, y = number, colour = sex)) +
  geom_point()

england_wales_names_tidy |>
  filter(name %in% c("Miriam", "Natalia", "Nick", "Nicholas")) |>
  ggplot(aes(x = year, y = number)) +
  geom_line() +
  facet_wrap(~name, scales = "free_y", ncol = 1)

ni_names <- read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-06-16/ni_names.csv'
)

scotland_names <- read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-06-16/scotland_names.csv'
)
