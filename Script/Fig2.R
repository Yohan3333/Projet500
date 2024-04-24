creation_Fig2 = function(bd){
  ###PARULINE EN FCT DE LA LAT
  parul <- as.data.frame(tapply(bd$family[bd$family == "Parulidae"], bd$lat[bd$family == "Parulidae"], length))
  colnames(parul) <- "Nombre_parulidae"
  parul$Latitude <- rownames(parul)
  
  ###En NUMERIC
  parul$Nombre_parulidae <- as.numeric(parul$Nombre_parulidae)
  parul$Latitude <- as.numeric(parul$Latitude)
  parul$Latitude <- round(parul$Latitude, digits = 0)
  parul <- as.data.frame(aggregate(parul$Nombre_parulidae, by = list(Latitude = parul$Latitude), FUN = sum))

  ###Courbe de tendance
  model3 <- lm(x ~ Latitude, data = parul)
 
  ### Courbe OBS Parul en fct LAT
 Fig2 = (visreg(model3,
                 xlab="Latitude",
                 ylab="Nombre de Parulidae",
                 ylim= c(0,max(parul$x)),
                 main=("Abondance de parulines en fonction de la latitude"),
                 cex.lab=0.8,
                 cex.axis=0.8))
 print(Fig2)
}

