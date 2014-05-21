
# Dates are represented by the Date class
# Times are represented by the POSIXct or the POSIXlt class
# POSIXct is just a very large integer (number of seconds since 1970)
# POSIXlt is a list that also includes info such as day of week, day of year, etc.
# Both are since 1/1/1970
x<-as.Date("1970-01-01")
x   "prints as character string"
class(x)   # is date class
unclass(as.Date("1970-01-02"))  # One day since 1/1/70

x<-Sys.time()
x
p<-as.POSIXlt(x)
p
attributes(p)
p$wday
p$mon    # why 4?  Is Jan 0?
p$mday   
p$year    # gives 114, which is since 1900, like Microsoft, not 1970

# Can convert character strings into dates with strptime()
?strptime    # LONG list of argument modifiers to tell function what is where in text
datestring<-c("January 10, 2012 10:40", "December 9, 2011 9:30")
datestring
class(datestring)
x<-strptime(datestring, "%B %d, %Y %H:%M")
class(x)
x

# can then do math and make comparisons, but ONLY within same class (date, POSIXlt,POSIXct)
