creation_Fig3 = function(bd){
###BD NB OBS PAR LATITUDE
obsl2 <- as.data.frame(tapply(bd$species, bd$lat, function(x) length(x)))
colnames(obsl2) <- "Nombre_observations"
obsl2$Latitude <- rownames(obsl2)

###EN NUMERIC
obsl2$Latitude <- as.numeric(obsl2$Latitude)
obsl2$Nombre_observations <- as.numeric(obsl2$Nombre_observations)
summary(obsl2)

###MODELE LINEAIRE
model2 <- lm(Nombre_observations ~ Latitude, data = obsl2)
summary(model2)
visreg::visreg(model2)

###COURBE DU MODELE
plot(visreg::visreg(model2), ylim = c(0, max(obsl2$Nombre_observations)))
png("./Figures/Fig3.png")
###BARPLOT OBS EN FCT DE LAT
barplot(obsl2$Nombre_observations, 
        names.arg = obsl2$Latitude,
        main = "Nombre d'observations par latitude", 
        xlab = "Latitude", 
        ylab = "Nombre d'observation",
        col = "skyblue",
        ylim = c(0, max(obsl2$Nombre_observations) + 1),
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés
dev.off()
}
