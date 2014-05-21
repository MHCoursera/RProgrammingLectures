
## Functions

# Arguments are matched by name or position, but do not mess with order if you can avoid it

# Standard Dev function: sd(x, na.rm = FALSE)
mydata<-rnorm(100)
sd(mydata)
sd(x=mydata) #all these are the same
sd(x=mydata,na.rm=FALSE)
sd(mydata,FALSE)
sd(na.rm=FALSE, x=mydata)   # backwards, but since specified will work
sd(na.rm=FALSE, mydata)     # even this works because first argument is removed once specified

# For long argument names you can use partial match.  Checks exact first, then partial, then position

f<-function(a,b=1){      # simple function creation.  a has not default but b does.
        DO something
}

# You can build a function that modifies an existing function
myplot<-function(x,y,type="1", ...) {    # this one modifies "plot" to set type as default 1
        plot(x,y,type=type,...)               # The ... just passes all other arguments along unchanged
}

# ... argument also used when number cannot be know e.e. paste function
args(paste)   # first argument is ...
# but arguments after ... MUST be named.

# First function - Adds two values
add2<-function(x,y){
        x+y
}
add2(2,3)

# Second: Returns elements of vector above 10
above10<-function(x){
        use<-x>10 # creates logical vector on argument vector
        x[use]
}
test<-c(1,3,5,8,10,15,17,19,20)
above10(test)

# now same but specify limit instead of assuming 10
above<-function(x,y){
        use<-x>y # creates logical vector on argument vector
        x[use]
}
test<-c(1,3,5,8,10,15,17,19,20)
above(test,10)
above(test,5)

above<-function(x,y=10){     # specifies default as 10
        use<-x>y # creates logical vector on argument vector
        x[use]
}

# More complicated.  Calculates mean of each column of a data frame
columnmean<-function(y,removeNA=TRUE) {
        nc<-ncol(y)  # determines how many columns we have
        means<-numeric(nc)  # presets the vector of mean values as numeric
        for(i in 1:nc) {
                means[i]<-mean(y[,i],na.rm=removeNA)  # removes NA values)
        }
        means   # important otherwise would only return last mean calculated instead of the vector
}

columnmean(airquality)
columnmean(airquality,FALSE)


