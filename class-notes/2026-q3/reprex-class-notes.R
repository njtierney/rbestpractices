# reprexes
# **repr**oducible
# **ex**amples

mean(airquality$Ozone)

data_raw <- read_csv("....")

## 100 lines earlier you did this ^^

## Let's share the one line of code
library(reprex)

# running inline
# reprex(mean(airquality$Ozone), session_info = TRUE)

# using curly braces
# reprex(
# curly brances for multiple lines of code
# {
library(ggplot2)
ggplot(penguins, aes(x = flipper_len, y = bill_len, colour = species)) +
  geom_point() +
  # colour blind safe, and also, pretty.
  scale_colour_brewer(palette = "Dark2") +
  labs(
    x = "Flipper Length (mm)",
    y = "Bill length (mm)",
    colour = "Species",
    title = "Penguin measurements of Palmer station, Antarctica",
    caption = "Data collected by Gorman et al., 2014"
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom"
  )
# }
# )

# Your turn phase: get reprex into a keyboard shortcut
# command pallete: search "modify keyboard shortcuts"
# or - tools >> modify keyboard shortcuts

mean(airquality$Ozone)
