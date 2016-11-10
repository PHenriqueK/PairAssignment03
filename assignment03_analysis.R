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

######### Paulo's code
#log Airbnb Apt Supply (simple model)
#analysis_simple$log_ABsupply <- log(analysis_data$AB_supply)

#dropping some variables
<<<<<<< Updated upstream
#analysis_simple <- analysis_data[, c("NID", "neighbourhood", "year_month", "occup_rate", "AB_supply", "log_ABsupply", "avg_inc", "ue_rate" )]


######Dan's code
# adding log Airbnb supply column to analysis_data
analysis_data$log_ABsupply <-  log(analysis_data$AB_supply)

# Adding log Hotel occupancy to analysis_data
analysis_data$log_OccupRate <-  log(analysis_data$occup_rate)

# Histograms
hist(analysis_data$occup_rate)
hist(analysis_data$AB_supply)
hist(analysis_data$log_OccupRate)
hist(analysis_data$log_ABsupply)

# Plotting Airbnb supply against hotel occupancy rates
qplot(analysis_data$occup_rate, analysis_data$AB_supply, data = analysis_data,
      xlab = "Hotel Occupancy Rate", 
      ylab = "Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Plotting log_ABsupply against hotel occupancy rates
qplot(analysis_data$occup_rate, analysis_data$log_ABsupply, data = analysis_data,
      xlab = "Hotel Occupancy Rate", 
      ylab = "Log Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Plotting log_ABsupply against log_HotelOccup
qplot(analysis_data$log_OccupRate, analysis_data$log_ABsupply, data = analysis_data,
      xlab = "Hotel Occupancy Rate", 
      ylab = "Log Airbnb Supply",
      main = "The Effect of Airbnb on Hotel Occupancy Rates" ) +
  geom_smooth(method = "lm", se = FALSE) 

# Creating Neighborhood subsets?
Neukolln_Subset <- subset(analysis_data, analysis_data$NID==8)

# Creating Year subsets?
Subset_2012 <- subset(analysis_data, analysis_data$year==2012)

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
ggplot(data=analysis_data, aes(x=analysis_data$year, y=analysis_data$beds, fill=analysis_data$year)) + 
  geom_bar(colour="black", fill="#DD8888", width=.5, stat = "Identity") + 
  guides(fill=FALSE) +
  xlab("Year") + ylab("Hotel Beds Supplied") +
  ggtitle("Berlin Hotel Bed Supply")



=======
analysis_simple <- analysis_data[, c("NID", "neighbourhood", "year_month", "occup_rate", "AB_supply", "log_ABsupply", "avg_inc", "ue_rate" )]
>>>>>>> Stashed changes
