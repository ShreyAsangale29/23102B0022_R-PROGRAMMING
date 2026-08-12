#Matrix Operations
x = matrix( nrow=4, ncol=3, data=c(1:12))
x
#rename rows and rename column
rownames(x) = c("r1", "r2", "r3", "r4")
x
colnames(x) = c("c1", "c2", "c3")
x
#Assigning a specified number to all matrix elements
x = matrix( nrow=4, ncol=2,data=2)
x
#Diagonal matrix
d = diag(1, nrow=3, ncol=3)
d
d = diag(5, nrow=3,ncol=3)
d
#Transpose of a matrix X:X'
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
xt = t(x)
xt
#Row and column sums
x = matrix(nrow=4, ncol =2,data=c(1,2,3,4,5,6,7,8))
x
rowSums(x)
colSums(x)
#Row and column means
x = matrix(nrow=4, ncol=2, data=c(1,2,3,4,5,6,7,8))
x
rowMeans(x)
colMeans(x)

#Access to rows,columns or submatrices
x = matrix( nrow =5, ncol=3, byrow=T, data=1:15)
x
x[3,]
x[,2]
x[4:5, 2:3]
x[c(1,4), c(1,3)]

#Addition of a matrix with a constant
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
x+5

#Substraction of a matrix with a constant
x-5

#Multiplication of a matrix with a constant
5*x

#Division of a matrix with a constant
x/2

#Addition and subtraction of matrices

x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
y = matrix(nrow=4, ncol=2, data=11:18, byrow=T)
x
y
x+y
x-y
x + 4*x
4*x - x

# Multiplication of matrices
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
y = matrix(nrow=4, ncol=2, data=11:18, byrow=T)
t(x) %*% x
x %*% t(x)

#Cross product of matrix X'X, with crossprod()
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
t(x)
crossprod(x)


#Concatenating matrices
x = matrix(nrow=3, ncol=2, data=1:6, byrow=T)
y = matrix(nrow=3, ncol=2, data=11:16, byrow=T)
x
y
rbind(x,y)
cbind(x,y)

#Inverse of matric-solve()
y = matrix(nrow=2, ncol=2, byrow=T,data = c(84,100,100,120))
y
solve(y)

#Eigen values and eigen vectors of matrix-eigen()
y = matrix(nrow=2, ncol=2, byrow=T,data = c(84,100,100,120))
y
eigen(y)


#Logical Operators and Comparisons
# use of |c and||
x =8
(x < 10) || (x < 2)

x =18
(x < 10) || (x < 2)

x =c(8,18)
(x < 10) || (x < 2)

(x < 10) | (x < 2)

#Use of & and &&
x=5
(x < 10) && (x > 2)

x=15
(x < 10) && (x > 2)

x = c(8,18)
(x < 10) && (x > 2)


(x < 10) & (x > 2)

x=1:6
(x>2) & (x<5)

# To find the values in between 2 and 5
x[(x>2) & (x<5)]

x=1:6
(x>2) | (x<5)
x[(x>2) | (x<5)]

#Example of" The longer from evaluates left to right examining only the first element of each vector"
x=1:6
(x>2) && (x<5)

(x[1]>2) & (x[1]<5)

#Example of standard logical operations
x =TRUE
y= FALSE
x&y
x|y
!x

x = 5
Logical1 = (x>2)
Logical1
is.logical(Logical1)
Logical2 = (x <10)
Logical2
is.logical(Logical2)
Logical3 = (x!=5)
Logical3
is.logical(Logical3)

x = 5
Logical4 = (2*x > 11)
Logical4
is.logical(Logical4)

Logical5 = (3*x <20)
Logical5
is.logical(Logical5)

#Example
7>7
7>=7
8<8
8<=8


9!=9
7==7
7==8
x =TRUE
!x


x = c(1,2,3)
y = c(4,5,6)
x > y
x < y
x != y
x == y

# example Is 8 less than 6?
isTRUE(8 < 6)
isTRUE(8 > 6)
isFALSE(5 < 8)
isFALSE(5 > 8)







