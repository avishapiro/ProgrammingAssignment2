## These functions allow the creation of a matrix object, the computation of the
#  inverse of the matrix, and the storing of the inverse in the cache.
#  If the inverse of a certain matrix is already stored in the cache, it will
#  not be computed again.


## makeCacheMatrix takes an optional matrix argument and returns a list of
# functions allowing the storage and retrieval of a matrix and its inverse but
# *not* the computation of the inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL  # reset inverse given a new matrix
    }
    get <- function() {x}
    setinverse <- function(inverse) {inv <<- inverse}
    getinverse <- function() {inv}
    return(list(set = set, get = get,
                setinverse = setinverse, getinverse = getinverse))
}

## cacheSolve takes the output of makeCacheMatrix as input and calculates the
#  inverse of the matrix if it is not already stored in cache, then returns the
#  matrix inverse.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("Getting cached data...")
        return(inv)          # Return inverse when it is in cache.
    }
    data <- x$get()
    inv <- solve(data, ...)  # Calculate matrix inverse.
    x$setinverse(inv)
    return(inv)              # Return a matrix that is the inverse of 'x'.
}
