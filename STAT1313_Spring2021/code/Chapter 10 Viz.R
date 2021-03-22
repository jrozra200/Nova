# Chapter 10 Viz

# Credit: http://people.reed.edu/~jones/141/BirthWgt.html
dat <- read.csv("http://people.reed.edu/~jones/141/Bwt.dat")
head(dat)

hist(dat$bwt, main = "Birth Weight of Babies (ounces)", 
     ylab = "Frequency of Babies", 
     xlab = "Birth Weight (ounces)")

dat2 <- sample(dat$bwt, size = 1000000, replace = TRUE)

hist(dat2, main = "Birth Weight of 1MM Babies (ounces)", 
     ylab = "Frequency of Babies", 
     xlab = "Birth Weight (ounces)")

dat2 <- sample(dat$bwt, size = 4000000, replace = TRUE)

hist(dat2, main = "Birth Weight of 4MM Babies (ounces)", 
     ylab = "Frequency of Babies", 
     xlab = "Birth Weight (ounces)", breaks = 40)


x <- seq(mean(dat$bwt) - 4 * sd(dat$bwt), mean(dat$bwt) + 4 * sd(dat$bwt), 
         length = 200)
y <- dnorm(x, mean = mean(dat$bwt), sd = sd(dat$bwt))
plot(x, y, type = "l", lwd = 2, 
     main = paste0("Normal Distribution for a Variable, Y,\nwith mean and vari",
                   "ance equal to that\nin the baby birth weight data"),
     ylab = "Probability Density", 
     xlab = "Y", add = TRUE)

hist(dat$bwt, main = "Birth Weight of Babies (ounces)", 
     ylab = "Frequency of Babies", 
     xlab = "Birth Weight (ounces)")
plot(x, y, type = "l", lwd = 2, 
     add = TRUE)



library(datasets)
dat <- datasets::beaver1

hist(dat$temp, breaks = 10, main = "Temperature of a Beaver", 
     ylab = "Frequency", xlab = "Temperature (C)")


dat <- datasets::nhtemp

hist(dat, main = "Mean Annual Temperature (F) in New Haven, CT, from 1912 to 1971",
     ylab = "Number of Years", xlab = "Temperature (F)")


dat <- datasets::treering

hist(dat, main = "Normalized Tree-Ring Widths in Dimensionless Units",
     ylab = "Number of Rings", xlab = "Ring Width")


x <- seq(mean(dat$bwt) - 4 * sd(dat$bwt), mean(dat$bwt) + 4 * sd(dat$bwt), 
         length = 200)
y <- dnorm(x, mean = mean(dat$bwt), sd = sd(dat$bwt))
plot(x, y, type = "l", lwd = 2, 
     main = paste0("Normal Distribution for a Variable, Y,\nwith mean and vari",
                   "ance equal to that\nin the baby birth weight data"),
     ylab = "Probability Density", 
     xlab = "Y")