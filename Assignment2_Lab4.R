# Lab 4: Advanced Missing Data Handling
# Topic: NA, NULL, NaN, Missing-Value Detection and Imputation

rm(list = ls())

library(naniar)
library(skimr)
adult_data <- read.csv(file.choose())
dim(adult_data)
names(adult_data)
head(adult_data)
str(adult_data)
sum(is.na(adult_data))
colSums(is.na(adult_data))
sum(is.nan(adult_data$fnlwgt))
sapply(adult_data, function(x) {
  if (is.numeric(x)) {
    sum(is.nan(x))
  } else {
    0
  }
})
x <- NULL

is.null(x)
is.null(adult_data$Age)
sum(adult_data$Workclass == "", na.rm = TRUE)
sapply(adult_data, function(x) {
  if (is.character(x)) {
    sum(x == "", na.rm = TRUE)
  } else {
    0
  }
})
adult_data$Age_numeric <- suppressWarnings(
  as.numeric(trimws(adult_data$Age))
)
head(adult_data$Age_numeric, 10)
missing_data <- adult_data
# Introduce NA
missing_data$Age_numeric[10] <- NA

# Introduce NaN
missing_data$Education_Num[20] <- NaN

# Introduce blank string
missing_data$Workclass[30] <- ""

# Introduce impossible age
missing_data$Age_numeric[40] <- 999
missing_data$Age_numeric[10]
missing_data$Education_Num[20]
missing_data$Age_numeric[40]
is.na()
is.nan()
missing_data$Workclass == ""
is.na(missing_data$Age_numeric[10])
sum(is.na(missing_data$Age_numeric))
is.nan(missing_data$Education_Num[20])
sum(is.nan(missing_data$Education_Num))
x <- NULL

is.null(x)
is.null(missing_data$Age_numeric)
sum(missing_data$Workclass == "", na.rm = TRUE)
sapply(missing_data, function(x) {
  if (is.character(x)) {
    sum(x == "", na.rm = TRUE)
  } else {
    0
  }
})
sum(missing_data$Age_numeric == 999, na.rm = TRUE)
which(missing_data$Age_numeric == 999)
miss_var_summary(missing_data)
naniar::miss_var_summary(missing_data)
sum(missing_data$Age_numeric == 999, na.rm = TRUE)
missing_data$Age_numeric[
  missing_data$Age_numeric == 999
] <- NA
sum(missing_data$Age_numeric == 999, na.rm = TRUE)
sum(is.na(missing_data$Age_numeric))
sum(missing_data$Workclass == "", na.rm = TRUE)
missing_data$Workclass[
  missing_data$Workclass == ""
] <- "Unknown"
sum(missing_data$Workclass == "", na.rm = TRUE)
character_columns <- names(
  missing_data[
    sapply(missing_data, is.character)
  ]
)

for (col in character_columns) {
  
  missing_data[[col]][
    missing_data[[col]] == ""
  ] <- "Unknown"
}
sapply(missing_data, function(x) {
  if (is.character(x)) {
    sum(x == "", na.rm = TRUE)
  } else {
    0
  }
})
median_impute <- function(x) {
  
  median_value <- median(
    x,
    na.rm = TRUE
  )
  
  x[is.na(x)] <- median_value
  
  return(x)
}
test_values <- c(10, 20, NA, 30, 40, NA)

median_impute(test_values)
numeric_columns <- names(
  missing_data[
    sapply(missing_data, is.numeric)
  ]
)

numeric_columns
for (col in numeric_columns) {
  missing_data[[col]] <- median_impute(
    missing_data[[col]]
  )
}
naniar::miss_var_summary(missing_data)
is.na(NaN)
is.na(x)
complete_before <- complete.cases(adult_data)

sum(complete_before)
sum(!complete_before)
complete_after <- complete.cases(missing_data)

sum(complete_after)
sum(!complete_after)
before_summary <- naniar::miss_var_summary(adult_data)
after_summary <- naniar::miss_var_summary(missing_data)

before_summary
after_summary
naniar::vis_miss(adult_data)
naniar::vis_miss(missing_data)
skimr::skim(missing_data)
sum(missing_data$Age_numeric == 999, na.rm = TRUE)
sapply(missing_data, function(x) {
  if (is.character(x)) {
    sum(x == "", na.rm = TRUE)
  } else {
    0
  }
})
sum(missing_data$Workclass == "Unknown")
sapply(missing_data, function(x) {
  if (is.numeric(x)) {
    sum(is.na(x))
  } else {
    0
  }
})

names(final_adult_data)
cat("===== FINAL ADULT DATA VALIDATION =====\n\n")

cat("Rows:", nrow(final_adult_data), "\n")
cat("Columns:", ncol(final_adult_data), "\n\n")

cat("Missing values:\n")
print(colSums(is.na(final_adult_data)))

cat("\nBlank categorical values:\n")
print(sapply(final_adult_data, function(x) {
  if (is.character(x)) {
    sum(x == "", na.rm = TRUE)
  } else {
    0
  }
}))

cat("\nAge = 999 values:",
    sum(final_adult_data$Age == 999, na.rm = TRUE), "\n")
if (!dir.exists("output")) {
  dir.create("output")
}
write.csv(
  final_adult_data,
  "output/cleaned_adult_data.csv",
  row.names = FALSE
)
file.exists("output/cleaned_adult_data.csv")