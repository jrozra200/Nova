# Test example

set.seed(317)
dat <- sample_n(cars, 20)
dat$x_minus_mean <- dat$speed - mean(dat$speed)
dat$y_minus_mean <- dat$dist - mean(dat$dist)
dat$x_times_y <- dat$x_minus_mean * dat$y_minus_mean
dat$x_squared <- dat$x_minus_mean ^ 2
dat$y_squared <- dat$y_minus_mean ^ 2

library(ggplot2)

ggplot(dat, aes(x = speed, y = dist)) + 
    geom_point() + 
    geom_smooth(method = 'lm', formula = y ~ x, se = FALSE)

cor(dat$speed, dat$dist)

lm <- glm(dist ~ speed, data = dat, formula = y ~ x)

ggplot(lm$residuals)