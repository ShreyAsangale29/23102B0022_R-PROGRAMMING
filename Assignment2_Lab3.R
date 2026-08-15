rm(list = ls())

cat("Lab 3: Control Flow for Data Cleaning\n")
cat("=====================================\n")
rm(list = ls())
heart_data <- read.csv(file.choose())
head(heart_data)
dim(heart_data)
names(heart_data)
str(heart_data)
summary(heart_data)
summary(heart_data$trestbps)
sum(is.na(heart_data$trestbps))
range(heart_data$trestbps, na.rm = TRUE)
cleaning_data <- heart_data
head(cleaning_data)
cleaning_data$trestbps[1] <- -50
cleaning_data$trestbps[2] <- 320
cleaning_data$trestbps[3] <- 350
cleaning_data$trestbps[4] <- NA
cleaning_data$trestbps[1:10]
clean_bp <- function(bp) {
  
  if (is.na(bp)) {
    return(NA)
    
  } else if (bp < 0) {
    return(NA)
    
  } else if (bp > 250) {
    return(250)
    
  } else {
    return(bp)
  }
}
clean_bp(-50)
clean_bp(320)
clean_bp(130)
clean_bp(NA)
cleaning_data$trestbps_clean <- sapply(
  cleaning_data$trestbps,
  clean_bp
)
head(cleaning_data[, c("trestbps", "trestbps_clean")], 10)
names(cleaning_data)
head(cleaning_data$trestbps_clean, 10)
data.frame(
  Original = cleaning_data$trestbps[1:10],
  Cleaned = cleaning_data$trestbps_clean[1:10]
)
sum(cleaning_data$trestbps_clean < 0, na.rm = TRUE)
sum(cleaning_data$trestbps_clean > 250, na.rm = TRUE)
sum(is.na(cleaning_data$trestbps_clean))
min(cleaning_data$trestbps_clean, na.rm = TRUE)
max(cleaning_data$trestbps_clean, na.rm = TRUE)
mean(cleaning_data$trestbps_clean, na.rm = TRUE)
median(cleaning_data$trestbps_clean, na.rm = TRUE)
summary(cleaning_data$trestbps_clean)
data.frame(
  Original = cleaning_data$trestbps[1:10],
  Cleaned = cleaning_data$trestbps_clean[1:10]
)
safe_mean_bp <- function(bp) {
  
  tryCatch(
    {
      mean(bp, na.rm = TRUE)
    },
    
    warning = function(w) {
      message("Warning while calculating mean BP: ", w$message)
      mean(bp, na.rm = TRUE)
    },
    
    error = function(e) {
      message("Error while calculating mean BP: ", e$message)
      return(NA)
    }
  )
}
mean_bp <- safe_mean_bp(cleaning_data$trestbps_clean)

mean_bp
safe_mean_bp(c("abc", "xyz"))
safe_chol_ratio <- function(chol, bp) {
  
  tryCatch({
    
    if (is.na(chol) || is.na(bp)) {
      stop("Cholesterol or BP is missing")
    }
    
    if (!is.numeric(chol) || !is.numeric(bp)) {
      stop("Cholesterol and BP must be numeric")
    }
    
    if (bp <= 0) {
      stop("BP denominator must be greater than zero")
    }
    
    chol / bp
    
  }, 
  
  error = function(e) {
    message("Unable to calculate cholesterol/BP ratio: ", e$message)
    return(NA)
  })
}
safe_chol_ratio(200, 120)
safe_chol_ratio(200, 0)
safe_chol_ratio(200, NA)
safe_chol_ratio("abc", 120)
cleaning_data$chol_bp_ratio <- mapply(
  safe_chol_ratio,
  cleaning_data$chol,
  cleaning_data$trestbps_clean
)
head(
  cleaning_data[, c("chol", "trestbps_clean", "chol_bp_ratio")],
  10
)
bp_loop <- cleaning_data$trestbps

for (i in 1:length(bp_loop)) {
  
  if (is.na(bp_loop[i])) {
    bp_loop[i] <- NA
    
  } else if (bp_loop[i] < 0) {
    bp_loop[i] <- NA
    
  } else if (bp_loop[i] > 250) {
    bp_loop[i] <- 250
  }
}
head(bp_loop, 10)
sum(bp_loop < 0, na.rm = TRUE)
sum(bp_loop > 250, na.rm = TRUE)
identical(
  bp_loop,
  cleaning_data$trestbps_clean
)
bp_vectorized <- cleaning_data$trestbps

bp_vectorized[bp_vectorized < 0] <- NA

bp_vectorized[bp_vectorized > 250] <- 250
head(bp_vectorized, 10)
sum(bp_vectorized < 0, na.rm = TRUE)
sum(bp_vectorized > 250, na.rm = TRUE)
identical(
  bp_loop,
  bp_vectorized
)
loop_time <- system.time({
  
  bp_loop_test <- cleaning_data$trestbps
  
  for (i in 1:length(bp_loop_test)) {
    
    if (is.na(bp_loop_test[i])) {
      bp_loop_test[i] <- NA
      
    } else if (bp_loop_test[i] < 0) {
      bp_loop_test[i] <- NA
      
    } else if (bp_loop_test[i] > 250) {
      bp_loop_test[i] <- 250
    }
  }
})

loop_time
vector_time <- system.time({
  
  bp_vectorized_test <- cleaning_data$trestbps
  
  bp_vectorized_test[bp_vectorized_test < 0] <- NA
  bp_vectorized_test[bp_vectorized_test > 250] <- 250
})

vector_time
time_comparison <- data.frame(
  Method = c("For Loop", "Vectorized"),
  User_Time = c(loop_time["user.self"],
                vector_time["user.self"]),
  System_Time = c(loop_time["sys.self"],
                  vector_time["sys.self"]),
  Elapsed_Time = c(loop_time["elapsed"],
                   vector_time["elapsed"])
)

time_comparison
identical(bp_loop_test, bp_vectorized_test)
cat("===== FINAL BP VALIDATION =====\n")

cat("Missing BP values:",
    sum(is.na(cleaning_data$trestbps_clean)), "\n")

cat("Minimum BP:",
    min(cleaning_data$trestbps_clean, na.rm = TRUE), "\n")

cat("Maximum BP:",
    max(cleaning_data$trestbps_clean, na.rm = TRUE), "\n")

cat("Mean BP:",
    mean(cleaning_data$trestbps_clean, na.rm = TRUE), "\n")

cat("Median BP:",
    median(cleaning_data$trestbps_clean, na.rm = TRUE), "\n")

cat("Negative BP values:",
    sum(cleaning_data$trestbps_clean < 0, na.rm = TRUE), "\n")

cat("BP values > 250:",
    sum(cleaning_data$trestbps_clean > 250, na.rm = TRUE), "\n")
final_heart_data <- cleaning_data

final_heart_data$trestbps <- final_heart_data$trestbps_clean

final_heart_data$trestbps_clean <- NULL
names(final_heart_data)
if (!dir.exists("output")) {
  dir.create("output")
}
write.csv(
  final_heart_data,
  "output/cleaned_heart_data.csv",
  row.names = FALSE
)
file.exists("output/cleaned_heart_data.csv")
dim(final_heart_data)
summary(final_heart_data$trestbps)
sum(final_heart_data$trestbps < 0, na.rm = TRUE)


#Lab-4
