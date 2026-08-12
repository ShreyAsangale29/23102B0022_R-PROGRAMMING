#Addition with the data vectors
c(2,3,5,7)+ c(8,9)
c(2,3,5,7)+ c(8,9,10)

#Subtraction with the data vectors
c(2,3,5,7) - c(-2,-3,-5,8)
c(12,13,15,17)- c(8,9)
c(12,13,15,17)- c(8,9,10)

#Multiplication with data vectors
c(2,3,5,7) * c(-2,-3,-5,8)
c(2,3,5,7) * c(8,9,10)

#Division with data vectors
c(24,20,8,16)/ c(3,4,2,8)
c(24,20,8,16)/ c(4,2)
c(24,20,8,16)/ c(4,2,8)

#Assignment Operators
x = 20
x
x <- 20
x
x = apple
x = "apple"
x
x = 'apple'
x

#Knowing numbers and characters
x = 20
is.numeric(x)

is.character(x)

y = "apple"
is.character(y)
is.numeric(y)

#Converting numbers and characters
x= 20
is.numeric(x)
y = as.character(x)
is.numeric(y)
is.character(y)
y

y = "apple"
is.numeric(y)
is.character(y)

z = as.numeric(y)
is.numeric(z)
is.character(z)
z

#Comment operator
x<-20
x

#Case sensitivity in R
x <- 20
x
X
X<-30
X
x

#Combining values in a data vectors
y=1,2,3,4,5

y=(1,2,3,4,5)

y=c(1,2,3,4,5)
y

#Mode
x = 6
x
mode(x)

y = "apple"
y
mode(y)

x = 6
storage.mode(x)

x = TRUE
storage.mode(x)

x = "apple"
storage.mode(x)

#Infinity
3/0
5+Inf

x = 5+Inf
is.finite(x)
is.infinite(x)

#R as a Calculator
2+3
2*3
2-3
3/2
2*3-4+5/6

(2+3)*5 + 5 - 10

(((2+3)*5 + 5) - 10)/2
2+5
2 + 5
2  +  5
2  +5
#Addition with scalar
c(2,3,5,7) + 10

# Subtraction with scalar
c(12,13,15,17) - 10

#Multiplication with scalar
c(2,3,5,7) * 10

#Division with scalar
c(12,13,15,17)/10

#power operator
2^3

2**3

2^0.5
2**0.5
2^-0.5

#power operator with scalar
c(2,3,5,7)^2

#power operator with vector
c(2,3,5,7)^c(2,3)
c(1,2,3,4,5,6) ^ c(2,3,4)
c(2,3,5,7)^ c(2,3,4)

#Integer division with scalar
2%/%2
5%/%2
7%/%3

c(2,3,5,7) %/% 2

#Integer division with data vectors
c(2,3,5,7) %/% c(2,3)
c(2,3,5) %/% c(2,3)

#Modulo Division (x mode y ) with scalars
2%%2
3 %% 3
7 %% 3
7 %% 4

c(2,3,5,7) %% 2

#Modulo Division (x mode y ) with data vectors
c(2,3,5,7) %% c(2,3)
c(2,3,5) %% c(2,3)

#MAX
max(1.2,3.4,-7.8)

#MIN
min(1.2,3.4,-7.8)

#Arithmetic mean
mean(2,3,4)
mean(c(2,3,4))

#Absolute values
abs(-4)

abs(c(-1,-2,-3,4,5))

#square roots of values
sqrt(4)

sqrt(c(4,9,16,25))

#sum of values
sum(c(2,3,5,7))

#product of values
prod(c(2,3,5,7))

#round off values
round(1.23)
round(1.83)

#log(ln) natural log  of values

log(10)
log(exp(1))
log(c(10,100,1000))

#log(with base 10) of values
log10(10)
log10(100)
log10(1000)
log10(c(10, 100, 1000))

#Assignment 
x1=c(1,2,3,4)
x1

x2 = x1^2
x2

c(1,2,3,4) + sum(c(1,2,3,4)) * prod(c(1,2))
abs(c(1,2,3,4) - sum(c(1,2,3,4))*prod(c(1,2)) )

#Matrix
x = matrix(nrow = 4, ncol=2,data=c(1,2,3,4,5,6,7,8))
x

#Matrix parameters
#Accessing any element of a matrix
x
x[3,2]
#Entering data column wise in a matrix
x = matrix(nrow = 4,ncol = 2,data = c(1,2,3,4,5,6,7,8), byrow = FALSE)
x

