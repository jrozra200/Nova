## CHP 6

library(ggplot2)
library(scales)

dat <- data.frame(x = 0:18,
                  prob = c(0.000004, 0.00007, 0.0006, 0.0031, 0.0117, 0.0327,
                           0.0708, 0.1214, 0.1669, 0.1855, 0.1669, 0.1214, 
                           0.0708, 0.0327, 0.0117, 0.0031, 0.0006, 0.00007, 
                           0.000004))

ggplot(dat, aes(x = x, y = prob)) + 
    geom_bar(color = "black", fill = "dark red", stat = "identity", width = 1) + 
    scale_y_continuous(labels = percent_format()) + 
    theme(text = element_text(size = 16), panel.background = element_blank(),
          axis.ticks = element_blank()) + 
    xlab("Number of Right Handed Toads") + 
    ylab("Probability")


ggplot(dat, aes(x = x, y = prob)) + 
    geom_bar(color = "black", fill = "dark red", stat = "identity", width = 1) + 
    scale_y_continuous(labels = percent_format()) + 
    theme(text = element_text(size = 16), panel.background = element_blank(),
          axis.ticks = element_blank()) + 
    xlab("Number of Right Handed Toads") + 
    ylab("Probability") + 
    geom_vline(xintercept = 9, size = 2, color = "dark gray") + 
    geom_vline(xintercept = 13.5, size = 2, color = "red")

