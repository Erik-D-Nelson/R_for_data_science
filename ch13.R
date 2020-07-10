library(tidyverse)
library(nycflights13)

#question13.2.1
colnames(airports)

#question13.2.2
colnames(airports)
colnames(weather)

#question13.3.1
flights %>%
  mutate(index_number = row_number()) %>%
  select(index_number, everything())

#question13.3.2
