library(tidyverse)
library(ggplot2)
library(gridExtra)
library(ggpubr)

theme_set(theme_bw())

#Read in concentration data
fluoro_conc <- read_csv(here("02_outdata", "lachertel_fluorometer_20240929_concentrations.csv"))

#Calculate mean and SD for chlorophyll and cyanobacteria
fluoro_conc_avg <- fluoro_conc %>% 
  drop_na %>% 
  group_by(depth_m) %>% 
  summarize(chla_mean = mean(chla_CONC), chla_sd = sd(chla_CONC),
            cyano_mean = mean(cyano_CONC), cyano_sd = sd(cyano_CONC))

#Plot chla and cyano and arrange an output plot
chla <- ggplot(data = fluoro_conc_avg, aes(x = chla_mean, y = depth_m)) +
  geom_path(colour = 'forestgreen') +
  geom_point(colour = 'forestgreen') +
  geom_linerange(aes(xmin = chla_mean - chla_sd, xmax = chla_mean + chla_sd), colour = 'forestgreen') +
  scale_y_reverse() +
  labs(x = 'Chlorophyll a (mg/L)', y = 'Depth (m)')

cyano <- ggplot(data = fluoro_conc_avg, aes(x = cyano_mean, y = depth_m)) +
  geom_path(colour = 'blue') +
  geom_point(colour = 'blue') +
  geom_linerange(aes(xmin = cyano_mean - cyano_sd, xmax = cyano_mean + cyano_sd), colour = 'blue') +
  scale_y_reverse() +
  labs(x = 'Cyanobacteria (ug/L)', y = '')

ggarrange(chla, cyano) +
  labs(title = 'Lac Hertel Pigment Concentrations - September 28, 2024')
