# Load required libraries
library(VedicDateTime)
library(ggplot2)
library(dplyr)
library(lubridate)

# Set location (New Delhi, India)
place <- c(28.6139, 77.2090, 5.5)

# Generate a dummy temperature time series for a year
set.seed(123)
dates_gregorian <- seq(as.Date("2025-01-01"), as.Date("2025-12-31"), by = "day")
temperature <- 1 + sin(seq(1, length(dates_gregorian), length.out = length(dates_gregorian))/10) + 
  rnorm(length(dates_gregorian), 0, 0.2)

# Create data frame
time_series <- data.frame(Date = dates_gregorian, Temperature = temperature)

# Convert Gregorian dates to Julian Day Numbers (JD)
time_series$JD <- mapply(gregorian_to_jd, year(time_series$Date), month(time_series$Date), day(time_series$Date))

# Compute Hindu dates: we extract the Hindu month (Masa) and Tithi (for illustration)
time_series$Hindu_Masa <- sapply(time_series$JD, function(jd) get_masa_name(jd, place = place))
time_series$Hindu_Tithi <- sapply(time_series$JD, function(jd) get_tithi_name(jd, place = place))

# For plotting, create a simple Hindu date label using just the Hindu month.
# (You could later refine this to include year if needed.)
time_series <- time_series %>%
  mutate(Hindu_Label = Hindu_Masa)

# Select key dates for Gregorian months (start of each month)
key_dates_gregorian <- seq(from = as.Date("2025-01-01"), to = as.Date("2025-12-01"), by = "1 month")

# Identify the start of each Hindu month.
# Group by Hindu_Masa (which corresponds to the 12 months in the Vedic calendar)
hindu_month_starts <- time_series %>%
  group_by(Hindu_Masa) %>%
  summarise(Start_Date = min(Date), .groups = "drop") %>%
  arrange(Start_Date) %>%
  pull(Start_Date)

# Create labels for Hindu months (use the Hindu_Masa values)
hindu_month_labels <- time_series %>%
  filter(Date %in% hindu_month_starts) %>%
  distinct(Hindu_Masa, Date) %>%
  arrange(Date) %>%
  pull(Hindu_Masa)

# Plot temperature time series with both calendar markers
ggplot(time_series, aes(x = Date, y = Temperature)) +
  geom_line(color = "blue", size = 0.8) +  # Temperature trend
  geom_vline(xintercept = as.numeric(hindu_month_starts), color = "green", linetype = "solid", size = 0.8) +  # Hindu month markers
  geom_vline(xintercept = as.numeric(key_dates_gregorian), color = "orange", linetype = "solid", size = 0.8) +  # Gregorian month markers
  scale_x_date(
    breaks = key_dates_gregorian, 
    date_labels = "%d-%b-%Y",  # Western dates in "01-Jan-2025" format
    sec.axis = sec_axis(~., 
                        breaks = hindu_month_starts, 
                        labels = hindu_month_labels)
  ) +
  labs(y = "Temperature (°C)", x = NULL) +
  theme_minimal() +
  theme(
    axis.text.x.top = element_text(color = "green", size = 9, angle = 45, vjust = 0.5),   # Top axis: Hindu months (green)
    axis.text.x.bottom = element_text(color = "orange", size = 9, angle = 45, vjust = 0.5),  # Bottom axis: Gregorian months (orange)
    axis.title.x = element_blank(),
    axis.title.y = element_text(size = 12),
    plot.margin = margin(10, 10, 10, 10)
  )
