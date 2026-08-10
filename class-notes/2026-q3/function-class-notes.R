# best practices for putting functions in your script

#1. Put the function definitions at the top of the script

# water_quality_percentile_method <- function(
#   data,
#   water_column,
#   n_bacteria_ppm,
#   percentile,
#   method
# ) {
#     # ...
# }

# the issue with putting functions at the top of your script:

# 1. Sharing your functions across scripts --> If you need the same functions
# in multiple places, then you need to copy+paste functions, which means if
# there's an error, or an update to the functions, you need copy and paste them
# again. so the question is: "Will I need these functions somewhere else?"
# If the answer is "yes", functions should be in a separate script

# #2. Source functions from a central location
# e.g.,
# source("water-quality-pencentile-funs.R")
# Pros of this: easier to share across files within a project
# cons - you need to jump into that file to see the function, if you want to look at it. This is mitigated by "jump to definition" - which in Rstudio and positron is going to be "on click"
# pros outweigh the cons
# but starting wit  the functions at the top is better than definiing them
# at their use point.

# #Hazenfunction:
#Formals-percentiletouse(eg.25,50,95),andavectorofsamples,returnsthe
# percentilevalue
# hazen_apply <- function(percentile, sample_vector) {
#   sample_vector <- sort(sample_vector, decreasing = FALSE)
#   n <- length(sample_vector)
#   rank <- 0.4375 + (percentile / 100) * (n + 0.125)
#   rankint <- as.integer(rank)
#   rankmod <- rank - rankint
#   percentile_value <- 10^((1 - rankmod) *
#     log10(sample_vector[rankint]) +
#     rankmod *
#       log10(sample_vector[rankint + 1]))
#   percentile_value <- round(percentile_value)
# }

n_missing <- function(x) {
  sum(is.na(x))
}

n_missing(airquality$Ozone)
n_missing(airquality$Temp)

# Can you tell me how many complete values there are?
# This is the opposite of missing:
## how would you determine if something is present, **not** missing?

n_complete <- function(x) {
  sum(!is.na(x))
}

# ! - negation

prop_missing <- function(x, digits = 2) {
  n_mis <- n_missing(x)
  x_len <- length(x)
  prop <- n_mis / x_len
  rounded <- round(prop, digits)
  # return the last thing
  rounded
}

prop_missing(airquality$Ozone)

debugonce(prop_missing)

prop_missing(airquality$Ozone)

# extension: can you get this to work on other data?
# E.g., a data.frame? Does it work?

# can you tell me which columns contain missing values?
# Can you tell me how many complete values there are in a column?
n_missing(airquality$Ozone)
n_missing(airquality)

prop_missing(airquality$Ozone)
prop_missing(airquality)
## How to explore values inside a function?
prop
rounded

# copy the body of the function, assign the values, step through this
# like this:
# prop_missing <- function(x, digits = 2) {
prop <- n_missing(x) / length(x)
rounded <- round(prop, digits)
# return the last thing
rounded
# }
#
# Use a debugger.

# browser() is like stop sign:
prop_missing <- function(x, digits = 2) {
  n_elements <- length(is.na(x))
  prop <- n_missing(x) / n_elements
  # mean(is.na(x))
  rounded <- round(prop, digits)
  # return the last thing
  rounded
}

prop_missing(x = airquality$Ozone)
prop_missing(x = airquality)

# instead of doing browser() inside the code and running that each time

debugonce(prop_missing)

prop_missing(x = airquality)

## browser() says: STOP HERE

## debugonce says - browse this function, exactly one time

debug(prop_missing)
prop_missing(x = airquality)
# to turn off debug
undebug(prop_missing)

# so, debugonce() is the "safer" version of debug/undebug.

# x <- airquality$Ozone
# prop <- n_missing(x) / length(x)
# rounded <- round(prop, digits)
# # return the last thing
# rounded
