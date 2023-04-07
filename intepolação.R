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

    write.csv(inter, paste0("PLANILHAS INTERPOLADAS/", f))    
}