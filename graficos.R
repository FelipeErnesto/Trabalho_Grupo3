library("tidyverse")
library("ggplot2")

irrad_ep1_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 1 - Irradianca_escalar DURANTE A PLACA _ 14-25_14-29.csv", check.names=F)
irrad_ep1 <- irrad_ep1_pre
irrad_ep1 <- irrad_ep1 %>% pivot_longer(cols = names(irrad_ep1)[-1], names_to = "ang", values_to = "rad")
irrad_ep1_plot <- ggplot(data = irrad_ep1)  + geom_point(aes(x = wavelength, y = rad, colour = ang))

irrad_pp1_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 1 - Irradianca_planar DURANTE A PLACA _ 14-25_14-29.csv", check.names=F)
irrad_pp1 <- irrad_pp1_pre
irrad_pp1 <- irrad_pp1 %>% pivot_longer(cols = names(irrad_pp1)[-1], names_to = "ang", values_to = "rad")
irrad_pp1_plot <- ggplot(data = irrad_pp1)  + geom_point(aes(x = wavelength, y = rad, colour = ang))

radp1_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 1 - Radiancia PLACA _ 14-25_14-29.csv", check.names=F)
radp1 <- radp1_pre
radp1 <- radp1 %>% pivot_longer(cols = names(radp1)[-1], names_to = "ang", values_to = "rad")
radp1_plot <- ggplot(data = radp1)  + geom_point(aes(x = wavelength, y = rad, colour = ang))


irrad_ep2_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 2 - Irradiancia escalar DURANTE A PLACA _ 14-52_14-57.csv", check.names=F)
irrad_ep2 <- irrad_ep2_pre
irrad_ep2 <- irrad_ep2 %>% pivot_longer(cols = names(irrad_ep2)[-1], names_to = "ang", values_to = "rad")
irrad_ep2_plot <- ggplot(data = irrad_ep2)  + geom_point(aes(x = wavelength, y = rad, colour = ang))

irrad_pp2_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 2 - Irradiancia planar DURANTE A PLACA _ 14-52_14-57.csv", check.names=F)
irrad_pp2 <- irrad_pp2_pre
irrad_pp2 <- irrad_pp2 %>% pivot_longer(cols = names(irrad_pp2)[-1], names_to = "ang", values_to = "rad")
irrad_pp2_plot <- ggplot(data = irrad_pp2)  + geom_point(aes(x = wavelength, y = rad, colour = ang))

radp2_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 2 - Radiancia PLACA _ 14-52_14-57.csv", check.names=F)
radp2 <- radp2_pre
radp2 <- radp2 %>% pivot_longer(cols = names(radp2)[-1], names_to = "ang", values_to = "rad")
radp2_plot <- ggplot(data = radp2)  + geom_point(aes(x = wavelength, y = rad, colour = ang))


irrad_es_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 2 - Irradiancia_escalar DURANTE O SOLO_15_06-15_09.csv", check.names=F)
irrad_es <- irrad_es_pre
irrad_es <- irrad_es %>% pivot_longer(cols = names(irrad_es)[-1], names_to = "ang", values_to = "rad")
irrad_es_plot <- ggplot(data = irrad_es)  + geom_point(aes(x = wavelength, y = rad, colour = ang))

irrad_ps_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 2 - Irradiancia_planar DURANTE O SOLO _ 15_06-15_09.csv", check.names=F)
irrad_ps <- irrad_ps_pre
irrad_ps <- irrad_ps %>% pivot_longer(cols = names(irrad_ps)[-1], names_to = "ang", values_to = "rad")
irrad_ps_plot <- ggplot(data = irrad_ps)  + geom_point(aes(x = wavelength, y = rad, colour = ang))

rads_pre <- read.csv("PLANILHAS INTERPOLADAS/GRUPO 2 - Radiancia SOLO _ 15-06_15_09.csv", check.names=F)
rads <- rads_pre
rads <- rads %>% pivot_longer(cols = names(rads)[-1], names_to = "ang", values_to = "rad")
rads_plot <- ggplot(data = rads)  + geom_point(aes(x = wavelength, y = rad, colour = ang))