library("tidyverse")

for(f in list.files("PLANILHAS LIMPAS"))
{
    print(f)
    dado <- read.csv(paste0("PLANILHAS LIMPAS/", f), check.names=F)

    inter <- data.frame(matrix(ncol = ncol(dado), nrow = 0))
    names(inter) <- names(dado)
    for(i in 319:952)
    {
        linha <- data.frame(matrix(ncol = ncol(dado), nrow = 1))
        names(linha) <- names(dado)
        linha$wavelength[1] <- i
        for(j in 2:ncol(dado))
        {
            sp <- splinefun(dado$wavelength, dado[,j])
            linha[1,j] <- sp(i)
        }
        inter <- rbind(inter, linha)
    }

    write.csv(inter, paste0("PLANILHAS INTERPOLADAS/", f), row.names = F)
    
    dfmedia <- data.frame(wavelength = inter$wavelength, nadir = NA, "45" = NA, "70" = NA, "-70" = NA, "-45" = NA, check.names=F)
    dfmediana <- data.frame(wavelength = inter$wavelength, nadir = NA, "45" = NA, "70" = NA, "-70" = NA, "-45" = NA, check.names=F)
    dfdesvio <- data.frame(wavelength = inter$wavelength, nadir = NA, "45" = NA, "70" = NA, "-70" = NA, "-45" = NA, check.names=F)
    for(ang in c("nadir", "45", "70", "-45", "-70"))
    {
        stat <- inter[names(inter)==ang]
        media <- apply(stat, 1, mean)
        mediana <- apply(stat, 1, median)
        desvio <- apply(stat, 1, sd)
        
        dfmedia[ang] <- media
        dfmediana[ang] <- mediana
        dfdesvio[ang] <- desvio
    }
    write.csv(dfmedia, paste0("ESTATISTICAS/MEDIA/", f), row.names = F)
    write.csv(dfmediana, paste0("ESTATISTICAS/MEDIANA/", f), row.names = F)
    write.csv(dfdesvio, paste0("ESTATISTICAS/DESVIO/", f), row.names = F)
}