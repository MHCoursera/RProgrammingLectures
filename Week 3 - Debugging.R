

# Tools
?traceback
?debug
?browser
?trace
?recover

rm(x)
mean(x)
# Error in mean(x) : object 'x' not found
traceback()
# 1: mean(x)  Top level
# Must be immediate

# more complicated example
rm(x)
rm(y)
lm(y~x)
traceback()
#7: eval(expr, envir, enclos)
#6: eval(predvars, data, env)
#5: model.frame.default(formula = y ~ x, drop.unused.levels = TRUE)
#4: stats::model.frame(formula = y ~ x, drop.unused.levels = TRUE)
#3: eval(expr, envir, enclos)
#2: eval(mf, parent.frame())
#1: lm(y ~ x)


#debug
debug(lm)
lm(y~x)
#debugging in: lm(y ~ x)
#debug: {
#        ret.x <- x
#        ret.y <- y
#        cl <- match.call()
#        mf <- match.call(expand.dots = FALSE)
#        m <- match(c("formula", "data", "subset", "weights", "na.action", 
#                     "offset"), names(mf), 0L)
#        mf <- mf[c(1L, m)]
#        mf$drop.unused.levels <- TRUE
#        mf[[1L]] <- quote(stats::model.frame)
#        mf <- eval(mf, parent.frame())
# etc...
# now in broswer mode - keep hitting n for next
n
n
Q  # quits

# recover
options(error=recover)
read.csv("nofile")
3
Q
