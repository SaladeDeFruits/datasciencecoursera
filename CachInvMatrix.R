makeCacheMatrix <- function( ma= matrix()){
        mainv <- NULL
        getMatrix <-function(){
                ma
        }
        getMatrixInv <- function(ma){
                mainv <<- solve(ma)
                mainv
        }
        list(ma=getMatrix, mainv= getMatrixInv)
}