## Put comments here that give an overall description of what your
## functions do

## The first function 'makeCacheMatrix' creates a list containing functions to:
## 1.set the Matrix
## 2.get the Matrix
## 3.set the inverse of the matrix
## 4.get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The following function calculates the inverse of the listcreated 
## with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the matrix and sets the value of the inverse in the cache via the `setInverse`
## function.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setInverse(inverse)
  inverse## Return a matrix that is the inverse of 'x'
}
