# Load the vedicdatetime library
library(VedicDateTime)

## Feature set 1

# Lookup table for Amrita Gadiyas and Varjyam start times
nakshatra_table <- data.frame(
  Nakshatram = c("Aswini", "Bharani", "Krittika", "Rohini", "Mrigasira", "Aridra", "Punarvasu",
                 "Pushya", "Aslesha", "Makha", "Pubba", "Uttara", "Hasta", "Chitta", "Swati",
                 "Visakha", "Anuradha", "Jyeshta", "Moola", "Poorvashadha", "Uttarashadha",
                 "Sravana", "Dhanishta", "Satabhisha", "Poorvabhadra", "Uttarabhadra", "Revati"),
  Amrita_X = c(16.8, 19.2, 21.6, 20.8, 15.2, 14, 21.6, 17.6, 22.4, 21.6, 17.6, 16.8, 18, 17.6,
               15.2, 15.2, 13.6, 15.2, 17.6, 19.2, 17.6, 13.6, 13.6, 16.8, 16, 19.2, 21.6),
  Varjyam_X = c(20, 9.6, 12, 16, 5.6, 8.4, 12, 8, 12.8, 12, 8, 7.2, 8.4, 8, 5.6, 5.6, 4, 5.6, 
                8, 9.6, 8, 4, 4, 7.2, 6.4, 9.6, 12)
)
#Moola has two values in varjyam (8,22.4) but i have used 8

# Function to compute Amrita Gadiyas and Varjyam
calculate_amrita_varjyam <- function(nakshatram_name, start_time, duration_hours) {
  # Get x values from the table
  nakshatram_info <- subset(nakshatra_table, Nakshatram == nakshatram_name)
  
  if (nrow(nakshatram_info) == 0) {
    stop("Invalid Nakshatram name provided.")
  }
  
  amrita_x <- nakshatram_info$Amrita_X
  varjyam_x <- nakshatram_info$Varjyam_X
  
  # Compute Amrita Gadiyas start time and duration
  amrita_start <- start_time + (amrita_x * duration_hours / 24)
  amrita_duration <- duration_hours * 1.6 / 24
  
  # Compute Varjyam start time and duration
  varjyam_start <- start_time + (varjyam_x * duration_hours / 24)
  varjyam_duration <- duration_hours * 1.6 / 24
  
  return(list(
    Amrita_Start = amrita_start,
    Amrita_Duration = amrita_duration,
    Varjyam_Start = varjyam_start,
    Varjyam_Duration = varjyam_duration
  ))
}

# Example Usage
start_time <- 6.5  # 6:30 AM (converted to 6.5 hours)
duration_hours <- 25.5  # Example duration

result <- calculate_amrita_varjyam("Aswini", start_time, duration_hours)

# Print results
print(paste("Amrita Gadiyas start time:", result$Amrita_Start, "hours"))
print(paste("Amrita Gadiyas duration:", result$Amrita_Duration, "hours"))
print(paste("Varjyam start time:", result$Varjyam_Start, "hours"))
print(paste("Varjyam duration:", result$Varjyam_Duration, "hours"))



## Feature set 2

# Function to calculate Rahu Kalam
calc_rahu_kalam <- function(sunrise, sunset, day) {
  day_factors <- c("Sunday" = 0.875, "Monday" = 0.125, "Tuesday" = 0.75, 
                   "Wednesday" = 0.5, "Thursday" = 0.625, "Friday" = 0.375, "Saturday" = 0.25)
  
  duration_day <- as.numeric(difftime(sunset, sunrise, units = "hours"))
  start_time <- sunrise + duration_day * day_factors[day]
  duration <- duration_day * 0.125
  
  return(list(start_time = start_time, duration = duration))
}

# Function to calculate Gulika Kalam
calc_gulika_kalam <- function(sunrise, sunset, day) {
  day_factors <- c("Sunday" = 0.75, "Monday" = 0.625, "Tuesday" = 0.5, 
                   "Wednesday" = 0.375, "Thursday" = 0.25, "Friday" = 0.125, "Saturday" = 0)
  
  duration_day <- as.numeric(difftime(sunset, sunrise, units = "hours"))
  start_time <- sunrise + duration_day * day_factors[day]
  duration <- duration_day * 0.125
  
  return(list(start_time = start_time, duration = duration))
}

# Function to calculate Yama Gandam
calc_yama_gandam <- function(sunrise, sunset, day) {
  day_factors <- c("Sunday" = 0.5, "Monday" = 0.375, "Tuesday" = 0.25, 
                   "Wednesday" = 0.125, "Thursday" = 0.75, "Friday" = 0.625, "Saturday" = 0)
  
  duration_day <- as.numeric(difftime(sunset, sunrise, units = "hours"))
  start_time <- sunrise + duration_day * day_factors[day]
  duration <- duration_day * 0.125
  
  return(list(start_time = start_time, duration = duration))
}

# Function to calculate Durmuhurtham
calc_durmuhurtham <- function(sunrise, duration_day) {
  first_start <- sunrise + duration_day * (10.4 / 12)
  first_duration <- duration_day * (0.8 / 12)
  
  second_start <- sunrise + duration_day * (6.4 / 12)
  second_duration <- duration_day * (0.8 / 12)
  
  return(list(first_start = first_start, first_duration = first_duration,
              second_start = second_start, second_duration = second_duration))
}


# Define sunrise and sunset time
sunrise <- as.POSIXct("2009-06-21 04:32:00")
sunset <- as.POSIXct("2009-06-21 18:16:00")
day <- "Sunday"

# Compute timings
rahu_kalam <- calc_rahu_kalam(sunrise, sunset, day)
gulika_kalam <- calc_gulika_kalam(sunrise, sunset, day)
yama_gandam <- calc_yama_gandam(sunrise, sunset, day)
durmuhurtham <- calc_durmuhurtham(sunrise, as.numeric(difftime(sunset, sunrise, units = "hours")))

# Print results
print(rahu_kalam)
print(gulika_kalam)
print(yama_gandam)
print(durmuhurtham)


