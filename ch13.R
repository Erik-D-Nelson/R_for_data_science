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
Lahman::Batting %>% 
  count(playerID, yearID, stint, teamID, lgID) %>%
  filter(n > 1)
  
#13.4 example
flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2
flights2 %>%
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")

#13.4.5 example
flights_plus_weather <- flights2 %>% 
  left_join(weather)
flights_plus_weather

#13.4.5 example 2
flights_plus_plane_information <- flights2 %>% 
  left_join(planes, by = "tailnum")
flights_plus_plane_information

#13.4.5 example 3
flights2 %>% 
  left_join(airports, c("dest" = "faa"))

#13.4.6.1
airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()
flights %>%
  group_by(dest) %>%
  summarise(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(airports, by = c('dest' = 'faa')) %>%
  ggplot(aes(x = lon, y = lat, size = avg_arr_delay, color = avg_arr_delay)) +
  borders('state') +
  geom_point() +
  coord_quickmap()

