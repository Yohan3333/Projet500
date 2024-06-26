
creation_Fig1 = function(bd){
  # Supprimer les doublons en regroupant les données par latitude et en prenant une seule espèce par latitude
  donnees_nettoyees_lat <- bd %>%
    group_by(lat) %>%
    summarise(espece_unique = n_distinct(valid_scientific_name))
  
  # Tracer le graphique avec ggplot2 et ajout de la régression linéaire
  fig1 <- ggplot(donnees_nettoyees_lat, aes(x = lat, y = espece_unique)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE, show.legend = FALSE) +  # Ajout de l'argument show.legend = FALSE
    labs(x = "Latitude", y = "Nombre d'espèces uniques", title = "Nombre d'espèces uniques par latitude") +
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption = element_blank())
  print(fig1)
}
             