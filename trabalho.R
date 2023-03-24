library("tidyverse")

rad <- read.csv("Dados/radiancia.csv")

radspec <- rad[1:19,]
radatt <- rad[21:35,]
raddata <- rad[39,293,]

names(raddata) <- c("wl", "a01", "a02", "a03", "a451", "a452", "a453", "a701", "a702", "a703", "a704", "a-701", "a-702", "a-703", "a-704", "a-451", "a-452", "a-453")


raddata2 <- raddata %>% pivot_longer(   cols = c("a01", "a02", "a03", "a451", "a452", "a453", "a701", "a702", "a703", "a704", "a-701", "a-702", "a-703", "a-704", "a-451", "a-452", "a-453"), 
                                        names_to = "ang",
                                        values_to = "rad")


raddata2 <- raddata2 %>% mutate(ang = replace(ang, ang%in% c("a01", "a02", "a03"), 0),
                                ang = replace(ang, ang%in% c("a451", "a452", "a453"), 45),
                                ang = replace(ang, ang%in% c("a-451", "a-452", "a-453"), -45),
                                ang = replace(ang, ang%in% c("a701", "a702", "a703", "a704"), 70),
                                ang = replace(ang, ang%in% c("a-701", "a-702", "a-703", "a-704"), -70))