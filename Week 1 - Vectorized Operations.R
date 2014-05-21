#
# Vectorized operations
#
x<-1:4;y<-6:9  # creates two vectors, x and y
x+y            # adds the two vectors, matching elements within, yields 7  9 11 13
x>2            # yields FALSE FALSE  TRUE  TRUE
y==8           # Must use double equals or you will just reset Y to equal 8.  Yields FALSE FALSE  TRUE FALSE
#
# Vector multiplication
x<-matrix(1:4,2,2)    # creates a matrix x that is 1 to 4 in 2 rows and columns
y<-matrix(rep(10,4),2,2)  # creates a matrix y that repeats 10 in 2 rows and columns
x*y    # element wise multiplication, i.e. each relative position against same in other matrix
x %*% y  # using % creates true matrix multiplication
y<-matrix(10:13,2,2)   # Change Y to have different values to explain the math better
x %*% y  # repeat multiply  See here for more http://2.bp.blogspot.com/-DIHz6AwSdMI/UEMpgmBscsI/AAAAAAAAAHk/-37l6bae8BI/s1600/MatrixMultiplication-3.png
# 1*10 + 3*11 = 43
# 1*12 + 3*13 = 51
# 2*10 + 4*11 = 64
# 2*12 + 4*13 = 76
