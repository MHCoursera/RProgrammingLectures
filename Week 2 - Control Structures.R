
## If else
if(<condition.) {
      ## do something
} else {
      ## do something else
}

## For
for (i in 1:10) {
    print(i)
}

## seq_along (seek along) creates its own integer sequence of the length of x
x<-c("a","b","c","d")    # create alpha vector
for(i in seq_along(x))   
    {print(x[i])}   # prints each element of vector  
# Can omit curly braces as above

## While
count<-0
while(count<10)
    {
    print(count)
    count<-count+1
    }    # need bracket or it will execute line before forever
# above is my preferred syntax for clarity

## Repeat - not used often.  Only way to exit is call break
repeat 
    {
    condition 1 do something
    condition 2 break
    }


## Next and Return
# Next skips an iteration
for(i in 1:100)
  {
  if(i<=20)
    {
    ## Skip the first 20 iterations
    next
    }
  ## Do something here after first 20.
  }

    
  }
}

