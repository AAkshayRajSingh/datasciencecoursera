## makeCacheMatrix creates a matrix able to store its inverse
## cacheSolve retrieves or calculates the matrix inverse 

## makeCacheMatrix creates a list of 4 containing a function to
## set the value of the matrix, get the value of the matrix, 
## set the value of the inverse, get the value of the inverse.

makeCacheMatrix<-function(x=matrix()){
        inv<-NULL
        set<-function(y){
                x<<-y
                inv<<-NULL
        }
        get<-function(){
                x
        }
        setInverse<-function(inverse){
                inv<<-inverse
        }
        getInverse<-function(){
                inv
        }
        list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

## cacheSolve checks if inverse has not already been calculated. 
## if so, it retrieves the cached object
## else it calculated the inverse and stores it.

cacheSolve<-function(x,...){
        inv<-x$getInverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        mat<-x$get()
        inv<-solve(mat,...)
        x$setInverse(inv)
}
}
## Here are three test cases to test my code
# #output
# #> source("makeCacheMatrix.R")
# #> 
# #>  pmatrix<-makeCacheMatrix(matrix(1:4,nrow=2,ncol=2))
# > pmatrix$get()
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > pmatrix$getInverse()
# NULL
# > cacheSolve(pmatrix)
# > pmatrix$getInverse()
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > pmatrix$getInverse()
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > cacheSolve(pmatrix)
# getting cached data
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# #