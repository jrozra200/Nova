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


##### SECTION 10.5
library(ggplot2)

x <- seq(0, 6000, length = 6000)
y <- dnorm(x, mean = 3339, sd = 573)
dat <- data.frame(x = x, 
                  y = y)

other_dat <- data.frame(orig = rnorm(6000, mean = 3339, sd = 573),
                        pred10 = replicate(6000, mean(rnorm(10, mean = 3339, sd = 573))),
                        pred100 = replicate(6000, mean(rnorm(100, mean = 3339, sd = 573))),
                        pred1000 = replicate(6000, mean(rnorm(1000, mean = 3339, sd = 573))))

ggplot(dat, aes(x = x, y = y)) + 
    geom_line()
    
ggplot(other_dat) +
    geom_histogram(aes(x = orig), bins = 20, fill = "red", alpha = 0.25) +
    geom_histogram(aes(x = pred10), bins = 30, fill = "blue", alpha = 0.25) + 
    theme(panel.background = element_blank(),
          text = element_text(size = 20)) + 
    xlab("Weight, Y & Mean Weight, Y-Bar") +
    ylab("Frequency")


ggplot(other_dat) +
    # geom_histogram(aes(x = orig), bins = 20, fill = "red", alpha = 0.25) +
    geom_histogram(aes(x = pred10), bins = 30, fill = "blue", alpha = 0.35) + 
    geom_histogram(aes(x = pred100), bins = 40, fill = "green", alpha = 0.35) + 
    geom_histogram(aes(x = pred1000), bins = 50, fill = "yellow", alpha = 0.35) + 
    theme(panel.background = element_blank(),
          text = element_text(size = 20)) + 
    xlab("Weight, Y & Mean Weight, Y-Bar") +
    ylab("Frequency")
