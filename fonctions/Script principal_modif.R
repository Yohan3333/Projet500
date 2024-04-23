### Script principal
# Pour jeu de donnée acoustique_oiseaux
# Travail par Frédérick St-Pierre, Yohan Wegener, Aurel veillet et Félix Labbé

#0 Installer les packages
source("packages.R")

setwd(getwd())


# 1) Script d'assemblage des données
csv_files <- list.files(pattern = "\\.csv$")
source("assemblage_modif.R")
bd <- read_d(csv_files)

# 2) Script de nettoyage

source("nettoyage.R")

# 3) Script d'ajout d'identifiant tsn
source("assemblage_tsn.R")

# 4) script de validations des données
source("validation.R")

# 5) Visualisation des données modifiées
View(bd)

#6)Division
source("Division.R")

# 7) SQL Création des tables et insertion des données
source("Table.R")

#8) validation des tables sql
source("Valid_SQL.R")

