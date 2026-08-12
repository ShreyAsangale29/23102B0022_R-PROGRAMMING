seq <-1:5
print(seq) # 12345
#%in% operator to check if the element exist in vector
print(3%in% c(1,2,3)) #TRUE
#matrix multiplication
mat1 <- matrix(1:4, nrow=2)
mat2 <- matrix(5:8, nrow=2)
print(mat1 %*% mat2) # %*% Matrix multiplication operator