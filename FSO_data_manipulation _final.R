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

#joining data frames per genre
GENESIS <- rbind(GENESIS_2010, GENESIS_2011, GENESIS_2012, GENESIS_2013, GENESIS_2014) 
GENESIS <- GENESIS[order(GENESIS$NID, decreasing = FALSE), ] # order for NID
GENESIS <- GENESIS[, c(1,2,7,3,4,5,6)]
remove(GENESIS_2010, GENESIS_2011, GENESIS_2012, GENESIS_2013, GENESIS_2014) #remove unnecessary data subsets
GENESIS_merge <- GENESIS[, c("NID", "year", "beds")]

##### SBB DATA #####
#drop rows with no information, remove columns that contain entirely NA values, rename columns
SBB_2010_2015 <- SBB_2010_2015[-(865:871),]
SBB_2010_2015 <- SBB_2010_2015 [, !apply(is.na(SBB_2010_2015), 2, all)]
names(SBB_2010_2015) <- c("neighbourhood", "year", "month", "guests", "nights")
SBB_2010_2015$month [SBB_2010_2015$month == "Januar"] <- 1
SBB_2010_2015$month [SBB_2010_2015$month == "Februar"] <- 2
SBB_2010_2015$month [SBB_2010_2015$month == "Maerz"] <- 3
SBB_2010_2015$month [SBB_2010_2015$month == "April"] <- 4
SBB_2010_2015$month [SBB_2010_2015$month == "Mai"] <- 5
SBB_2010_2015$month [SBB_2010_2015$month == "Juni"] <- 6
SBB_2010_2015$month [SBB_2010_2015$month == "Juli"] <- 7
SBB_2010_2015$month [SBB_2010_2015$month == "August"] <- 8
SBB_2010_2015$month [SBB_2010_2015$month == "September"] <- 9
SBB_2010_2015$month [SBB_2010_2015$month == "Oktober"] <- 10
SBB_2010_2015$month [SBB_2010_2015$month == "November"] <- 11
SBB_2010_2015$month [SBB_2010_2015$month == "Dezember"] <- 12

#filling blanks
Fill <- function(x,missing="")
{
  Log <- x != missing
  y <- x[Log]
  y[cumsum(Log)]
}

SBB_2010_2015$neighbourhood <- Fill(as.character(SBB_2010_2015$neighbourhood))
SBB_2010_2015$year <- Fill(as.character(SBB_2010_2015$year))

#creating unique neighbourhood ID

SBB_2010_2015$NID <- sapply(strsplit(as.character(SBB_2010_2015$neighbourhood),' '), "[", 1)
SBB_2010_2015$NID [SBB_2010_2015$NID == "01"] <- 1
SBB_2010_2015$NID [SBB_2010_2015$NID == "02"] <- 2
SBB_2010_2015$NID [SBB_2010_2015$NID == "03"] <- 3
SBB_2010_2015$NID [SBB_2010_2015$NID == "04"] <- 4
SBB_2010_2015$NID [SBB_2010_2015$NID == "05"] <- 5
SBB_2010_2015$NID [SBB_2010_2015$NID == "06"] <- 6
SBB_2010_2015$NID [SBB_2010_2015$NID == "07"] <- 7
SBB_2010_2015$NID [SBB_2010_2015$NID == "08"] <- 8
SBB_2010_2015$NID [SBB_2010_2015$NID == "09"] <- 9

SBB_2010_2015 <- SBB_2010_2015[, c(6,1,2,3,4,5)]
SBB_2010_2015 <- SBB_2010_2015[order(SBB_2010_2015$NID, SBB_2010_2015$year, decreasing = FALSE), ] # order for NID

#merge data 
FSO_merge <- merge(SBB_2010_2015, GENESIS_merge, by=c("NID", "year"), all.y = TRUE) 
FSO_merge <- FSO_merge[order(FSO_merge$NID, decreasing = FALSE), ] # order for NID

remove(GENESIS, GENESIS_merge, SBB_2010_2015) #remove unnecessary data subsets

#rearrange and prepare for further manipulation
FSO_merge$NID <- strtoi(FSO_merge$NID)
FSO_merge$year <- strtoi(FSO_merge$year) 
FSO_merge$month <- strtoi(FSO_merge$month)
FSO_merge <- FSO_merge[order(FSO_merge$NID, FSO_merge$year, FSO_merge$month, decreasing = FALSE), ] # order for NID

# calculate hotel occupancy rate per month/year and district
FSO_merge$occupancyrate <- FSO_merge$nights/(FSO_merge$beds*30)
