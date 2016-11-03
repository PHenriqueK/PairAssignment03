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

#Loading Data from "Regionaldatenbank Deutschland"

test01 <- import('https://www.regionalstatistik.de/genesis/online/data/Tabelle01.csv;jsessionid=0E492BFA5C08791DB463EF5123E0D36C?operation=ergebnistabelleDownload&levelindex=2&levelid=1478182953986&option=csv&doDownload=csv&contenttype=csv', format = 'csv')


#Import "listings.csv" from insideairbnb.com
Airbnb_Listings <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/listings.csv")
