# Test example

library(dplyr)

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
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks = element_blank())
    geom_smooth(method = 'lm', formula = y ~ x, se = FALSE)

cor(dat$speed, dat$dist)

linmod <- lm(dist ~ speed, data = dat)

lmod <- data.frame(x = 1:20, 
                   residuals = linmod$residuals)

ggplot(lmod, aes(x = x, y = residuals)) + 
    geom_point() + 
    geom_hline(yintercept = 0, color = "red") + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks = element_blank())
