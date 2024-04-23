
###SCRIPT nettoyage
nettoy = function(bd){
  #Remplacer les valeur null en NA
  bd <- replace(bd, bd == "NULL", NA)
  
  #Enlever les colonnes non nécéssaire
  bd <- bd[, -which(names(bd) == "variable")] #Enlever variable
  bd <- bd[, -which(names(bd) == "kingdom")]  #Enlever kingdom
  bd <- bd[, -which(names(bd) == "phylum")]  #Enlever phylum
  bd <- bd[, -which(names(bd) == "class")]  #Enlever class
  bd <- bd[, -which(names(bd) == "vernacular_en")]  # Enlever vernacular_en
  
  
  #Remplace les nom non-valides
  bd <- replace(bd, bd == "Parus atricapilla", "Poecile atricapillus")
  bd <- replace(bd, bd == "Antigone canadensis", "Grus canadensis")
  
  
  # à partir de la base de données "bd" et la colonne "date_obs", la fonction
  # mutate va mettre le format de date_obs dans un ordre comparable,
  # pour ce fair il faut ajouter une colonne (date_format)
  bd <- bd %>%
    mutate(date_format = case_when(
      grepl("^\\d{1,2}/\\d{1,2}/\\d{4}$", date_obs) ~ "DMY",  # Format jour/mois/annÃ©e
      grepl("^\\d{4}-\\d{1,2}-\\d{1,2}$", date_obs) ~ "YMD"   # Format annÃ©e/mois/jour
    ))
  
  #Convertir toutes les dates en format année/mois/jour
  bd <- bd %>%
    mutate(date_obs = case_when(
      date_format == "DMY" ~ format(as.Date(date_obs, format = "%d/%m/%Y"), "%Y/%m/%d"),
      date_format == "YMD" ~ date_obs
    ))
  
  #Supprimer la colonne de format inutile
  bd <- bd %>%
    select(-date_format)
  
  #Avec la base de données "db" et la colonne est "date_obs", substituer les "-"
  
  bd$date_obs <- gsub("-", "/", bd$date_obs)
  return(bd)
}


