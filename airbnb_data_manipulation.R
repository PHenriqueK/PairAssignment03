#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: clean inside Airbnb data
##########################

# Dynamical Link to Data/Packages R script file
source('SBB_data_manipulation.R')

listings <- Detailed_Listings ## this was just for testing purposes to avoid to reload the original data all over again every time replace listings by the Detailed_Listings!

listings <- listings[, c("id", "host_id", "host_since", "neighbourhood_group_cleansed", 
                   "room_type", "beds", "first_review",  "last_review")]

listings <- listings[!(listings$host_since == "" | is.na(listings$host_since)), ] ##Attention! There are 5 missing host_since dates in our data: what should we do with them?

listings$host_since <- as.Date(listings$host_since,"%Y-%m-%d")

listings <- mutate(listings, date = ymd(listings$host_since), host_since_day = day(date), 
       host_since_month = month(date), host_since_year = year(date)) ##spliting host_since date up into its elements

##create a new yy-mm variable
listings$year_month <- as.yearmon(listings$host_since, "%Y-%m")

##create counting variable
listings$count <- 1

##create a unique neighbourhood ID (NID)
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

# making aggregate data per district and month by counting # of new apts per month per year per district
agg_listings <- tally(group_by(listings, NID, year_month))

names(agg_listings) <- c("NID", "year_month", "apt_new")

#ready to merge

agg_listings_merge <- agg_listings
