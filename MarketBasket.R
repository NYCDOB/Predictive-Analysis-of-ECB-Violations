#Market Basket Analysis
#from: http://www.salemmarafi.com/code/market-basket-analysis-with-r/

install.packages("arules")
library(arules)

install.packages("scatterplot3d")
install.packages("S:\\Office of Risk Management\\User Folders\\Darius Mehri\\ECB Market Basket\\scatterplot3d_0.3-37.tar.gz", repos = NULL, type = "source")
library(scatterplot3d)

install.packages("arulesViz")
library(arulesViz)

install.packages("datasets")
library(datasets)

# Load the data set
data(Groceries)

#create frequency plot, top 20
itemFrequencyPlot(Groceries,topN=20,type="absolute")

#confident = accuracy, coverage = support, number of instances predicted accurately
#below results show that that people who buy yogurt and
#cereal, are 81% likely to purchase whole milk
#Run model
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))


options(digits=2)
inspect(rules[1:50])

summary(rules)


#DOB ANALYSIS
#Notes - ideally want to increase confidence(accuracy), so have robust model, but want to reduce support so can find interesting sets
# Load the libraries
require(arules)
require(arulesViz)


## Read in CSV file to transactions - format basket
#Transactions<- read.transactions("S:\\Office of Risk Management\\User Folders\\Darius Mehri\\ECB Market Basket\\ECB Violations Issued 2010-2015.csv",
#                                 rm.duplicates= TRUE, sep=",",
#                                 format = "single", cols = c(1,2))

Transactions <- read.transactions("S:\\Office of Risk Management\\User Folders\\Darius Mehri\\ECB Market Basket\\infraction_codes_set.csv", sep = ",")

## Create an item frequency plot for the top 20 items
itemFrequencyPlot(Transactions,topN=20,type="absolute", col="steelblue")

## Get apriori rules - adjust confidence and support
rules <- apriori(Transactions, parameter = list(supp = 0.0025, conf = 0.7, minlen=2))

## Summary of rules and groupings
summary(rules)

## Inspect rules
options(digits=2)
inspect(rules[1:50])

summary(rules)

## Remove redundancies
subset.matrix <- is.subset(rules, rules)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
rules.pruned <- rules[!redundant]
rules<-rules.pruned

## Write to CSV file
write(rules, file = "S:\\Office of Risk Management\\User Folders\\Darius Mehri\\ECB Market Basket\\RrulesOutput.csv",  sep = ",")

## Create different visualizations
dev.off()
plot(rules, method="graph", main="", control=list(layout=igraph::with_graphopt()))
plot(rules,method="graph",interactive=TRUE,shading=NA)
plot(rules, method="grouped")
plot(rules, method="paracoord")
