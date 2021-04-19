
dat <- data.frame(x = -10:10)
dat$y <- dat$x^2

library(ggplot2)

ggplot(dat, aes(x = x, y = y)) + 
    geom_point() + 
    geom_line() + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          axis.title = element_blank()) +
    ggtitle(expression(paste("Plot of ", x^2)),
            subtitle = paste("r =", cor(dat$x, dat$y)))

plot_dat <- data.frame(x = sort(rnorm(40), decreasing = FALSE))
plot_dat$x <- plot_dat$x + abs(min(plot_dat$x))
plot_dat$y <- ifelse(row(plot_dat)[, 1] %% 2 == 1, -1 * plot_dat$x ^2, plot_dat$x ^2)
plot_dat$y <- plot_dat$y + rnorm(40, 1, 5)

ggplot(plot_dat, aes(x = x, y = y)) + 
    geom_point() + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_line(color = "light gray"),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20))

plot_dat <- data.frame(x = c(rnorm(40), 0),
                       y = c(rnorm(40), 10))

ggplot(plot_dat, aes(x = x, y = y)) + 
    geom_point() + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_line(color = "light gray"),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20))

plot_dat <- data.frame(x = rnorm(40))
plot_dat$y <- plot_dat$x ^ 2 + rnorm(40, 1, 0.25)


ggplot(plot_dat, aes(x = x, y = y)) + 
    geom_point() + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_line(color = "light gray"),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20))
