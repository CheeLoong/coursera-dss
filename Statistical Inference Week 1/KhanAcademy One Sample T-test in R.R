# One sample T-test in R (Khanacademy Example + MarinStatsLectures R codes)

## Simulate data from example
x <- c(15.6, 16.2, 22.5, 20.5, 16.4, 19.4, 16.6, 17.9, 12.7, 13.9)
mean(x)
sd(x)

## One sample t.test
T.TEST <- t.test(x, mu = 20, alt = "less", conf = 0.99)
T.TEST

## Attributes of t.test & extration of value of interest
attributes(T.TEST)
T.TEST$conf.int
T.TEST$p.value
