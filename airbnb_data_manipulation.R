#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 11 November 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: Cleans Airbnb data
##########################

# Dynamical Link to Data/Packages R script file
source('SBB_data_manipulation.R')

## This was just for testing purposes to avoid to reload the original data all over 
## again every time replace listings by the Detailed_Listings!
listings <- Detailed_Listings 

listings <- listings[, c("id", "host_id", "host_since", "neighbourhood_group_cleansed", 
                   "room_type", "beds", "first_review",  "last_review")]

#This deletes 5 Airbnb listings for which there are no dates at all
listings <- listings[!(listings$host_since == "" | is.na(listings$host_since)), ] 

listings$host_since <- as.Date(listings$host_since,"%Y-%m-%d")

#Splitting host_since date up into its elements
listings <- mutate(listings, date = ymd(listings$host_since), host_since_day = day(date), 
       host_since_month = month(date), host_since_year = year(date)) 

#Creating a new yy-mm variable
listings$year_month <- as.yearmon(listings$host_since, "%Y-%m")

#Creating a counting variable
listings$count <- 1

#Creating a unique neighbourhood ID (NID)
listings$NID [listings$neighbourhood_group_cleansed == "Mitte"] <- 1
listings$NID [listings$neighbourhood_group_cleansed == "Friedrichshain-Kreuzberg"] <- 2
listings$NID [listings$neighbourhood_group_cleansed == "Pankow"] <- 3
listings$NID [listings$neighbourhood_group_cleansed == "Charlottenburg-Wilm."] <- 4
listings$NID [listings$neighbourhood_group_cleansed == "Spandau"] <- 5
listings$NID [listings$neighbourhood_group_cleansed == "Steglitz - Zehlendorf"] <- 6
listings$NID [listings$neighbourhood_group_cleansed == "Tempelhof - Schöneberg"] <- 7
listings$NID [listings$neighbourhood_group_cleansed == "Neukölln"] <- 8
listings$NID [listings$neighbourhood_group_cleansed == "Treptow - Köpenick"] <- 9
listings$NID [listings$neighbourhood_group_cleansed == "Marzahn - Hellersdorf"] <- 10
listings$NID [listings$neighbourhood_group_cleansed == "Lichtenberg"] <- 11
listings$NID [listings$neighbourhood_group_cleansed == "Reinickendorf"] <- 12

#Making aggregate data by district and month by counting the number of new apts per month in each district
agg_listings <- tally(group_by(listings, NID, year_month))

#Names "agg_listings" columns
names(agg_listings) <- c("NID", "year_month", "apt_new")

#Ready to merge
agg_listings_merge <- agg_listings
