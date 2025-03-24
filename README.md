# Task1
![image](https://github.com/user-attachments/assets/e93b7f2b-3850-434c-ad2c-c0f3039f3865)

# Task 2
## Feature Set 1
### Overview
**Amrita Gadiyas** and **Varjyam** are specific time periods determined based on the Nakshatram (lunar mansion) of the day. These time intervals are significant in Vedic astrology:

- Amrita Gadiyas: Considered an auspicious period for initiating activities.

- Varjyam: An inauspicious period during which important tasks should be avoided.

Both these periods depend on the duration of the Nakshatram of the day and are calculated proportionally.

### Calculation Formulas

Given a Nakshatram, the formulas to determine the starting times and duration of Amrita Gadiyas and Varjyam are:

`Starting Time Formula: Starting Time of Nakshatram + (x/24) * Duration of Nakshatram`

 `Duration Formula: Duration of Nakshatram * (1.6/24)`

Where X is a predefined constant specific to each Nakshatram (see the table below).

![Screenshot 2025-03-19 at 11 58 37 PM](https://github.com/user-attachments/assets/cfcc2071-3eac-4228-a05a-1947da3781c8)

### Example Calculation
Given Data:
`Nakshatram: Aswini`

`Starting Time: 6:30 AM`

`Ending Time: 8:00 AM next day`

`Duration of Nakshatram: 25 hours 30 minutes (25.5 hours)`

### Amrita Gadiyas Calculation:

`Starting Time = 6.5 + (16.8 × 25.5) / 24 = 6.5 + 17.85 = 24.35 hours (which is 12:21 AM next day)`

`Duration = (25.5 × 1.6) / 24 = 1.7 hours = 1 hour 42 minutes`

### Varjyam Calculation:
`Starting Time = 6.5 + (20 × 25.5) / 24 = 6.5 + 21.25 = 27.75 hours (which is 3:45 AM next day)`

`Duration = 1 hour 42 minutes (same formula as above)`

### Significance

- Auspicious Activity Planning: Amrita Gadiyas are suitable for important events like weddings, business deals, and travel.

- Avoiding Inauspicious Timing: Varjyam should be avoided for new ventures, surgeries, or crucial tasks.

## Feature Set 2

### Overview 
R functions to compute important Panchangam timings based on sunrise and sunset for a given location and date. The key functions calculate:
- Rahu Kalam
- Gulika Kalam
- Yama Gandam
- Durmuhurtham

Each function utilizes astronomical principles and follows the standard calculation method found in Indian Panchangam.

### Significance of Timings

These time periods are considered significant in Hindu astrology:

- Rahu Kalam: Inauspicious period ruled by Rahu. Avoid starting new ventures.

- Gulika Kalam: Neutral period, suitable for routine tasks but not for auspicious activities.

- Yama Gandam: Inauspicious period, avoid starting important tasks.

- Durmuhurtham: Considered inauspicious, often avoided for major decisions or events.

### Calculations

- calc_rahu_kalam(sunrise, sunset, day)
  * `Start Time = Sunrise + Duration of the Day × Factor`
  * `Duration = Duration of the Day × 0.125`

   ![Screenshot 2025-03-20 at 12 08 24 AM](https://github.com/user-attachments/assets/0f70a583-62ec-4eaf-8c14-6110aa2d9bcb)

- calc_gulika_kalam(sunrise, sunset, day)
  * `Start Time = Sunrise + Duration of the Day × Factor`
  * `Duration = Duration of the Day × 0.125`
    
   ![Screenshot 2025-03-20 at 12 09 47 AM](https://github.com/user-attachments/assets/b7c616b4-e5f6-44c5-a48e-3e845ef05816)

- calc_yama_gandam(sunrise, sunset, day)
  * `Start Time = Sunrise + Duration of the Day × Factor`
  * `Duration = Duration of the Day × 0.125`
    
   ![Screenshot 2025-03-20 at 12 10 47 AM](https://github.com/user-attachments/assets/7f60920a-e8db-4206-891f-2f62d1ce682b)

- calc_durmuhurtham(sunrise, duration_day)
  * `First Start Time = Sunrise + Duration of the Day × (10.4 / 12)`
  * `Second Start Time = Sunrise + Duration of the Day × (6.4 / 12)`
  * `Duration = Duration of the Day × (0.8 / 12)`
    
   ![Screenshot 2025-03-20 at 12 11 42 AM](https://github.com/user-attachments/assets/8ee190a8-ef44-4623-89c7-3c3bad683d61)



## Task3
DummyPackage is an R package designed for demonstration purposes, containing a set of dummy functions for string and numeric calculations. The package serves as a template for learning and experimenting with R package development, function structuring, and documentation.

### Installation

To use DummyPackage, you can install it from the source folder where it is located.
```
# Install the package from the local directory

git clone https://github.com/SKG24/VedicDateTime.git

install.packages("Dummy_Package", repos = NULL, type = "source")

# Load the package

library(DummyPackage)
```
## Functions
- dummy_function1
```
  dummy_function1 <- function() {
  return("Hello from function 1!")
}
```
- dummy_function2
```
  dummy_function2 <- function(x) {
  return(x^2)
}
```
- dummy_function3
```
  dummy_function3 <- function(a, b) {
  return(paste(a, b))
}
```
- dummy_function4
```
  dummy_function4 <- function(n) {
  return(seq(1, n))
}
```
- dummy_function5
```
  dummy_function5 <- function(v) {
  return(mean(v, na.rm = TRUE))
}
```

### Usage

Load the package in R using:

`library(DummyPackage)`

### Addressing Timezone Note Issue

During package development, a note was encountered related to timezone recognition. This issue couldn't be resolved by explicitly setting the timezone in a system-recognized format:

`Sys.setenv(TZ = "Asia/Kolkata")`

![Screenshot 2025-03-20 at 10 16 59 AM](https://github.com/user-attachments/assets/52b1aecb-3f97-4e9c-91ac-348bb56d80ab)

### License

This package is released under the MIT License.

### Maintainer

Sanat Kumar Gupta (sgupta_be22@thapar.edu)
