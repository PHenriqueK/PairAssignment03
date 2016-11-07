#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: set working directory & load packages & load datasets
##########################

source("Data.R")

Detailed_Listings <- Detailed_Listings[, c("id", "name", "host_id", "host_name", "host_since",
                                           "host_response_rate", "host_acceptance_rate",
                                           "host_neighbourhood", "host_listings_count", "street",
                                           "neighbourhood_group_cleansed", "city", "state",
                                           "zipcode", "smart_location", "room_type",
                                           "accommodates", "beds", "bed_type", "price",
                                           "number_of_reviews", "first_review", "last_review",
                                           "reviews_per_month", "availability_30",
                                           "availability_60", "availability_90",
                                           "availability_365")]
names(Detailed_Listings)

January_2010_Pankow <- Detailed_Listings[ which(Detailed_Listings$neighbourhood_group_cleansed=="Pankow" & Detailed_Listings$host_since=="2010"), ]

January_2010_Pankow <- subset(Detailed_Listings, Detailed_Listings$neighbourhood_group_cleansed=="Pankow" & Detailed_Listings$host_since==("2010-01-01":"2010-02-01"))

host_since <- as.Date(Detailed_Listings$host_since)

January_2010 <- Detailed_Listings[Detailed_Listings$host_since >= "2010-01-01" & Detailed_Listings$host_since <= "2010-02-01"]
                                    
January_2010 <- subset(Detailed_Listings, Detailed_Listings$host_since >= "2010-01-01" & Detailed_Listings$host_since <= "2010-02-01")

Detailed_Listings[format.Date(Detailed_Listings$host_since, "%m")=="01" & format.Date(Detailed_Listings$host_since, "%Y")=="2010" & !is.na(Detailed_Listings$host_since),]


T1 <- as.Date("2010-01-01")

T2 <- as.Date("2010-02-01")

Detailed_Listings[Detailed_Listings$host_since>="2010-01-01" & date<"2010-02-01"]

January_2010_Pankow <- Detailed_Listings[Detailed_Listings$host_since %in% 2010-01-01:2010-02-01]

January_2010_Pankow <- subset(Detailed_Listings, Detailed_Listings$host_since < as.Date("2010-02-01"))

January_2010_Pankow <- subset(Detailed_Listings, Detailed_Listings$host_since == (2010-01-01 - 2010-02-01))

