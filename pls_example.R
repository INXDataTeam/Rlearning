## using the plsdepot packages 
## sample learned from http://www.r-bloggers.com/partial-least-squares-regression-in-r/
library(plsdepot)
## Load the data 'vehicles' contained in the package 'plsdepot'
data("vehicles")
names(vehicles)
cards <- vehicles[,c(1:12,14:16,13)]
plscards <- plsreg1(cards[,1:15],cards[,16,drop=FALSE],comps = 3)
plscards
plscards$x.scores
plot(plscards)


data(iris)
names(iris)
plsiris <- plsreg1(iris[,1:3],iris[,4,drop=FALSE],comps = 1)
