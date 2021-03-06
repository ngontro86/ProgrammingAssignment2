## This function caches inverse matrix of the input matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  
}


## Compute inverse matrix of x for the first time and cache into memory after that
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message('getting cached matrix')
    return(inv)
  }
  mtrix <- x$get()
  inv <- solve(mtrix)
  x$setinverse(inv)
  inv
}
