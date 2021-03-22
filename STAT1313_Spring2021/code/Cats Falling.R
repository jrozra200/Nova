## CATS FALLING FROM HIEGHT

library(ggplot2)
library(knitr)

dat <- data.frame(numCats = c(0, 8, 14, 27, 34, 21, 9, 13),
                  numFloors = c("1", "2", "3", "4", "5", "6", "7-8", "9-32"),
                  numInjuries = c(0, 0.75, 0.9, 1.8, 1.9, 2.1, 2.25, 1))

ggplot(dat, aes(x = numFloors, y = numInjuries, group = 1)) + 
    geom_point() + 
    geom_smooth(se = FALSE) + 
    xlab("Number of Floors Fallen") +
    ylab("Average Number of Injuries per Cat") + 
    ggtitle("Do Cats That Fall from Extrodinary Heights Really get Injured Less?") +
    theme(axis.ticks = element_blank(), panel.background = element_blank(), 
          axis.line = element_line(color = "gray"), 
          panel.grid.major.y = element_line(color = "gray"), 
          axis.text = element_text(size = "14"), 
          axis.title = element_text(size = "14"),
          plot.title = element_text(size = "16"))
