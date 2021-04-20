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
