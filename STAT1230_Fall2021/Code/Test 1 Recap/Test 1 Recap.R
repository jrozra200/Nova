tdat <- c(0.92, 0.79, 0.87, 0.87, 0.87, 0.99, 0.97, 0.77, 0.86, 0.90, 0.93, 
          0.97, 0.98, 0.92, 0.91, 0.93, 0.94, 0.97, 0.69, 0.62, 0.85, 0.96, 
          0.92, 0.91, 0.26, 0.85, 0.93, 0.96, 0.82)

summary(tdat)
sd(tdat)

library(ggplot2)
library(scales)

tdat <- data.frame(score = tdat)

ggplot(tdat, aes(x = score)) + 
    geom_boxplot() +
    scale_x_continuous(labels = percent_format()) +
    coord_flip() + 
    theme(axis.title = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks = element_blank(),
          panel.background = element_blank(),
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank())

ggplot(tdat, aes(x = score)) + 
    geom_histogram(bins = 10, fill = "light gray", color = "black") +
    scale_x_continuous(labels = percent_format()) +
    theme(axis.title = element_blank(),
          axis.ticks = element_blank(),
          panel.background = element_blank(),
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank())
