#Missing values
x=NA
is.na(x)
#Missing data using vector (it will show if its value is there or not)
x=c(11,NA, 13, NA)
is.na(x)

#How to work with missing data
x =c(11, NA, 13, NA)
mean(x)
mean(x, na.rm = TRUE)

#NA versus NULL
#Missing data: Location of missing values
x =c(11, NA, 13, NA)
x
which(is.na(x))

#Missing data count
x = c(11,NA, 13,NA)
x
sum(is.na(x))

#Finding complete cases
x = c(11,NA, 13, NA)
x
complete.cases(x)

#Find complete data set
x = c(11, NA, 13, NA)
x
y=na.omit(x)
y

#Missing data-Handling values
x = c(11, NA, 13, NA)
y=na.omit(x)
y
mean(x)
mean(y)

#Conditional execution:if()
#if(condition){execution commands if condition is TRUE}
x = 5
if(x>4) {x*3}
x = 3
if(x>4) {x*3}

x = 6
if(x>3){
  print("The value is more than 3")
}

#Condition execution:if else()
x = 5
if(x==3) {x= x-1} else{x =2*x}
x

x = 3
if(x==3) {x= x-1} else{x =2*x}
x
#1)
x = 6
if(x>3){
  print("The value is more than 3")
} else{
  print("The value is less than 3")
}

#2)

x = 2
if(x>3){
  print("The value is more than 3")
} else{
  print("The value is less than 3")
}

#Control structure in R
#Control statements,Fucntions, Loops
#Nested if else if()
x = 5
if (x==3) {
  x = x-1
}else if (x < 3){
  x= x+5
}else{x=2*x}
x

#Example 2
x = 2
if (x==3) {
  x = x-1
}else if (x < 3){
  x= x+5
}else{x=2*x}
x

#Example 3
x = 3
if (x==3) {
  x = x-1
}else if (x < 3){
  x= x+5
}else{x=2*x}
x

#ifelse()
x = 1:10
x
ifelse(x<6, x^2, x+1)

#Example -1
x = c(7,9,8,4)
ifelse(x %% 2 == 0,"even number","odd number")

#Some functions useful in condition execution :switch()
switch(2,"apple","banana","orange")

switch(1,"apple","banana","orange")

#Example
switch("colour","colour" = "blue", "gender" = "male", "volume" = 50)

switch("volume", "colour" = "blue", "gender" = "male", "volume" = 50)

#no outcome
switch(4,"apple","banana","orange")

#which()
x = c(10,15,8,14,6,12)
x
which(x == 14)
which(x != 12)
which( x> 10)

#Example-1
x =  matrix(nrow =3, ncol=3, data=1:9)
x
which.min(x) #find which is the minimum value
which.max(x) #find which is the maximum value
which(x %% 2 == 1)
which(x %% 2 == 1, arr.ind = TRUE)
