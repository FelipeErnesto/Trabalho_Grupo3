library("tidyverse")
library("ggplot2")

## Solo

rad <- read.csv("Dados/radiancia.csv")

radspec <- rad[1:19,]
radatt <- rad[21:35,]
rad <- rad[39:293,]

names(rad) <- c("wl", "a01", "a02", "a03", "a451", "a452", "a453", "a701", "a702", "a703", "a704", "a-701", "a-702", "a-703", "a-704", "a-451", "a-452", "a-453")


rad <- rad %>% pivot_longer(   cols = c("a01", "a02", "a03", "a451", "a452", "a453", "a701", "a702", "a703", "a704", "a-701", "a-702", "a-703", "a-704", "a-451", "a-452", "a-453"), 
                                        names_to = "ang",
                                        values_to = "rad")

rad$rep <- rad$ang

rad$rep <- gsub("a0", "", rad$rep)
rad$rep <- gsub("a45", "", rad$rep)
rad$rep <- gsub("a70", "", rad$rep)
rad$rep <- gsub("a-70", "", rad$rep)
rad$rep <- gsub("a-45", "", rad$rep)

rad <- rad %>% mutate(  ang = replace(ang, ang %in% c("a01", "a02", "a03"), 0),
                        ang = replace(ang, ang %in% c("a451", "a452", "a453"), 45),
                        ang = replace(ang, ang %in% c("a-451", "a-452", "a-453"), -45),
                        ang = replace(ang, ang %in% c("a701", "a702", "a703", "a704"), 70),
                        ang = replace(ang, ang %in% c("a-701", "a-702", "a-703", "a-704"), -70))

rad$wl <- as.numeric(rad$wl)
rad$ang <- as.factor(rad$ang)
rad$rad <- as.numeric(rad$rad)
rad$rep <- as.integer(rad$rep)



rad <- rad %>% group_by(ang, wl) %>% summarise(rad = median(rad))


radplot <- ggplot(data = rad)  + geom_point(aes(x = wl, y = rad, colour = ang)) + geom_function(fun=inter1) + xlim(min(rad$wl), max(750))

## Y unit: mW/(m^2 nm Sr)

### Placa 1

radp1 <- read.csv("Dados/Tabelas_limpas/placa_1_radiancia.csv")

radp1 <- radp1 %>% pivot_longer(cols = names(radp1)[-1], names_to = "ang", values_to = "rad") %>% rename(wl = CommentSub3)

radp1 <- radp1 %>% mutate(  ang = replace(ang, ang %in% c("nadir", paste0("nadir.", 1:9)), 0 ),
                            ang = replace(ang, ang %in% c("X45", paste0("X45.", 1:10)), 45 ),
                            ang = replace(ang, ang %in% c("X45.", paste0("X45..", 1:17)), -45 ),
                            ang = replace(ang, ang %in% c("X70", paste0("X70.", 1:8)), 70 ),
                            ang = replace(ang, ang %in% c("X70.", paste0("X70..", 1:8)), -70 ))

radp1$wl <- as.numeric(radp1$wl)
radp1$ang <- as.factor(radp1$ang)
radp1$rad <- as.numeric(radp1$rad)

radp1 <- radp1 %>% group_by(ang, wl) %>% summarise(rad = median(rad))


radp1plot <- ggplot(data = radp1)  + geom_point(aes(x = wl, y = rad, colour = ang))


## Placa 2

radp2 <- read.csv("Dados/Tabelas_limpas/placa_2_radianca_limpa.csv", skip=2)

radp2 <- radp2 %>% pivot_longer(cols = names(radp2)[-1], names_to = "ang", values_to = "rad") %>% rename(wl = CommentSub3)

radp2 <- radp2 %>% mutate(  ang = replace(ang, ang %in% c("X0", paste0("X0.", 1:10)), 0 ),
                            ang = replace(ang, ang %in% c("X45", paste0("X45.", 1:17)), 45 ),
                            ang = replace(ang, ang %in% c("X45.", paste0("X45..", 1:12)), -45 ),
                            ang = replace(ang, ang %in% c("X70", paste0("X70.", 1:14)), 70 ),
                            ang = replace(ang, ang %in% c("X70.", paste0("X70..", 1:8)), -70 ))

radp2$wl <- gsub(",", ".", radp2$wl)
radp2$rad <- gsub(",", ".", radp2$rad)

radp2$wl <- as.numeric(radp2$wl)
radp2$ang <- as.factor(radp2$ang)
radp2$rad <- as.numeric(radp2$rad)

#radp2 <- radp2 %>% group_by(ang, wl) %>% summarise(rad = median(rad))


radp2plot <- ggplot(data = radp2)  + geom_point(aes(x = wl, y = rad, colour = ang))
