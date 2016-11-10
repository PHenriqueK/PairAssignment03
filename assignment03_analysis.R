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

#drop observations for 2015 and further
data_2010_2014 <- analysis_data[which(analysis_data$year < 2015),]

data_2010_2014$apt_new[is.na(data_2010_2014$apt_new)] <- 0

#cumulative sum of new appartments/month per district

data_2010_2014$AB_supply <- ave(data_2010_2014$apt_new, data_2010_2014$NID, FUN=cumsum)

#dropping variables not needed
analysis_simple <- data_2010_2014[, c("NID", "neighbourhood", "year_month", "occup_rate", "AB_supply", "avg_inc", "ue_rate", "guests" )]

#log Airbnb Apt Supply (simple model)
analysis_simple$log_ABsupply <- log(analysis_simple$AB_supply)

# Adding log Hotel occupancy to analysis_data
analysis_simple$log_OccupRate <-  log(analysis_simple$occup_rate)

# Histograms
hist(analysis_simple$occup_rate)
hist(analysis_simple$AB_supply)
hist(analysis_simple$log_OccupRate)
hist(analysis_simple$log_ABsupply)

# dick n dirty multiple regression
simple_model <- lm(occup_rate ~ log_ABsupply + log(guests) + log(avg_inc) + ue_rate, data=analysis_simple)

summary(simple_model)

# Plotting Airbnb supply against hotel occupancy rates
qplot(analysis_simple$occup_rate, analysis_simple$AB_supply, data = analysis_simple,
      xlab = "Hotel Occupancy Rate", 
      ylab = "Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Plotting log_ABsupply against hotel occupancy rates
qplot(analysis_simple$log_ABsupply, analysis_simple$occup_rate, data = analysis_simple,
      xlab = "Log Airbnb Supply",
      ylab = "Hotel Occupancy Rate",
      main = "The Effect of Airbnb on Hotel Occupancy Rates" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Plotting log_ABsupply against log_HotelOccup
qplot(analysis_simple$log_OccupRate, analysis_simple$log_ABsupply, data = analysis_simple,
      xlab = "Hotel Occupancy Rate", 
      ylab = "Log Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Creating Neighborhood subsets?
Neukolln_Subset <- subset(analysis_simple, analysis_simple$NID==8)

# Creating Year subsets?
Subset_2012 <- subset(analysis_simple, analysis_simple$year==2012)

# Plotting log_ABsupply against log_HotelOccup in Neukolln
qplot(Neukolln_Subset$log_OccupRate, Neukolln_Subset$log_ABsupply, data = Neukolln_Subset,
      xlab = "Log Hotel Occupancy Rate", 
      ylab = "Log Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates in Neukolln" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Plotting log_ABsupply against log_HotelOccup in 2012

qplot(Subset_2012$log_OccupRate, Subset_2012$log_ABsupply, data = Subset_2012,
      xlab = "Log Hotel Occupancy Rate", 
      ylab = "Log Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates in 2012" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Bar graph of hotel beds supplied by year
ggplot(data=analysis_simple, aes(x=analysis_simple$year, y=analysis_simple$beds, fill=analysis_simple$year)) + 
  geom_bar(colour="black", fill="#DD8888", width=.5, stat = "Identity") + 
  guides(fill=FALSE) +
  xlab("Year") + ylab("Hotel Beds Supplied") +
  ggtitle("Berlin Hotel Bed Supply")



