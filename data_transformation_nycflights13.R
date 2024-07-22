## after install library, load library

library(nycflights13)
library(tidyverse)

## verify the tables
view(flights)
view(airlines)
view(planes)
view(airports)

## query - data transformation

## Number of carrier for each carrier
flights %>%
  inner_join(airlines, by = "carrier") %>% 
  count(carrier, name) %>% 
  arrange(desc(n))

## top 10 the longest distance airlines
flights %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, name, distance) %>%
  group_by(carrier, name) %>%
  summarise(all_distance = sum(distance)) %>%
  arrange(desc(all_distance)) %>%
  head(10)

## average airtime for each carrier
flights %>% 
  inner_join(airlines, by = "carrier") %>% 
  select(carrier, name, air_time) %>% 
  group_by(carrier, name) %>% 
  summarise(average_airtime = mean(air_time, na.rm = TRUE)) %>%
  arrange(desc(average_airtime))

## top ten the number of arrival time delay at the airport
flights %>% 
  inner_join(airports, by = c("dest"= "faa")) %>% 
  mutate(delay_check = ifelse(arr_delay >= 0, "delay", "not")) %>% 
  drop_na(delay_check) %>% 
  filter(delay_check == "delay") %>% 
  count(name) %>%
  arrange(desc(n)) %>%
  head(10)

## top 10 the longest distance airplane(manufacturer)
flights %>% 
  inner_join(planes, by = "tailnum" ) %>%
  select(manufacturer, distance) %>%
  group_by(manufacturer) %>%
  summarise(all_distance = sum(distance)) %>%
  arrange(desc(all_distance)) %>%
  head(10)


            