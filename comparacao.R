for(f in list.files("ESTATISTICAS/MEDIANA/"))
{
    mediana <- read.csv(paste0("ESTATISTICAS/MEDIANA/", f), check.names = F)
    media <- read.csv(paste0("ESTATISTICAS/MEDIA/", f), check.names = F)
    print(f)
    diff <- media - mediana
    print(apply(diff, 2, sum))
}