# Liste des packages à installer
packages <- c("dplyr","stringr", "lubridate","taxize","RSQLite")

#Boucle pour installer les packages non-installés par l'utilisateur 
for (package in packages) {
  if (!require(package, character.only = TRUE)) {
    install.packages(package)
    library(package, character.only = TRUE)
  } else {
    message(paste(package, "est déjà chargé."))
  }
}