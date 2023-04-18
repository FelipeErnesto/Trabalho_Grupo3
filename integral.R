for(f in list.files("ESTATISTICAS/MEDIANA/"))
{
    dado <- read.csv(paste0("ESTATISTICAS/MEDIANA/", f), check.names = F)
    print(f)
    sp <- splinefun(dado$wavelength, dado$nadir)
#    int <- integrate(sp, lower = min(dado$wavelength), upper = max(dado$wavelength))
    int <- integrate(sp, lower = 400, upper = 700)
    print(int)
}

#400 a 700