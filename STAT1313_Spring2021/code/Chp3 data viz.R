# Chpater 3 Homework

dat <- data.frame(data = c(0.83, 0.86, 0.91, 0.99, 1, 1.01, 1.01, 1.01, 1.02, 
                           1.02, 1.02))

dat$dev_sq <- (dat$data - mean(dat$data)) ^ 2

dat
sum(dat$dev_sq)
sum(dat$dev_sq) / 10
sqrt(sum(dat$dev_sq) / 10)
sd(dat$data)
1 / 0.62

data <- c(49, 54, 48, 52, 67, 36, 75, 48, 38, 41, 44, 53, 55, 56, 60, 59, 62, 43, 48, 32)
hist(data, breaks = 10, main = "Height of Plants (cm)", xlab = "centimeters")
