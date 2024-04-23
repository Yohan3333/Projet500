###SCRIPT assemblage_tsn
ass_tsn = function(bd){
  #Trouver les tsn pour chaque espèce
  
  #Créer une liste d'espèces
  s <- as.data.frame(table(bd$valid_scientific_name))
  esp <- as.character(s$Var1)
  
  #Fonction pour trouver les tsn stockées dans l'objet codes
  codes <- get_tsn(esp)
  
  #Mettre les codes en valeurs integer
  codes <- as.integer(codes)
  
  #Combinner les "codes" et "esp@
  tsn_code <- as.data.frame(cbind(codes,esp))
  
  
  
  #Créer un vecteur vide avec 30433 valeurs (nombre de rangées)
  codes <- vector("numeric", length = 30433)
  
  #Changer les nom de colonnes du data.frame tsn pour matcher avec la base de données principale
  colnames(tsn_code) <- c("codes","valid_scientific_name")
  
  #Rajouter la colonne "codes" dans la bd
  bd <- cbind(bd,codes)
  
  #Joindre les codes tsn à la base de données principale
  bd <- left_join(tsn_code, bd, by = "valid_scientific_name")
  bd <- bd[, -which(names(bd) == "codes.y")] #Enlever codes.y
  names(bd)[names(bd) == "codes.x"] <- "tsn"
  print(bd)
}
