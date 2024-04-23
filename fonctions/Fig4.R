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
  plot(visreg::visreg(model,
                      xlab="Latitude",
                      ylab="Nombre d'espèce",
                      ylim = c(0, max(nlat2$Nombre_especes)),
                      main=("Nombre d'espèce en fonction de la latitude"),
                      cex.lab=0.8,
                      cex.axis=0.8,
                      cex.main=1.5))
  
  r_squared <- summary(model)$r.squared
  
  # Add R-squared to the plot
  text(x = mean(nlat2$Latitude), y = max(nlat2$Nombre_especes), labels = sprintf("R^2 = %.2f", r_squared), pos = 4, col = "blue", cex = 1.5)
  dev.off()
}
