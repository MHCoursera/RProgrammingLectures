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
