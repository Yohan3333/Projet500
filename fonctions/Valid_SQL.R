
#To verify if the tables were created successfully in the SQLite database using R, you can query the database for the table names. Here's how you can do it:

# Open the database connection
conoiseau <- dbConnect(SQLite(), dbname = "conoiseau.db")

### table tbl_site
# Définir la requête SQL pour sélectionner toutes les colonnes de la table
query <- "SELECT * FROM tbl_site;"

# Exécuter la requête
tbl_site_validation <- dbGetQuery(conoiseau, query)

# Afficher les données de la table
print(tbl_site_validation)


### table tbl_tsn
# Définir la requête SQL pour sélectionner toutes les colonnes de la table
query <- "SELECT * FROM tbl_tsn;"

# Exécuter la requête
tbl_tsn_validation <- dbGetQuery(conoiseau, query)

# Afficher les données de la table
print(tbl_tsn_validation)




### table tbl_date
# Définir la requête SQL pour sélectionner toutes les colonnes de la table
query <- "SELECT * FROM tbl_date;"

# Exécuter la requête
tbl_date_validation <- dbGetQuery(conoiseau, query)

# Afficher les données de la table
print(tbl_date_validation)




### table tbl_princ
# Définir la requête SQL pour sélectionner toutes les colonnes de la table
query <- "SELECT * FROM tbl_princ;"

# Exécuter la requête
tbl_princ_validation <- dbGetQuery(conoiseau, query)

# Afficher les données de la table
print(tbl_princ_validation)



# Fermer la connexion à la base de données
dbDisconnect(conoiseau)
