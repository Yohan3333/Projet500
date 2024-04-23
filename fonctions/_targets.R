
setwd("C:/Users/wegen/Desktop/Atelier2")

install.packages("targets")
library(targets)
library(dplyr)
# ===========================================
# _targets.R file
# ===========================================
# Dépendances
csv_files <- list.files(pattern = "\\.csv$")
bd <- data.frame()
# Scripts R


# Cible pour installer les packages
list(
  tar_target(
    name=bd,
    command={
      source("Script principal_modif.R")
      bd
    },
    format="rds"
  )
)

