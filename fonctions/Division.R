
bd_primaire <- bd[, c("tsn", "date_obs", "site_id")]
#write.table(primaire,"C:/Users/wegen/Desktop/projet 500/bd_primaire.txt") 

bd_tsn <- bd[, c("tsn", "vernacular_fr", "rank","order","genus","family", "species")]
#write.table(sec_tsn,"C:/Users/wegen/Desktop/projet 500/bd_tsn.txt")  

bd_site <- bd[, c("site_id", "lat")] 
#write.table(sec_site,"C:/Users/wegen/Desktop/projet 500/bd_site.txt") 

bd_date <- bd[, c("date_obs", "time_start", "time_finish", "time_obs")]
#write.table(sec_date,"C:/Users/wegen/Desktop/projet 500/bd_date.txt")   

