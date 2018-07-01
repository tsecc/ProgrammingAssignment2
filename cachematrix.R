## The R script has 2 functions that can cache Matrix and Inversed Matrix

## The function defined 4 methods: set/get value, set/get inversed matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Check if an inversed matrix already exists, if not, set it and cache it
cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)){
    message("inverse matrix exists!")
    return(m)
  }
  data<-x$get()
  m<-solve(data)
  x$setInverse(m) #this line caches the result in x, avoid repeat computation
  m
}