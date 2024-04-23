creation_Fig4 = function(bd){
  nlat2 <- as.data.frame(tapply(bd$species, bd$lat, function(x) length(unique(x))))
  colnames(nlat2) <- "Nombre_especes"
  nlat2$Latitude <- rownames(nlat2)
  nlat2 <- nlat2[, c("Latitude", "Nombre_especes")]
  
  ###EN NUMERIC
  nlat2$Latitude <- as.numeric(nlat2$Latitude)
  nlat2$Nombre_especes <- as.numeric(nlat2$Nombre_especes)
  
  
  ###MODELE LINEAIRE
  model <- lm(Nombre_especes ~ Latitude, data = nlat2)
  summary(model)
  visreg::visreg(model)
  
  ###COURBE DU MODELE
  png("Figure4.png", width=1000, height=600)
  plot(visreg::visreg(model), ylim = c(0, max(nlat2$Nombre_especes)))
  dev.off()
}
