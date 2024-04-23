### Script principal
# Pour jeu de donnée acoustique_oiseaux
# Travail par Frédérick St-Pierre, Yohan Wegener, Aurel veillet et Félix Labbé

#0 Installer les packages
source("./fonctions/packages.R")

# 1) Script d'assemblage des données
path <- "./donnees"
csv_files <- list.files(path = path,   pattern = "\\.csv$")
source("./fonctions/assemblage_modif.R")
bd <- read_d(csv_files)

# 2) Script de nettoyage

source("./fonctions/nettoyage.R")

# 3) Script d'ajout d'identifiant tsn
source("./fonctions/assemblage_tsn.R")

# 4) script de validations des données
source("./fonctions/validation.R")

# 5) Visualisation des données modifiées
View(bd)

#6)Division
source("./fonctions/Division.R")

# 7) SQL Création des tables et insertion des données
source("./fonctions/Table.R")

#8) validation des tables sql
source("./fonctions/Valid_SQL.R")

#9) figures
source("./fonctions/Figures2.R")

