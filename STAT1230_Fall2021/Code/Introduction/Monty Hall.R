# MONTY HALL

options <- 1:3
dat <- data.frame()

for(i in 1:10000){
    selection <- sample(options, 1)
    right <- sample(options, 1)
    wrong <- ifelse(selection == right, 
                    sample(x = options[!(options %in% c(right, selection))], 
                           size = 1), 
                    options[!(options %in% c(right, selection))])
    switch <- options[!(options %in% c(wrong, selection))]
    
    tmp <- data.frame(iteration = i, 
                      selected_door = selection,
                      correct_door = right,
                      wrong_door = wrong,
                      switch_door = switch)
    dat <- rbind(dat, tmp)
}
dat$no_switch_win <- ifelse(dat$selected_door == dat$correct_door, TRUE, FALSE)
dat$switch_win <- ifelse(dat$switch_door == dat$correct_door, TRUE, FALSE)

plot_dat <- data.frame(strategy = c("Switch Every Time", "Never Switch"),
                       wins = c(sum(dat$switch_win), sum(dat$no_switch_win)) / 10000)

library(ggplot2)
library(scales)

ggplot(plot_dat, aes(x = strategy, y = wins)) + 
    geom_bar(stat = "identity", fill = "navy") +
    geom_text(aes(label = percent(wins, accuracy = 0.01)), nudge_y = 0.05) + 
    xlab("Strategy") +
    ylab("Win Percentage") +
    ggtitle("Monty Carlo Win Percentage by Strategy") +
    scale_y_continuous(labels = percent_format()) +
    theme(panel.background = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          axis.ticks.x = element_blank(),
          panel.grid.major.y = element_line(color = "light gray"),
          axis.text = element_text(size = 18),
          axis.title = element_text(size = 20),
          title = element_text(size = 20),
          panel.grid.major.x = element_blank())

## 10 Door Monty Hall

options <- 1:10
dat <- data.frame()

for(i in 1:10000){
    selection <- sample(options, 1)
    right <- sample(options, 1)
    wrong <- sample(x = options[!(options %in% c(right, selection))], size = 8)
    switch <- options[!(options %in% c(wrong, selection))]
    
    tmp <- data.frame(iteration = i, 
                      selected_door = selection,
                      correct_door = right,
                      # wrong_door = list(wrong),
                      switch_door = switch)
    dat <- rbind(dat, tmp)
}
dat$no_switch_win <- ifelse(dat$selected_door == dat$correct_door, TRUE, FALSE)
dat$switch_win <- ifelse(dat$switch_door == dat$correct_door, TRUE, FALSE)

plot_dat <- data.frame(strategy = c("Switch Every Time", "Never Switch"),
                       wins = c(sum(dat$switch_win), sum(dat$no_switch_win)) / 10000)

ggplot(plot_dat, aes(x = strategy, y = wins)) + 
    geom_bar(stat = "identity", fill = "navy") +
    geom_text(aes(label = percent(wins, accuracy = 0.01)), nudge_y = 0.05) + 
    xlab("Strategy") +
    ylab("Win Percentage") +
    ggtitle("10 Door Win Percentage by Strategy") +
    scale_y_continuous(labels = percent_format()) +
    theme(panel.background = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          axis.ticks.x = element_blank(),
          panel.grid.major.y = element_line(color = "light gray"),
          axis.text = element_text(size = 18),
          axis.title = element_text(size = 20),
          title = element_text(size = 20),
          panel.grid.major.x = element_blank())


## 100 Door Monty Hall

options <- 1:100
dat <- data.frame()

for(i in 1:10000){
    selection <- sample(options, 1)
    right <- sample(options, 1)
    wrong <- sample(x = options[!(options %in% c(right, selection))], size = 98)
    switch <- options[!(options %in% c(wrong, selection))]
    
    tmp <- data.frame(iteration = i, 
                      selected_door = selection,
                      correct_door = right,
                      # wrong_door = list(wrong),
                      switch_door = switch)
    dat <- rbind(dat, tmp)
}
dat$no_switch_win <- ifelse(dat$selected_door == dat$correct_door, TRUE, FALSE)
dat$switch_win <- ifelse(dat$switch_door == dat$correct_door, TRUE, FALSE)

plot_dat <- data.frame(strategy = c("Switch Every Time", "Never Switch"),
                       wins = c(sum(dat$switch_win), sum(dat$no_switch_win)) / 10000)

ggplot(plot_dat, aes(x = strategy, y = wins)) + 
    geom_bar(stat = "identity", fill = "navy") +
    geom_text(aes(label = percent(wins, accuracy = 0.01)), nudge_y = 0.05) + 
    xlab("Strategy") +
    ylab("Win Percentage") +
    ggtitle("100 Door Win Percentage by Strategy") +
    scale_y_continuous(labels = percent_format()) +
    theme(panel.background = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          axis.ticks.x = element_blank(),
          panel.grid.major.y = element_line(color = "light gray"),
          axis.text = element_text(size = 18),
          axis.title = element_text(size = 20),
          title = element_text(size = 20),
          panel.grid.major.x = element_blank())
