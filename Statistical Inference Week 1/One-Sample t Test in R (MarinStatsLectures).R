# One-Sample t Test in R (MarinStatsLectures)

LungCapData <- read.table(file.choose(), header = T, sep = "\t")
attach(LungCapData)
names(LungCapData)
class(LungCapData)

## One-sided hypothesis testing
# H1 : mu < 8
# one-sided 95% conf internal for mu
t.test(LungCap, mu = 8, alt = "less", conf = 0.95)

## Two-sided hypothesis testing
t.test(LungCap, mu = 8, alt = "two.sided", conf = 0.95)

## Storing hypothesis testing results
TEST <- t.test(LungCap, mu = 8, alt = "two.sided", conf = 0.95)
TEST
attributes(TEST)
TEST$conf.int
TEST$p.value
