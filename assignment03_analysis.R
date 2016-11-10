#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: merging cleaned data sets
##########################

# Set working directory
try(setwd("/Users/Paulo/GitHub/PairAssignment03"),silent=TRUE)
try(setwd("/Users/djm113/Documents/GitHub/PairAssignment03/"),silent=TRUE)
getwd()


#dynamical link
source('merge.R')

#log Airbnb Apt Supply (simple model)
analysis_simple$log_ABsupply <- log(analysis_data$AB_supply)

#dropping some variables
analysis_simple <- analysis_data[, c("NID", "neighbourhood", "year_month", "occup_rate", "AB_supply", "log_ABsupply", "avg_inc", "ue_rate" )]



