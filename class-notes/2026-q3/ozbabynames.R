## Exploring ozbabynames error?
library(ozbabynames)
library(tidyverse)

# View(ozbabynames)

# Gives error: r error 4 (Error in nchar(col, type = "width") : invalid multibyte string, element 19070 )

# what is element 19070?

# how many rows/cols?
dim(ozbabynames)

# can we go to row 19070?
ozbabynames |>
  slice(19070)

# shtrange name here
chloe <- ozbabynames |>
  slice(19070) |>
  pull(name)

# other names with `\`` in them?

ozbabynames$name |> str_subset(".e$") |> head()

ozbabynames$name |>
  str_detect("\\\\x") |>
  which()

chloe
# stringr
stringr::str_detect("Chlo\xc9", "\\\\")
stringr::str_detect("Chlo\xc9", r"(\\)")
stringr::str_detect("Chlo\xc9", r"(\\\\)")
stringr::str_detect("Chlo\xc9", "\\\\x")
stringr::str_detect("Chlo\xc9", "\\\\x")

# Claude to the rescue
validUTF8("Chlo\xc9")

ozbaby_valid_names <- ozbabynames |>
  mutate(
    valid_name = validUTF8(name),
    not_valid_name = !valid_name
  )

# show the data
ozbaby_valid_names

ozbaby_valid_names |>
  filter(not_valid_name)

# If I cat() this, it makes R crash on a reprex
# cat(chloe)

cat("Some\ntext\nwith\nnewlines")
