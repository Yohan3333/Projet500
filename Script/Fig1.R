# Céation de fonction pour figure espèce/latitude

creation_Fig1 = function(bd){
# Supprimer les doublons en regroupant les données par latitude et en prenant une seule espèce par latitude
donnees_nettoyees_lat <- bd %>%
  group_by(lat) %>%
  summarise(espece_unique = n_distinct(valid_scientific_name))

# Tracer le graphique avec ggplot2 et ajout de la régression linéaire
fig1 <- ggplot(donnees_nettoyees_lat, aes(x = lat, y = espece_unique)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + # Ajout de la régression linéaire sans intervalle de confiance
  labs(x = "Latitude", y = "Nombre d'espèces uniques",
       title = "Nombre d'espèces uniques par latitude")
#ggsave("./rapport/Fig1.png", plot = fig1, width = 10, height = 6, dpi = 300)
print(fig1)
}

             