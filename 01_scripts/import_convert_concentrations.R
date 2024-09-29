#this script reads in raw data and converts RFUs to concentrations using the 
#equations in the 00_rawdata Data Dictionary

library(here)
library(tidyverse)

fluoro_raw <- read_csv(here("00_rawdata", "lachertel_fluorometer_20240929.csv"))

fluoro_conc <- fluoro_raw %>% 
  mutate(chla_CONC = chla_RFU*0.0054 + 0.123) %>% 
  mutate(cyano_CONC = cyano_RFU*1.90 - 0.08)

write_csv(fluoro_conc, here("02_outdata", "lachertel_fluorometer_20240929_concentrations.csv"))
