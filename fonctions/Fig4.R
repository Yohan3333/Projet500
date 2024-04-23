creation_Fig4 = function(bd){
###PARULINE EN FCT DE LA LAT
parul <- as.data.frame(tapply(bd$family[bd$family == "Parulidae"], bd$lat[bd$family == "Parulidae"], length))
colnames(parul) <- "Nombre_parulidae"
parul$Latitude <- rownames(parul)

###En NUMERIC
parul$Nombre_parulidae <- as.numeric(parul$Nombre_parulidae)
parul$Latitude <- as.numeric(parul$Latitude)
summary(parul)

model3 <- lm(Nombre_parulidae ~ Latitude, data = parul)
summary(model3)
visreg::visreg(model3)
png("./Figures/Fig4.png")
###BARPLOT OBS PARUL EN FCT DE LAT
barplot(parul$Nombre_parulidae, 
        names.arg = parul$Latitude,
        main = "Nombre de Parulidae par latitude", 
        xlab = "Latitude", 
        ylab = "Nombre d'observation",
        col = "skyblue",
        ylim = c(0, max(parul$Nombre_parulidae) + 1),
        las = 2)  # Orientation des étiquettes de l'axe x à 90 degrés
dev.off()
}