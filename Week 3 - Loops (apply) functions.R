#
# lapply - loop over a list and evaluate a function on each element L = LIST

# sapply - same but try to simplify the result S = SIMPLIFY

# apply - apply over an array A = ARRAY

# tapply - apply over a vector T = vecTor or TABLE

# mapply - multivariate version of lapply

# split is commonly used with these functions

# lapply(X, FUN, ...)

# sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)

# vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)


## lapply
str(lapply)
# always returns a list.  Will coerce input to a list also.

x<- list(a=1:5, b=rnorm(10))  # create list
lapply(x,mean)   # use lapply

?runif
x<-1:4
lapply(x,runif)
lapply(x,runif,min=0, max=10)    # these are arguments for runif, not lapply, but passed by...

# apply functions make it feasible to use functions created on the fly ANONYMOUS FUNCTIONS
x<-list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))   # create list with two matrices in it
x
lapply(x,function(elt) elt[,1])  #creates function elt that returns first element of matrix


## sapply - simplifies results if possible (i.e. from LIST down to something else)
x<- list(a=1:5, b=rnorm(10))  # create list
y<-lapply(x,mean)
class(y)   # list
y<-sapply(x,mean)
class(y)   # numeric vector


## apply
str(apply)
# most often used to apply a function to row(s) or column(s) of a matrix
?apply
#  apply(X, MARGIN, FUN, ...)
        #  MARGIN = a vector giving the subscripts which the function will be applied over.
        #  Where X has named dimnames, it can be a character vector selecting dimension names.
        #  E.g., for a matrix 1 indicates rows, 2 indicates columns, c(1, 2) indicates rows and columns.
x<-matrix(rnorm(200),20,10)  # 20 rows, 10 columns
head(x)
apply(x,2,mean)  # applies to the 10 columns

### There are built in functions that use the apply functions as follows.  Much faster.
# rowSums = apply(x,1,sum)
# rowMeans = apply(x,1,mean)
# colSums = apply(x,2,sum)
# colMeans = apply(x,2,mean)
colMeans(x)

# Other functions you can use with apply
x<-matrix(rnorm(200),20,10)  # 20 rows, 10 columns
apply(x,1,quantile,probs=c(.25,.75))  #(for each row, calc the 25th and 75th percentiles)
quants<-apply(x,1,quantile,probs=c(.25,.75))
class(quants)

# average a matrix in an array
a<-array(rnorm(2*2*10), c(2,2,10))  # creates 3D matrix of 10 2x2 matrices. 2*2*10 could be 40
apply(a,c(1,2),mean)  # yields another 2x2 with the mean of the 10.  specifies rows AND columns
# would use 3 for third dimension if you wanted that
# rowMeans will still work.
rowMeans(a,dims=2) # tells it to use first two dimensions


## tapply   (vectors)
str(tapply)
# function (X, INDEX, FUN = NULL, ..., simplify = TRUE) 
# INDEX is a factor or list of factors - e.g. Men vs Women
x<-c(rnorm(10),runif(10),rnorm(10,1))
# rnorm vs runif
# rnorm(n, mean = , sd = ) is used to generate n normal random numbers with arguments mean and sd
# runif(n, a = , b = ) is used to generate n uniform random numbers lie in the interval (a, b)
f<-gl(3,10) 
# gl = generate factor levels - 3=# of levels, 10=length
tapply(x,f,mean)   # creates table (see below) and calcs mean for each
table(f)    # look at factors and occurrences
# tapply assumes simplify = TRUE, if FALSE you get back a list
tapply(x,f,range) # different function


## split
str(split)
# splits a vector or other objects and splits it into groups determined by factors
x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
split(x,f)   # returns a list.  Each element of the list is the members of each element
# can split a data.frame
library(datasets)
head(airquality)
s<-split(airquality,airquality$Month)
s  # creates separate data frames for each month as $1 to $12
lapply(s,function(x) colMeans(x[c("Ozone","Solar.R", "Wind")]))
# has NAs in it, but gives nice table of means of all items by month
# returns as a rather complicated looking list
sapply(s,function(x) colMeans(x[c("Ozone","Solar.R", "Wind")]))
# now a clean matrix of data, but still NAs
sapply(s,function(x) colMeans(x[c("Ozone","Solar.R", "Wind")],na.rm=TRUE))
# perfect

# splitting on more than one level
x<-rnorm(10)
f1<-gl(2,5)
f1
f2<-gl(5,2)
f2
?interaction
interaction(f1,f2)
# interaction is assumed and called by split function
z<-split(x,list(f1,f2))
str(z)     # has some empty levels - that's just how it is - OK
z<-split(x,list(f1,f2), drop=TRUE)  # drops empty levels
str(z) 


## mapply - multivariate
# other xapply functions only operate on one object, even if that object can be a matrix
# could write a loop to do multiple objects, but mapply will do it
str(mapply)
# ... are the objects to apply against
# MoreArgs is a list of other arguments to the function (FUN)

# simple example - use it to simply repetitive things
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
# OR
mapply(rep,1:4,4:1)

# Another example - vectorizing a function
noise<-function(n,mean,sd){     # creates a function to generate n variables with specified mean and sd
        rnorm(n,mean,sd)
}
set.seed(400)
a<-noise(5,1,2)   # calls and you get 5 variables with those stats
a
mean(a)
sd(a)

# if you try to send vectors for the arguments - not what you want
set.seed(400)
noise(1:5, 1:5, 2)    # what you want is 1 variable with 1 as mean, 2 with 2, etc.
mapply(noise,1:5, 1:5, 2)  # mapply fixes it

