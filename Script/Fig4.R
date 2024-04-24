creation_Fig4 <- function(bd) {
  # Calcul du nombre d'espèces uniques par latitude
  nlat2 <- as.data.frame(tapply(bd$species, bd$lat, function(x) length(unique(x))))
  colnames(nlat2) <- "Nombre_especes"
  nlat2$Latitude <- as.numeric(rownames(nlat2))
  
  # Modèle linéaire
  model <- lm(Nombre_especes ~ Latitude, data = nlat2)
  summary(model)
  
  # Visualisation du modèle
  visreg::visreg(model)
  
  # Courbe du modèle
  png("./rapport/Figure4.png", width = 1000, height = 600)
  plot(
    visreg::visreg(
      model,
      xlab = "Latitude",
      ylab = "Nombre d'espèce",
      ylim = c(0, max(nlat2$Nombre_especes)),
      main = "Nombre d'espèce en fonction de la latitude",
      cex.lab = 0.8,
      cex.axis = 0.8,
      cex.main = 1.5
    )
  )
  dev.off()
}