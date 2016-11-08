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
test1 <- Detailed_Listings ## this was just for testing purposes to avoid to reload the original data all over again every time replace test1 by the Detailed_Listings!

test1 <- test1[, c("id", "host_id", "host_since",
                                           "neighbourhood_group_cleansed", 
                                           "room_type",
                                           "beds",
                                            "last_review")]

test1 <- mutate(test1, date = ymd(test1$host_since), host_since_day = day(date), 
       host_since_month = month(date), host_since_year = year(date))


##create a unique neighbourhood ID (NID)
test1$NID [test1$neighbourhood_group_cleansed == "Mitte"] <- 1
test1$NID [test1$neighbourhood_group_cleansed == "Friedrichshain-Kreuzberg"] <- 2
test1$NID [test1$neighbourhood_group_cleansed == "Pankow"] <- 3
test1$NID [test1$neighbourhood_group_cleansed == "Charlottenburg-Wilm."] <- 4
test1$NID [test1$neighbourhood_group_cleansed == "Spandau"] <- 5
test1$NID [test1$neighbourhood_group_cleansed == "Steglitz - Zehlendorf"] <- 6
test1$NID [test1$neighbourhood_group_cleansed == "Tempelhof - Schöneberg"] <- 7
test1$NID [test1$neighbourhood_group_cleansed == "Neukölln"] <- 8
test1$NID [test1$neighbourhood_group_cleansed == "Treptow - Köpenick"] <- 9
test1$NID [test1$neighbourhood_group_cleansed == "Marzahn - Hellersdorf"] <- 10
test1$NID [test1$neighbourhood_group_cleansed == "Lichtenberg"] <- 11
test1$NID [test1$neighbourhood_group_cleansed == "Reinickendorf"] <- 12

#reorder data
test1 <- test1[order( test1$NID, test1$host_since_year, test1$host_since_month, decreasing = FALSE), ]

# count # of apts per month per year per district
test_macro <- count(test2, c("NID", "host_since_year", "host_since_month"))

#rename columns for merging
names(test_macro) <- c("NID", "year", "month", "apt_supply")

test_FSO <- FSO_merge

total_merge <- merge(test_FSO, test_macro, by=c("NID", "year", "month"))

###################### Dan's stuff

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

