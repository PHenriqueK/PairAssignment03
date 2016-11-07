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
library(DataCombine)
library(tidyr)

#Loading Data from "Regionaldatenbank Deutschland"
GENESIS_2010 <- read.csv("~/GitHub/PairAssignment03/data/GENESIS_2010.csv", sep=";", quote="\"", stringsAsFactors = FALSE)
GENESIS_2011 <- read.csv("~/GitHub/PairAssignment03/data/GENESIS_2011.csv", sep=";", quote="\"", stringsAsFactors = FALSE)
GENESIS_2012 <- read.csv("~/GitHub/PairAssignment03/data/GENESIS_2012.csv", sep=";", quote="\"", stringsAsFactors = FALSE)
GENESIS_2013 <- read.csv("~/GitHub/PairAssignment03/data/GENESIS_2013.csv", sep=";", quote="\"", stringsAsFactors = FALSE)
GENESIS_2014 <- read.csv("~/GitHub/PairAssignment03/data/GENESIS_2014.csv", sep=";", quote="\"", stringsAsFactors = FALSE)

SBB_2010_2015 <- read.csv("~/GitHub/PairAssignment03/data/SBB_2010_2015.csv", sep=";", stringsAsFactors = FALSE)

##### Updated upstream #####

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
#######
# warm up the curl handle
start <- GET("https://www.statistik-berlin-brandenburg.de/webapi/jsf/tableView/tableView.xhtml")
