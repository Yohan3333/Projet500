#Fichier target

#install.packages("targets")
#install.packages("tarchetypes")
#install.packages("dplyr")
#install.packages("lubridate")
#install.packages("stringr")
#install.packages("taxize")
#install.packages("RSQLite")
#install.packages("visreg")
#install.packages("ggplot2")
#install.packages("rmarkdown")
#install.packages("tinytex")
library(ggplot2)
library(visreg)
library(targets)
library(tarchetypes)
library(dplyr)
library(lubridate)
library(taxize)
library(RSQLite)
library(stringr)
library(rmarkdown)
library(tinytex)
# ===========================================
source("./Script/assemblage_modif.R")
source("./Script/nettoyage.R")
source("./Script/assemblage_tsn.R")
source("./Script/Table.R")
source("./Script/Valid_SQL.R")
source("./Script/Fig1.R")
source("./Script/Fig2.R")
source("./Script/Fig3.R")
# ===========================================
# Dépendances


# Scripts R

list(
  tar_target(
    name= chemin,   #chemin vers les données
    command = "./donnees",
  ),
  tar_target(
    name= chemin_donnees, #Création d'une liste compilable de tous les fichiers csv
    command = list.files(chemin, pattern = "\\.csv$", full.names = T)
  ),
  tar_target(
    name = bd_oiseaux, #Création d'une base de données avec les fichiers csv
    command = read_d(chemin_donnees)
  ),
  tar_target(
    name = bd_clean, # Nettoyage et validation de la base de données
    command = nettoy(bd_oiseaux)
  ),
  tar_target(
    name = bd_tsn, #Création d'une nouvelle colonne avec les identifiants tsn des oiseaux
    command = ass_tsn(bd_clean)
  ),
  tar_target(
    name= table_sql, #Création des tables SQL
    command = create_sql(bd_tsn)
  ),
  tar_target(
    name= valid_sql, #Validation des tables SQL
    command = validation_sql(table_sql)
  ),
  tar_render(
    name = Rapport, # Création du rapport Rmarkdown
    path = "./rapport/rapportb.Rmd"
  )
)

