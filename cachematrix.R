## Matrix object with a cached inverse function

## Create a matrix object with support for cached inverse calculation
## Usabe example: m <- makeCacheMatrix(matrix(1:9, 3, 3))
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setInverse <- function(inv) inverse <<- inv
    getInverse <- function() inverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Calculate the inverse of matrix x, using a cache if inverse has been previously calculated.
cacheSolve <- function(x, ...) {

            ## Return a matrix that is the inverse of 'x'
}
