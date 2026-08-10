## -------------------------------------------------------------------------------------------
#| output: false
#| echo: false
library(dplyr)


## -------------------------------------------------------------------------------------------
library(dplyr)
adelie_mean <- penguins |>
  filter(species == "Adelie") |>
  pull(body_mass) |>
  mean(na.rm = TRUE)
gentoo_mean <- penguins |>
  filter(species == "Gentoo") |>
  pull(body_mass) |>
  mean(na.rm = TRUE)
chinstrap_mean <- penguins |>
  filter(species == "Chinstrap") |>
  pull(body_mass) |>
  mean(na.rm = TRUE)


## -------------------------------------------------------------------------------------------
#| eval: false
# filter(species == "Adelie")
# filter(species == "Gentoo")
# filter(species == "Chinstrap")


## -------------------------------------------------------------------------------------------
species_body_mass_mean <- function(species_name){
  penguins |> 
    filter(species == species_name) |> 
    pull(body_mass) |> 
    mean(na.rm = TRUE)
}
adelie_mean
species_body_mass_mean("Adelie")

gentoo_mean
species_body_mass_mean("Gentoo")

chinstrap_mean
species_body_mass_mean("Chinstrap")


## -------------------------------------------------------------------------------------------
head(penguins)


## -------------------------------------------------------------------------------------------
bill_len <- penguins$bill_len
bill_dep <- penguins$bill_dep

bill_len_0 <- (bill_len - mean(bill_len, na.rm = TRUE)) / sd(bill_len, na.rm = TRUE)
bill_dep_0 <- (bill_dep - mean(bill_dep, na.rm = TRUE)) / sd(bill_len, na.rm = TRUE)


## -------------------------------------------------------------------------------------------
n_missing <- function(x) {
  sum(is.na(x))
}

n_missing(airquality$Ozone)


## -------------------------------------------------------------------------------------------
prop_missing <- function(x, digits = 2) {
  prop <- n_missing(x) / length(x)
  round(prop, digits)
}

prop_missing(airquality$Ozone)


## -------------------------------------------------------------------------------------------
library(purrr)

map_int(airquality, n_missing)


## -------------------------------------------------------------------------------------------
n_complete <- function(x) {
  sum(!is.na(x))
}

summarise_columns <- function(data, f) {
  map_dbl(data, f)
}

summarise_columns(airquality, n_complete)


## -------------------------------------------------------------------------------------------
bmi <- function(weight_kg, height_m) {
  weight_kg / height_m^2
}


## -------------------------------------------------------------------------------------------
bmi(weight_kg = 70, height_m = 1.75)


## -------------------------------------------------------------------------------------------
grams_to_kg <- function(grams) {
  grams / 1000
}
library(dplyr)
penguins |> 
  mutate(body_mass_kg = grams_to_kg(body_mass),
         .after = body_mass) |> 
  head()



## -------------------------------------------------------------------------------------------
n_complete <- function(x) {
  sum(!is.na(x))
}

n_complete(airquality$Ozone)


## -------------------------------------------------------------------------------------------
prop_missing <- function(x, digits = 2) {
  prop <- n_missing(x) / length(x)
  round(prop, digits)
}

prop_missing(airquality$Ozone)


## -------------------------------------------------------------------------------------------
prop


## -------------------------------------------------------------------------------------------
# prop_missing <- function(x, digits = 2) {
n_missing <- function(x) sum(is.na(x))

x <- airquality$Ozone
digits <- 2
prop <-  n_missing(x) / length(x)

round(prop, digits)
# }
# prop_missing(airquality$Ozone)


## -------------------------------------------------------------------------------------------
n_missing <- function(x) {
  sum(is.na(x))
}

prop_missing <- function(x, digits = 2) {
  prop <- n_missing(x) / length(x)
  round(prop, digits)
}


## -------------------------------------------------------------------------------------------
n_missing <- function(x) {
  sum(is.na(x))
}

prop_missing <- function(x, digits = 2) {
  prop <- n_missing(x) / length(x)
  round(prop, digits)
}

prop_missing(airquality$Ozone)
prop_missing(airquality)


## -------------------------------------------------------------------------------------------
n_missing <- function(x) {
  sum(is.na(x))
}

n_complete <- function(x) {
  sum(!is.na(x))
}

prop_missing <- function(x, digits = 2) {
  prop <- n_missing(x) / length(x)
  round(prop, digits)
}

