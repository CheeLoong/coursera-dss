# Two-Sample t Test in R: Independent Groups (MarinStatsLectures)
# appropriate for examining the difference in Means for 2 population
# These are ways of examining the relationship between a numeric outcome variable (Y) and a categorical explanatory variable(X, with 2 levels)

LungCapData <- read.table(file.choose(), header = T, sep = "\t")
attach(LungCapData)
names(LungCapData)
class(LungCapData)
boxplot(LungCap ~ Smoke)

## Two sided hypothesis testing (2 independent groups)
# H0: mean lung cap of smokers = of non-smokers
# two-sided test
# assume non-equal variances

t.test(LungCap ~ Smoke, mu = 0, alt = "two.sided", conf = 0.95, var.eq = F, paired = F)
# All the args typed above are default, thus,
t.test(LungCap ~ Smoke)

# Alternatively,
t.test(LungCap[Smoke == "no"], LungCap[Smoke == "yes"])

## How to decide how we can decide equal or non-equal variances
# via Boxplot
boxplot(LungCap ~ Smoke)

# Compare individual variance
var(LungCap[Smoke == "yes"])
var(LungCap[Smoke == "no"])

# Levene's test
# H0: population variances are equal
library(car)
leveneTest(LungCap ~ Smoke) # Reject H0 due to small p-value and use the non-equal variances assumption

