#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: set working directory & load packages & load datasets
##########################

#Import "listings.csv" from insideairbnb.com
#Airbnb_Listings <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/listings.csv")

#Import "reviews.csv" from insideairbnb.com
#Airbnb_Reviews <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/reviews.csv")

#Import "neighbourhoods.csv" from inside airbnb.com
#Airbnb_Neighbourhoods <- read.csv("http://data.insideairbnb.com/germany/be/berlin/2015-10-03/visualisations/neighbourhoods.csv")

#Import "listings.csv.gz"
Listings_URL <- "http://data.insideairbnb.com/germany/be/berlin/2015-10-03/data/listings.csv.gz"
temp <- tempfile()
download.file(Listings_URL, temp)
Detailed_Listings <- read.csv(gzfile(temp, "listings.csv"))
unlink(temp)

#Import "reviews.csv.gz"
#Reviews_URL <- "http://data.insideairbnb.com/germany/be/berlin/2015-10-03/data/reviews.csv.gz"
#download.file(Reviews_URL, temp)
#Detailed_Reviews <- read.csv(gzfile(temp, "reviews.csv"))
#unlink(temp)