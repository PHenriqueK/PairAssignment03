#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: merging cleaned data sets
##########################

#dynamical link
source('airbnb_data_manipulation.R')

#merge data GENE
FSO_SBB1 <- merge(SBB_2010_2015_merge, GENESIS_merge, by=c("NID", "year"), all.x = TRUE, all.y = TRUE)
FSO_SBB2 <- merge(FSO_SBB1, SBB_HH_Income_merge, by=c("NID", "year"), all.x = TRUE)
FSO_SBB <- merge(FSO_SBB2, SBB_unemployment_merge, by=c("NID", "year"), all.x = TRUE)

FSO_SBB <- FSO_SBB[order(FSO_SBB$NID, decreasing = FALSE), ] # order for NID

remove(FSO_SBB1, FSO_SBB2, SBB_2010_2015_merge, SBB_HH_Income_merge, SBB_unemployment_merge, GENESIS_merge, agg_listings, agg_listings_merge, FSO_SBB, GENESIS, SBB_2010_2015, listings)

# calculate hotel occupancy rate per month/year and district
FSO_SBB$occup_rate <- FSO_SBB$nights/(FSO_SBB$beds*30)

analysis_data <- merge(FSO_SBB, agg_listings_merge, by=c("NID", "year_month"), all.x = TRUE)
