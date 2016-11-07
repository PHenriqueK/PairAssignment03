#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: set working directory & load packages & load datasets
##########################

# Dynamical Link to Data/Packages R script file
source("Data.R")

##### GENESIS DATA ######

#Renaming columns
names(GENESIS_2010) <- c("NID", "neighbourhood", "hotels", "beds", "overnight", "visitors")
GENESIS_2010 <- GENESIS_2010[-1,]

names(GENESIS_2011) <- c("NID", "neighbourhood", "hotels", "beds", "overnight", "visitors")
GENESIS_2011 <- GENESIS_2011[-1,]

names(GENESIS_2012) <- c("NID", "neighbourhood", "hotels", "beds", "overnight", "visitors")
GENESIS_2012 <- GENESIS_2012[-1,]

names(GENESIS_2013) <- c("NID", "neighbourhood", "hotels", "beds", "overnight", "visitors") 
GENESIS_2013 <- GENESIS_2013[-1,]

names(GENESIS_2014) <- c("NID", "neighbourhood", "hotels", "beds", "overnight", "visitors") 
GENESIS_2014 <- GENESIS_2014[-1,]

#Adding a time variable (year) 
GENESIS_2010$year <- 2010
GENESIS_2011$year <- 2011
GENESIS_2012$year <- 2012
GENESIS_2013$year <- 2013
GENESIS_2014$year <- 2014

GENESIS_2010$NID <- c(1:12)
GENESIS_2011$NID <- c(1:12)
GENESIS_2012$NID <- c(1:12)
GENESIS_2013$NID <- c(1:12)
GENESIS_2014$NID <- c(1:12)

##### SBB DATA #####
#command to remove columns that are entirely NA values
SBB_guests_2010 <- SBB_guests_2010 [, !apply(is.na(SBB_guests_2010), 2, all)]
SBB_guests_2011 <- SBB_guests_2011 [, !apply(is.na(SBB_guests_2011), 2, all)]
SBB_guests_2012 <- SBB_guests_2012 [, !apply(is.na(SBB_guests_2012), 2, all)]
SBB_guests_2013 <- SBB_guests_2013 [, !apply(is.na(SBB_guests_2013), 2, all)]
SBB_guests_2014 <- SBB_guests_2014 [, !apply(is.na(SBB_guests_2014), 2, all)]
SBB_guests_2015 <- SBB_guests_2015 [, !apply(is.na(SBB_guests_2015), 2, all)]

SBB_overnights_2010 <- SBB_overnights_2010 [, !apply(is.na(SBB_overnights_2010), 2, all)]
SBB_overnights_2011 <- SBB_overnights_2011 [, !apply(is.na(SBB_overnights_2011), 2, all)]
SBB_overnights_2012 <- SBB_overnights_2012 [, !apply(is.na(SBB_overnights_2012), 2, all)]
SBB_overnights_2013 <- SBB_overnights_2013 [, !apply(is.na(SBB_overnights_2013), 2, all)]
SBB_overnights_2014 <- SBB_overnights_2014 [, !apply(is.na(SBB_overnights_2014), 2, all)]
SBB_overnights_2015 <- SBB_overnights_2015 [, !apply(is.na(SBB_overnights_2015), 2, all)]

#Adding a time variable (year)

SBB_guests_2010$year <- 2010 
SBB_guests_2011$year <- 2011
SBB_guests_2012$year <- 2012
SBB_guests_2013$year <- 2013
SBB_guests_2014$year <- 2014
SBB_guests_2015$year <- 2015

SBB_overnights_2010$year <- 2010
SBB_overnights_2011$year <- 2011
SBB_overnights_2012$year <- 2012
SBB_overnights_2013$year <- 2013
SBB_overnights_2014$year <- 2014
SBB_overnights_2015$year <- 2015

#creating unique neighbourhood ID
SBB_guests_2010 <- cbind(NID = (1:12), SBB_guests_2010)
SBB_guests_2011 <- cbind(NID = (1:12), SBB_guests_2011)
SBB_guests_2012 <- cbind(NID = (1:12), SBB_guests_2012)
SBB_guests_2013 <- cbind(NID = (1:12), SBB_guests_2013)
SBB_guests_2014 <- cbind(NID = (1:12), SBB_guests_2014)
SBB_guests_2015 <- cbind(NID = (1:12), SBB_guests_2015)

SBB_overnights_2010 <- cbind(NID = (1:12), SBB_overnights_2010)
SBB_overnights_2011 <- cbind(NID = (1:12), SBB_overnights_2011)
SBB_overnights_2012 <- cbind(NID = (1:12), SBB_overnights_2012)
SBB_overnights_2013 <- cbind(NID = (1:12), SBB_overnights_2013)
SBB_overnights_2014 <- cbind(NID = (1:12), SBB_overnights_2014)
SBB_overnights_2015 <- cbind(NID = (1:12), SBB_overnights_2015)

#joining data frames per genre
GENESIS <- rbind(GENESIS_2010, GENESIS_2011, GENESIS_2012, GENESIS_2013, GENESIS_2014) 
GENESIS <- GENESIS[order(GENESIS$NID, decreasing = TRUE), ] # order for NID
GENESIS <- GENESIS[, c(1,2,7,3,4,5,6)]
remove(GENESIS_2010, GENESIS_2011, GENESIS_2012, GENESIS_2013, GENESIS_2014) #remove unnecessary data subsets

SBB_guests <- rbind(SBB_guests_2010, SBB_guests_2011, SBB_guests_2012, SBB_guests_2013, SBB_guests_2014, SBB_guests_2015) 
SBB_guests <- SBB_guests[order(SBB_guests$NID, decreasing = TRUE), ] # order for NID
remove(SBB_guests_2010, SBB_guests_2011, SBB_guests_2012, SBB_guests_2013, SBB_guests_2014, SBB_guests_2015) #remove unnecessary data subsets

SBB_overnights <- rbind(SBB_overnights_2010, SBB_overnights_2011, SBB_overnights_2012, SBB_overnights_2013, SBB_overnights_2014, SBB_overnights_2015) 
SBB_overnights <- SBB_overnights[order(SBB_overnights$NID, decreasing = TRUE), ] # order for NID
remove(SBB_overnights_2010, SBB_overnights_2011, SBB_overnights_2012, SBB_overnights_2013, SBB_overnights_2014, SBB_overnights_2015) #remove unnecessary data subsets

#merging data frames
reshape(SBB_guests, )