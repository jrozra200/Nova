# CHAPTER 17

dat <- data.frame(black_prop = c(0.21, 0.14, 0.11, 0.13, 0.12, 0.13, 0.12, 0.18, 
                                 0.23, 0.22, 0.20, 0.17, 0.15, 0.27, 0.26, 0.21, 
                                 0.30, 0.42, 0.43, 0.59, 0.60, 0.72, 0.29, 0.10, 
                                 0.48, 0.44, 0.34, 0.37, 0.34, 0.74, 0.79, 0.51),
                  age = c(1.1, 1.5, 1.9, 2.2, 2.6, 3.2, 3.2, 2.9, 2.4, 2.1, 1.9, 
                          1.9, 1.9, 1.9, 2.8, 3.6, 4.3, 3.8, 4.2, 5.4, 5.8, 6.0, 
                          3.4, 4.0, 7.3, 7.3, 7.8, 7.1, 7.1, 13.1, 8.8, 5.4))

library(ggplot2)

ggplot(dat, aes(x = black_prop, y = age)) + 
    geom_point() + 
    xlab("Proportion Black") +
    ylab("Age (years)") + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank()) 


dat <- data.frame(black_prop = c(0.21, 0.14, 0.11, 0.13, 0.12, 0.13, 0.12, 0.18, 
                                 0.23, 0.22, 0.20, 0.17, 0.15, 0.27, 0.26, 0.21, 
                                 0.30, 0.42, 0.43, 0.59, 0.60, 0.72, 0.29, 0.10, 
                                 0.48, 0.44, 0.34, 0.37, 0.34, 0.74, 0.79, 0.51),
                  age = c(1.1, 1.5, 1.9, 2.2, 2.6, 3.2, 3.2, 2.9, 2.4, 2.1, 1.9, 
                          1.9, 1.9, 1.9, 2.8, 3.6, 4.3, 3.8, 4.2, 5.4, 5.8, 6.0, 
                          3.4, 4.0, 7.3, 7.3, 7.8, 7.1, 7.1, 13.1, 8.8, 5.4))

dat1 <- dat
dat1$source = "original"

outlier <- data.frame(black_prop = 0.85,
                      age = 30)
dat2 <- rbind(dat, outlier)
dat2$source = "outlier"

dat <- rbind(dat2, dat1)

ggplot(dat, aes(x = black_prop, y = age, group = source, color = source)) + 
    geom_point() + 
    geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
    scale_color_manual(values = c("black", "red")) + 
    xlab("Proportion Black") +
    ylab("Age (years)") + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank()) 


dat <- data.frame(black_prop = c(0.21, 0.14, 0.11, 0.13, 0.12, 0.13, 0.12, 0.18, 
                                 0.23, 0.22, 0.20, 0.17, 0.15, 0.27, 0.26, 0.21, 
                                 0.30, 0.42, 0.43, 0.59, 0.60, 0.72, 0.29, 0.10, 
                                 0.48, 0.44, 0.34, 0.37, 0.34, 0.74, 0.79, 0.51),
                  age = c(1.1, 1.5, 1.9, 2.2, 2.6, 3.2, 3.2, 2.9, 2.4, 2.1, 1.9, 
                          1.9, 1.9, 1.9, 2.8, 3.6, 4.3, 3.8, 4.2, 5.4, 5.8, 6.0, 
                          3.4, 4.0, 7.3, 7.3, 7.8, 7.1, 7.1, 13.1, 8.8, 5.4))

dat$age <- dat$age + (16 * dat$black_prop) ^ 2

linear <- ggplot(dat, aes(x = black_prop, y = age)) + 
    geom_point() + 
    geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
    xlab("Proportion Black") +
    ylab("Age (years)") + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank()) 

nonlinear <- ggplot(dat, aes(x = black_prop, y = age)) + 
    geom_point() + 
    geom_smooth(method = "nls",
                formula = y ~ a*x^b,
                method.args = list(start = list(a = 1, b = 1)),
                se = FALSE) +
    xlab("Proportion Black") +
    ylab("Age (years)") + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank()) 

gridExtra::grid.arrange(linear, nonlinear, nrow = 1)


data("cars")

linear_model <- glm(formula = dist ~ speed, data = cars)

plot_dat <- data.frame(y = linear_model$residuals,
                          x = cars$speed)

lin <- ggplot(plot_dat, aes(y = y, x = x)) + 
    geom_point() + 
    geom_hline(yintercept = 0, color = "red") +
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank()) +
    xlab("X") +
    ylab("Residual")



cars$dist <- cars$dist + cars$speed^2

non_linear_model <- glm(formula = dist ~ speed, data = cars)

plot_dat <- data.frame(y = non_linear_model$residuals,
                          x = cars$speed)

nonlin <- ggplot(plot_dat, aes(y = y, x = x)) + 
    geom_point() + 
    geom_hline(yintercept = 0, color = "red") +
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank())  +
    xlab("X") +
    ylab("Residual")

gridExtra::grid.arrange(lin, nonlin, nrow = 1)

plot_dat <- data.frame(x = 1:100)
plot_dat$y = 10 * plot_dat$x ^ 3

library(scales)

nonlin <- ggplot(plot_dat, aes(y = y, x = x)) + 
    geom_point() + 
    scale_y_continuous(labels = comma_format()) + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank())  +
    xlab("X") +
    ylab("Y") + 
    ggtitle(expression(Y == aX^b))

plot_dat$y_trans <- log(plot_dat$y)
plot_dat$x_trans <- log(plot_dat$x)

lin <- ggplot(plot_dat, aes(y = y_trans, x = x_trans)) + 
    geom_point() + 
    scale_y_continuous(labels = comma_format()) + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank())  +
    xlab("ln(X)") +
    ylab("ln(Y)") + 
    ggtitle(expression(ln(Y) == ln(a) + b*ln(X)))

gridExtra::grid.arrange(nonlin, lin, nrow = 1)
