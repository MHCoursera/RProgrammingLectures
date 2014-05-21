## subsetting a list 
x<-list(foo=1:4,bar=0.6)
x
x[1]      # returns foo as a list, single bracket always returns same class
x[[1]]    # returns only the values (vector?)
x[1][[1]] # does the same as above
isclass<-x[[1]]
class(isclass)  #numbers are an integer vector
x$bar      # pull by name - no need to know the sequence
x[["bar"]]   # can do same as a string
x["bar"]      # same as x[1]
# why use [[ instead of $??? - Sometimes name is calculated
name<-"foo"
x[[name]]
#
# Nested elements
x<-list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]   # does same as above
#
#  Partial matching allowed with [[ and $]]
x<-list(aardvark=1:5,baby="baby","ark","contest")
x
x$a       # looks for things that start with a
x$b
x[["a"]]  # looks for EXACT match of "a"
x[["a",exact=FALSE]] # same as $a 
#
# Remove NA from data - first create a logical vector
x<-c(1,2,NA,4,NA,6)
bad<-is.na(x)
bad
x[!bad]  # bang operator is the opposite, so now we subset all that are TRUE from bad
#
#  Complete cases function
x<-c(1,2,NA,4,NA,6)
y<-c("a","b",NA,"d","e",NA)
good<-complete.cases(x,y) creates logical vector
good
x[good]     # uses logical vector to specify values
y[good]
