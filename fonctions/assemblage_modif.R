###SCRIPT assemblage

read_d <- function(cvs_files){

  data_list <- list()

  for (file in csv_files) {
    file_path <- file.path(getwd(), file)
    data <- read.csv(file_path, header = TRUE)  
    data_list[[file]] <- data
  }
  bd <- do.call(rbind, data_list)
  return(bd) #Retourner la base de données combinées
}

######Ajouter les explications