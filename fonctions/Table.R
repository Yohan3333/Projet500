

# OUVRIR LA CONNECTION À LA BASE DE DONNÉES

conoiseau <- dbConnect(SQLite(), dbname="conoiseau.db")
# LECTURE DES FICHIERS table
#bd_primaire <- read.table(file = 'primaire.txt')
#bd_site <- read.table(file = 'sec_site.txt')
#bd_date <- read.table(file = 'sec_date.txt')
#bd_tsn <- read.table(file = 'sec_tsn.txt')

# CRÉER LA TABLE SITE
tbl_site <- 
"CREATE TABLE bd_site (
  site_id   INTEGER(20) NOT NULL,
  lat       REAL(10) NOT NULL,
  PRIMARY KEY (site_id)
);"

dbSendQuery(conoiseau, tbl_site)

# CRÉER LA TABLE DATE
tbl_date <- 
"CREATE TABLE bd_date (
date_obs   DATE,
time_start      TIME,
time_finish    TIME,
time_obs       TIME,
PRIMARY KEY (date_obs)
);"

dbSendQuery(conoiseau, tbl_date)

# CRÉER LA TABLE TSN
tbl_tsn <- 
"CREATE TABLE bd_tsn (
  tsn INTEGER (8) NOT NULL,
  vernacular_fr  VARCHAR(40),
  rank   VARCHAR(40),
  'order'  VARCHAR(40),
  genus  VARCHAR(40),
  family  VARCHAR(40),
  species  VARCHAR(40),
  PRIMARY KEY (tsn)
);"

dbSendQuery(conoiseau, tbl_tsn)

# CRÉER LA TABLE principale
tbl_princ <- 
"CREATE TABLE bd_primaire (
  tsn INTEGER (8) NOT NULL,
  date_obs   DATE,
  site_id   INTEGER(20) NOT NULL,
  PRIMARY KEY (tsn, date_obs, site_id),
FOREIGN KEY (tsn) REFERENCES tsn(tsn),
FOREIGN KEY (date_obs) REFERENCES date(date_obs),
FOREIGN KEY (site_id) REFERENCES site(site_id)
);"

dbSendQuery(conoiseau, tbl_princ)


# INJECTION DES DONNÉES
dbWriteTable(conoiseau, append = TRUE, name = "tbl_princ", value = bd_primaire, row.names = FALSE)
dbWriteTable(conoiseau, append = TRUE, name = "tbl_tsn", value = bd_tsn, row.names = FALSE)
dbWriteTable(conoiseau, append = TRUE, name = "tbl_date", value = bd_date, row.names = FALSE)
dbWriteTable(conoiseau, append = TRUE, name = "tbl_site", value = bd_site, row.names = FALSE)

dbDisconnect(conoiseau)



