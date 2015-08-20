# Test cachematrix.R
source("cachematrix.R")

# example matrix
M <- matrix(c(1,2.5,3.47,1), nrow = 2, byrow = TRUE)

# create matrix function
mymatrix <- makeCacheMatrix(M)
mymatrix

# invert matrix
mymatrixinv <- cacheSolve(mymatrix)
mymatrixinv

# check inverse is correct
mymatrixinv %*% M      # should be the identity matrix to machine precision