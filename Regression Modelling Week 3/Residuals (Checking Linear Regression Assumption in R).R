# Residuals (Checking Linear Regression Assumption in R) - Youtube MarinStatsLectures

## Import Data 
LungCapData <- read.table(file.choose(), header = T, sep = "\t")

## Attach Data
attach(LungCapData)
names(LungCapData)

## Plot Data (LungCap = Y, Age = X)
plot(Age, LungCap)

## Fit Linear Regression Model
fit <- lm(LungCap ~ Age)
summary(fit)
abline(fit)

## Check the residual diagnostics
par(mfrow = c(2, 2))
plot(fit)
