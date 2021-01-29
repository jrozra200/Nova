## Frequency Table

library(dplyr)
library(ggplot2)

data("mtcars")
head(mtcars)

sum_dat <- mtcars %>% 
    group_by(cyl) %>% 
    summarise(num_cars = length(cyl))

ggplot(sum_dat, aes(x = factor(cyl), y = num_cars)) + 
    geom_bar(stat = "identity", fill = "navy") +
    xlab("Number of Cylinders") +
    ylab("Frequency (number of cars)") + 
    theme(panel.background = element_blank(), 
          axis.line = element_line(color = "black"))

library(ggmosaic)

dat <- data.frame(malaria = c("Malaria", "Malaria", "No Malaria", "No Malaria"),
                  exp_group = c("Control Group", "Egg-Removal Group", 
                                "Control Group", "Egg-Removal Group"),
                  value = c(7, 15, 28, 15))

ggplot(dat) + 
    geom_mosaic(aes(x = product(malaria, exp_group), fill = malaria, 
                    weight = value)) + 
    scale_fill_manual(values = c("dark red", "#CCCC00")) + 
    xlab("Treatment") + 
    ylab("Relative Frequency") + 
    theme(panel.background = element_blank(), legend.position = "top", 
          legend.title = element_blank())

ggplot(mtcars, aes(x = disp, y = mpg)) + 
    geom_point(color = "dark red") + 
    theme(panel.background = element_blank(), 
          axis.line = element_line(color = "black")) + 
    scale_y_continuous(limits = c(0, max(mtcars$mpg))) + 
    xlab("Engine Displacement (cc)") + 
    ylab("Fuel Efficiency (mpg)")


ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + 
    geom_point(color = "dark red") + 
    theme(panel.background = element_blank(), 
          axis.line = element_line(color = "black")) +
    xlab("Engine Cylinders") +
    ylab("Fuel Efficiency (mpg)")

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + 
    geom_boxplot(fill = "#CCCC00") + 
    theme(panel.background = element_blank(), 
          axis.line = element_line(color = "black")) +
    xlab("Engine Cylinders") +
    ylab("Fuel Efficiency (mpg)")

mtcars$cyl <- paste(mtcars$cyl, "Cylinders")

ggplot(mtcars, aes(x = mpg)) + 
    geom_histogram(fill = "dark red", bins = 8, color = "black") + 
    theme(panel.background = element_blank(), 
          axis.line = element_line(color = "black"), 
          strip.background = element_blank(), strip.text = element_text(size = 10)) +
    ylab("Frequency") +
    xlab("Fuel Efficiency (mpg)") + 
    facet_wrap(~ cyl, ncol = 1)
