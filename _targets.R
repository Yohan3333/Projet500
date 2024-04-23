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
library(ggplot2)
library(visreg)
library(targets)
library(tarchetypes)
library(dplyr)
library(lubridate)
library(taxize)
library(RSQLite)
library(stringr)
# ===========================================
# _targets.R file
source("./fonctions/assemblage_modif.R")
source("./fonctions/nettoyage.R")
#source("./fonctions/assemblage_tsn.R")
#source("./fonctions/Table.R")
#source("./fonctions/Valid_SQL.R")
#source("./fonctions/Fig1.R")
#source("./fonctions/Fig2.R")
#source("./fonctions/Fig3.R")
#source("./fonctions/Fig4.R")
# ===========================================
# Dépendances
csv_files <- list.files("./donnees", pattern = "\\.csv$")
# Scripts R

list(
  tar_target(
    name= chemin,
    command = "./donnees",
  ),
  tar_target(
    name= chemin_donnees,
    command = list.files(chemin, pattern = "\\.csv$", full.names = T)
  ),
  tar_target(
    name = bd_oiseaux,
    command = read_d(chemin_donnees)
  ),
  tar_target(
    name = bd_clean,
    command = nettoy(bd_oiseaux)
  )
)