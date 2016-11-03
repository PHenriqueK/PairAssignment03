#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: set working directory & load packages & load datasets
##########################

# remove objects from the specified environment
rm(list=ls())  

# Set working directory
try(setwd("/Users/Paulo/GitHub/PairAssignment03"),silent=TRUE)
try(setwd("/Users/djm113/Documents/GitHub/PairAssignment03"),silent=TRUE)
getwd()

# Load Packages: credits to Wickham Hadley, Xie Yihui, Frank Harrell Jr, Philippe Grosejan & Frederic Ibanez
# (install when needed)
library(ggplot2)
library(knitr)
library(pastecs)
library(Hmisc)
library(curl)
library(rio)
library(rvest)
library(stringr)
library(plyr)
library(dplyr)
library(ggvis)
library(knitr)
library(curl)
library(xml2)
library(httr)
library(rvest)
library(stringi)
library(rPython)

#Loading Data from "Regionaldatenbank Deutschland"

<<<<<<< Updated upstream
test01 <- import('https://www.regionalstatistik.de/genesis/online/data/Tabelle01.csv;jsessionid=0E492BFA5C08791DB463EF5123E0D36C?operation=ergebnistabelleDownload&levelindex=2&levelid=1478182953986&option=csv&doDownload=csv&contenttype=csv', format = 'csv')


#Import "listings.csv" from insideairbnb.com
Airbnb_Listings <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/listings.csv")

#Import "reviews.csv" from insideairbnb.com
Airbnb_Reviews <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/reviews.csv")

#Import "neighbourhoods.csv" from inside airbnb.com
Airbnb_Neighbourhoods <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/neighbourhoods.csv")

#Import "listings.csv.gz"
Listings_URL <- "http://data.insideairbnb.com/germany/be/berlin/2015-10-03/data/listings.csv.gz"
temp <- tempfile()
download.file(Listings_URL, temp)
Detailed_Listings <- read.csv(gzfile(temp, "listings.csv"))
unlink(temp)

#Import "reviews.csv.gz"
Reviews_URL <- "http://data.insideairbnb.com/germany/be/berlin/2015-10-03/data/reviews.csv.gz"
download.file(Reviews_URL, temp)
Detailed_Reviews <- read.csv(gzfile(temp, "reviews.csv"))
unlink(temp)
=======
# warm up the curl handle
start <- GET("https://www.statistik-berlin-brandenburg.de/webapi/jsf/tableView/tableView.xhtml")

# get the cookies
ck <- handle_cookies(handle_find("https://www.statistik-berlin-brandenburg.de/webapi/jsf/tableView/tableView.xhtml")$handle)

>>>>>>> Stashed changes
