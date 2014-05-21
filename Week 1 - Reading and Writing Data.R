# Reading and writing data

? read.table    # we should KNOW this help page well
# Easy way to look at and build a vector to specify colClasses
initial<-read.table("datatable.txt",nrows=100,)  # reads ONLY first 100 rows of table.  
#   will not run as file does not exist
classes<-sapply(initial,class)     #creates a vector? with the classes of each column
tabAll<-read.table("database.txt",colClasses=classes)  # reads table but this time specifies classes
# using nrows helps save memory.  can overstimate

# Writing data

?dump # writes tables and preserves some metadata so it does not have to be specified when read
?dput # same, but ASCII text?
?source  #reads such tables
?dget   # same
# combined these commands can store tables and pull them back easily
y<-data.frame (a=1,b="a")  # creates a simple frame for example purposes
dput(y)  # shows metadata about y on console
dput(y,file="y.R")  #writes the meta data and data to a file
new.y<-dget("y.R")  # reads the dput file back in as new object

# dump and source can do same for multiple objects 
x<-"foo"
y<-data.frame(a=1, b="a")
dump(c("x","y"),file="data.R")    # this stores multiple objects for easy recall.
#  DO NOT UNDERSTAND WHY QUOTES NEEDED IN C COMMAND ABOVE
rm(x,y)   # deleted them from memory to show how to bring them back
source("data.R")   # pretty cool.

# connecting to data without reading in
#file for normal files
# gzfile for compressed with gzip
#bzfile for compressed with bzip2
#url for web page
con<-file("foo.txt,"r")   # creates an object con that links to foo.txt READ ONLY
# once connected you can read selected portions or lines for example without reading entire file
x<-readLines(con,10) # would read only the first ten lines.  writeLines does opposite

