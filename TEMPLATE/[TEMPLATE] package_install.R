#Install all most used packages

install.packages("car")
install.packages("gdata")
install.packages("Hmisc")
install.packages("metafor")
install.packages("plyr")
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("psych") 
install.packages("RCurl")
install.packages("irr") 
install.packages("nortest") 
install.packages("moments")
install.packages("GPArotation")
install.packages("nFactors")
install.packages("meta")
install.packages("qgraph")
install.packages("reshape")
install.packages("repmis")
install.packages("ltm")
install.packages("gmodels")
install.packages("eRm")
install.packages("mirt")
install.packages("IsingSampler")
install.packages("IsingFit")
install.packages("xml2")
install.packages("rversions")
install.packages("devtools")
install.packages("rgdal")
install.packages("rgeos")
install.packages("sqldf")
install.packages("pgirmess")
install.packages("VIM")
install.packages("caret")
install.packages("wordcloud")
install.packages("psy")
install.packages("mclust")
install.packages("memisc")
install.packages("lmerTest")
install.packages("doBy")
install.packages("geepack")
install.packages("mada")
install.packages("mice")
install.packages("MissMech")
install.packages("mlmRev")
install.packages("twitteR")
install.packages("sna")
install.packages("qdap")
install.packages("tm")
install.packages("lubridate")
install.packages("network")
install.packages("rJava",type='source') #run sudo R CMD javareconf in terminal before
install.packages("cowplot")
install.packages("stringr")
install.packages("SnowballC")
install.packages("poLCA")
install.packages("QCA")
install.packages("VennDiagram")
install.packages("haven")
install.packages("pcalg")
install.packages("semPlot")


devtools::install_github("jennybc/googlesheets")
devtools::install_github("cran/epicalc")
devtools::install_github("BioStatMatt/sas7bdat")
devtools::install_github("rdpeng/gpclib")
devtools::install_github("sjewo/readstata13")

source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
biocLite("RGBL")