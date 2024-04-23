setwd("C:/Users/wegen/Desktop/Atelier2")
bd <- read.table("bd.txt")

###BD NB ESP PAR SITE
nsite2 <- as.data.frame(tapply(bd$species, bd$site_id, function(x) length(unique(x))))
colnames(nsite2) <- "Nombre_especes"
nsite2$site_id <- rownames(nsite2)

###EN NUMERIC
nsite2$site_id <- as.numeric(nsite2$site_id)
nsite2$Nombre_especes <- as.numeric(nsite2$Nombre_especes)
summary(nsite2)


palette <- rainbow(200)
###BARPLOT ESP EN FCT DE SITE
barplot(nsite2$Nombre_especes, 
        names.arg = nsite2$site_id,
        main = "Nombre d'espèces par site", 
        xlab = "Site", 
        ylab = "Nombre d'espèces",
        col = palette,
        ylim = c(0, max(nsite2$Nombre_especes) + 1),
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés

#plot(nsite2$Nombre_especes,col=palette,pch = 17)
#lines(nsite2$Nombre_especes, type = "h", col = palette)


###BD NB ESP PAR LATITUDE
nlat2 <- as.data.frame(tapply(bd$species, bd$lat, function(x) length(unique(x))))
colnames(nlat2) <- "Nombre_especes"
nlat2$Latitude <- rownames(nlat2)
nlat2 <- nlat2[, c("Latitude", "Nombre_especes")]

###EN NUMERIC
nlat2$Latitude <- as.numeric(nlat2$Latitude)
nlat2$Nombre_especes <- as.numeric(nlat2$Nombre_especes)
summary(nlat2)

###MODELE LINEAIRE
model <- lm(Nombre_especes ~ Latitude, data = nlat2)
summary(model)
visreg::visreg(model)

###COURBE DU MODELE
plot(visreg::visreg(model), ylim = c(0, max(nlat2$Nombre_especes)))

###BARPLOT ESP EN FCT DE LAT
barplot(nlat2$Nombre_especes, 
        names.arg = nlat2$Latitude,
        main = "Nombre d'espèces par latitude", 
        xlab = "Latitude", 
        ylab = "Nombre d'espèces",
        col = "skyblue",
        ylim = c(0, max(nlat2$Nombre_especes) + 1),
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés



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

###BARPLOT OBS EN FCT DE LAT
barplot(obsl2$Nombre_observations, 
        names.arg = obsl2$Latitude,
        main = "Nombre d'observations par latitude", 
        xlab = "Latitude", 
        ylab = "Nombre d'observation",
        col = c("red", "blue", "green", "orange", "purple"),
        ylim = c(0, max(obsl2$Nombre_observations) + 1),
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés


###PARULINE EN FCT DE LA LAT
parul <- as.data.frame(tapply(bd$family[bd$family == "Parulidae"], bd$lat[bd$family == "Parulidae"], length))
colnames(parul) <- "Nombre_parulidae"
parul$Latitude <- rownames(parul)

###En NUMERIC
parul$Nombre_parulidae <- as.numeric(parul$Nombre_parulidae)
parul$Latitude <- as.numeric(parul$Latitude)
parul$Latitude <- round(parul$Latitude, digits = 0)
parul <- as.data.frame(aggregate(parul$Nombre_parulidae, by = list(Latitude = parul$Latitude), FUN = sum))
summary(parul)






model3 <- lm(x ~ Latitude, data = parul)
summary(model3)
visreg::visreg(model3)

visreg::visreg(model4,scale = "response")


###BARPLOT OBS PARUL EN FCT DE LAT
par(mai= c(1,1,1,1))
barplot(parul$x, 
        names.arg = parul$Latitude,
        main = "Abondance de parulines en fonction de la latitude", 
        xlab = "Latitude", 
        ylab = "Nombre d'observation",
        col = "grey",
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés






###PARULINE EN FCT DE LA PHÉNO

parul2 <- as.data.frame(tapply(bd$family[bd$family == "Parulidae"], bd$date_obs[bd$family == "Parulidae"], length))
colnames(parul2) <- "Nombre_parulidae"
parul2$date_obs <- rownames(parul2)

###En NUMERIC
parul2$Nombre_parulidae <- as.numeric(parul2$Nombre_parulidae)
summary(parul2)

model5 <- lm(Nombre_parulidae ~ date_obs, data = parul2)
summary(model5)
visreg::visreg(model5)


###BARPLOT OBS PARUL EN FCT DE PHÉNO
barplot(parul2$Nombre_parulidae, 
        names.arg = parul2$date_obs,
        main = "Nombre de Parulidae par date", 
        xlab = "date", 
        ylab = "Nombre d'observation",
        col = "skyblue",
        ylim = c(0, max(parul$Nombre_parulidae) + 1),
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés


