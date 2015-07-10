# You can run this file by entering:
#     source("plot2.R")
# in R commandline

############ Load data ############
# unzip data
message("Unzipping data...")
unzip("household_power_consumption.zip")

# load data
message("Loading data...")

# specify subset to load
library(lubridate)
file_start <- ymd_hms("2006-12-16 17:24:00")
our_data_start <- ymd_hms("2007-02-01 00:00:00")
our_data_end <- ymd_hms("2007-02-03 00:00:00")

# we need to skip rows between file_start and our_data_start (each row is for 1 minute)
minutes_to_skip <- (our_data_start - file_start)/eminutes(1)
# add 1 because of first row with col names
minutes_to_skip <- minutes_to_skip + 1
# we need to load rows between our_data_start and our_data_end
minutes_to_load <- (our_data_end - our_data_start)/eminutes(1)

# load data
power_consumption <- read.table(file = "household_power_consumption.txt", sep = ";",
                                skip = minutes_to_skip, nrows = minutes_to_load)

# add colnames
our_data_names <- read.table(file = "household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE)
colnames(power_consumption) <- colnames(our_data_names)

# remove obsolete variables
rm(file_start, our_data_start, our_data_end, minutes_to_skip, minutes_to_load, our_data_names)


############ Prepare plot ############
message("Preparing plot...")

# start plot file
png(filename = "plot2.png", width = 480, height = 480)

# prepare datetime (X values)
datetime <- paste(power_consumption$Date, power_consumption$Time, sep = " ")
datetime <- dmy_hms(datetime)

# prepare plot
plot(datetime, power_consumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# close plot file
dev.off()
rm(datetime)
message("Plot saved to file.")
