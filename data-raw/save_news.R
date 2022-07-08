### Code to reproduce the data in sysdata.Rda.
### Need to rerun at each new version of R

R4news <- as.data.frame(news())
R3news <- as.data.frame(news(package = "R-3"))
R2news <- as.data.frame(news(package = "R-2"))

Rnews <- rbind(R4news, R3news, R2news)

# usethis::use_data(Rnews, internal = TRUE, overwrite = TRUE)
