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
# ===========================================
source("./Script/assemblage_modif.R")
source("./Script/nettoyage.R")
source("./Script/assemblage_tsn.R")
source("./Script/Table.R")
source("./Script/Valid_SQL.R")
source("./Script/Fig1.R")
source("./Script/Fig2.R")
source("./Script/Fig3.R")
source("./Script/Fig4.R")
source("./rapport/rapport.Rmd")
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
  tar_target(
    name = Fig1, #Création de la Figure 1
    command = creation_Fig1(bd_tsn)
  ),
  tar_target(
    name=Fig2, #Création de la figure 2
    command = creation_Fig2(bd_tsn)
  ),
  tar_target(
    name=Fig3, #Craétion de la figure 3
    command = creation_Fig3(bd_tsn)
  ),
  tar_target(
    name=Fig4, #Création de la figure 4
    command = creation_Fig4(bd_tsn)
  ),
  tar_render(
    name = Rapport, # Création du rapport Rmarkdown
    path = "./rapport/rapport.Rmd"
  )
)

