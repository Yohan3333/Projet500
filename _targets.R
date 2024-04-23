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
source("./fonctions/assemblage_modif.R")
source("./fonctions/nettoyage.R")
source("./fonctions/assemblage_tsn.R")
source("./fonctions/Table.R")
source("./fonctions/Valid_SQL.R")
source("./fonctions/Fig1.R")
source("./fonctions/Fig2.R")
source("./fonctions/Fig3.R")
source("./fonctions/Fig4.R")
# ===========================================
# Dépendances


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
  ),
  tar_target(
    name = bd_tsn,
    command = ass_tsn(bd_clean)
  ),
  tar_target(
    name= table_sql,
    command = create_sql(bd_tsn)
  ),
  tar_target(
    name= valid_sql,
    command = validation_sql(table_sql)
  ),
  tar_target(
    name = Fig1,
    command = creation_Fig1(bd_tsn)
  ),
  tar_target(
    name=Fig2,
    command = creation_Fig2(bd_tsn)
  ),
  tar_target(
    name=Fig3,
    command = creation_Fig3(bd_tsn)
  ),
  tar_target(
    name=Fig4,
    command = creation_Fig4(bd_tsn)
  ),
  tar_render(
    name = Rapport,
    path = "./rapport/rapport.rmd"
  )
)
