## Matrix object with a cached inverse function

## Create a matrix object with support for cached inverse calculation
## Usabe example: m <- makeCacheMatrix(matrix(1:4, 2, 2))
makeCacheMatrix <- function(x = matrix()) {
    # storage for cache inverse
    inverse <- NULL

    # setters and getters
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setInverse <- function(inv) inverse <<- inv
    getInverse <- function() inverse

    # create object
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Calculate the inverse of matrix x, using a cache if inverse has been previously calculated.
## Usage example: m$get() %*% cacheSolve(m)
cacheSolve <- function(x, ...) {
    inverse <- x$getInverse()
    if(!is.null(inverse)) {
        message("using cached data")
    }
    else {
        data <- x$get()
        inverse <- solve(data, ...)
        x$setInverse(inverse)
    }
    # return a matrix that is the inverse of 'x'
    inverse
}
