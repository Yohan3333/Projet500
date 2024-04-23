library(ggplot2)
library(dplyr)

# Supprimer les doublons en regroupant les données par latitude et en prenant une seule espèce par latitude
donnees_nettoyees_lat <- bd %>%
  group_by(lat) %>%
  summarise(espece_unique = n_distinct(valid_scientific_name))

# Tracer le graphique avec ggplot2 et ajout de la régression linéaire
ggplot(donnees_nettoyees_lat, aes(x = lat, y = espece_unique)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) + # Ajout de la régression linéaire sans intervalle de confiance
  labs(x = "Latitude", y = "Nombre d'espèces uniques",
       title = "Nombre d'espèces uniques par latitude")


             