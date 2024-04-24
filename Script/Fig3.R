#Création de fonction espèce/année
creation_Fig3 = function(bd){
# Convertir la colonne de date en format Date
bd$date_obs <- as.Date(bd$date_obs)

# Extraire l'année à partir de la colonne de date_obs
bd <- bd %>%
  mutate(annee = format(date_obs, "%Y"))

# Regrouper les données par année et compter le nombre d'espèces uniques pour chaque année
nombre_especes_par_annee <- bd %>%
  group_by(annee) %>%
  summarise(nombre_especes = n_distinct(valid_scientific_name))


# Créer le graphique
fig3 <- ggplot(nombre_especes_par_annee, aes(x = annee, y = nombre_especes)) +
  geom_bar(stat = "identity", fill = "grey") +
  labs(x = "Année", y = "Nombre d'espèces uniques", title = "Nombre d'espèces uniques par année") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotation des étiquettes sur l'axe des x
#ggsave("./rapport/Fig3.png", plot = fig3, width = 10, height = 6, dpi = 300)
print(fig3)
}