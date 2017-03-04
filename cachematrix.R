## The function makeCacheMatrix creates a speacial matrix which
## is a list containing the following fuctions

## set the value of matrix
## get the value of matrix
## set the value of inverse
## get the value of inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function()
    x
  setinverse <- function(solve)
    m <<- solve
  getinverse <- function()
    m
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
  
}
## The following function calculates the "inverse" of the
## special matrix created with the above function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
