# Chapter 5 Viz

# DISCRETE PROB DISTRIBUTION

dat <- data.frame(outcome = c(1, 2, 3, 4, 5, 6),
                  prob = rep(1/6, 6))

library(scales)
library(ggplot2)

ggplot(dat, aes(x = outcome, y = prob)) + 
    geom_bar(stat = "identity", width = 1, fill = "dark red", color = "black") + 
    scale_y_continuous(labels = percent_format()) +
    xlab("Result of a Roll") + 
    ylab("Probability") + 
    ggtitle("Probability Distribution of Outcomes\nfrom the Roll of a 6-Sided Die") + 
    theme(text = element_text(size = 16))

dat <- data.frame(outcome = 2:12, 
                  events = c(1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1),
                  prob = c(1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1) / 36)

ggplot(dat, aes(x = factor(outcome), y = prob)) + 
    geom_bar(stat = "identity", width = 1, fill = "dark red", color = "black") + 
    scale_y_continuous(labels = percent_format()) +
    xlab("Result of a Roll") + 
    ylab("Probability") + 
    ggtitle("Probability Distribution of Outcomes\nfrom the Sum of Two 6-Sided Die") + 
    theme(text = element_text(size = 16))

dat <- data.frame(outcome = c("0 Heads", "1 Head", "2 Heads", "3 Heads"),
                  events = c(1, 3, 3, 1),
                  prob = c(1, 3, 3, 1) / 8)

ggplot(dat, aes(x = factor(outcome), y = prob)) + 
    geom_bar(stat = "identity", width = 1, fill = "dark red", color = "black") + 
    scale_y_continuous(labels = percent_format()) +
    xlab("Result of a Coin Flips") + 
    ylab("Probability") + 
    ggtitle("Probability Distribution of Outcomes\nfrom the Flip of 3 Coins") + 
    theme(text = element_text(size = 16))

library(RColorBrewer)

dat <- data.frame(blood_type = c("O", "O", "A", "A", "B", "B", "AB", "AB"),
                  pos_neg = c("Positive", "Negative"),
                  prob = c(0.374, 0.066, 0.357, 0.063, 0.085, 0.015, 0.034, 0.006))

ggplot(dat, aes(x = factor(blood_type, levels = c("O", "A", "B", "AB")), 
                y = prob, fill = pos_neg)) +
    geom_bar(stat = "identity") + 
    scale_fill_brewer(palette = "Set1") + 
    scale_y_continuous(labels = percent_format()) + 
    xlab("Blood Type") + 
    ylab("Probability") + 
    ggtitle("Probability for Each Blood Type") + 
    theme(text = element_text(size = 16), legend.position = "top", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks.y = element_line(color = "gray"), 
          panel.grid.major.y = element_line(color = "gray"), 
          axis.ticks.x = element_blank())

library(ggmosaic)

dat$blood_type <- factor(dat$blood_type, levels = c("O", "A", "AB", "B"))

ggplot(dat) + 
    geom_mosaic(aes(x = product(pos_neg, blood_type), fill = pos_neg, 
                    weight = prob)) + 
    scale_fill_brewer(palette = "Set1") + 
    xlab("Blood Type") + 
    ggtitle("Probability for Each Blood Type") + 
    theme(text = element_text(size = 16), legend.position = "top", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks = element_blank(), axis.title.y = element_blank())

dat <- data.frame(outcome = rep(1:6, 2),
                  odd_even = c(rep("odd", 6), rep("even", 6)),
                  prob = c(1 / 6, 0))

ggplot(dat) + 
    geom_mosaic(aes(x = product(odd_even, outcome), fill = odd_even, 
                    weight = prob)) + 
    scale_fill_brewer(palette = "Set1") + 
    xlab("Blood Type") + 
    ggtitle("Probability for Each Blood Type") + 
    theme(text = element_text(size = 16), legend.position = "none", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks = element_blank(), axis.title = element_blank(), 
          axis.text.x = element_blank())

dat <- data.frame(smoker = c("smoker", "smoker", "non-smoker", "non-smoker"),
                  bp = c("high blood pressure", "low blood pressure"),
                  prob = c(0.037, 0.17 - 0.037, 0.22 - 0.037, 
                           1 - 0.037 - (0.17 - 0.037) - (0.22 - 0.037)))
dat$smoker <- factor(dat$smoker, levels = c("smoker", "non-smoker"))

ggplot(dat) + 
    geom_mosaic(aes(x = product(bp, smoker), fill = bp, 
                    weight = prob)) + 
    scale_fill_brewer(palette = "Set1") + 
    theme(text = element_text(size = 16), legend.position = "none", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks = element_blank(), axis.title = element_blank())
