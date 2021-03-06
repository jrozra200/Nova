# Chp 8

library(ggplot2)

# Section 1

dat <- data.frame(day = c("Sunday", "Monday", "Tuesday", "Wednesday", 
                          "Thursday", "Friday", "Saturday"),
                  births = c(33, 41, 63, 63, 47, 56, 47))

ggplot(dat, aes(x = factor(day, levels = c("Sunday", "Monday", "Tuesday", 
                                           "Wednesday", "Thursday", "Friday", 
                                           "Saturday")), 
                y = births)) + 
    geom_bar(stat = "identity", fill = "dark red") + 
    xlab(element_blank()) + 
    ylab("Frequency") + 
    theme(panel.background = element_blank(), text = element_text(size = 20)) + 
    geom_text(label = dat$births, nudge_y = -2, size = 8, color = "white")
    

curve(dchisq(x, df = 6), from = 0, to = 20,
      main = 'Chi-Square Distribution (df = 6)', #add title
      ylab = 'Probability Density', #change y-axis label
      xlab = expression("X"[6]^2),
      lwd = 2)
abline(v = 15.05, add = TRUE, col = "red", size = 2)

# Section 5

dat <- data.frame(boys = c(0, 1, 2, 0, 1, 2),
                  Value = c("Observed", "Observed", "Observed", "Expected",
                            "Expected", "Expected"),
                  Frequency = c(530, 1332, 582, 585.3, 1221.5, 637.2))

ggplot(dat, aes(x = boys, y = Frequency, group = Value, fill = Value)) + 
    geom_bar(stat = "identity", position = "dodge") + 
    geom_text(aes(label = Frequency, y = Frequency / 2), 
              position = position_dodge(width = 0.9), size = 8) + 
    scale_fill_manual(values = c("dark red", "yellow")) + 
    theme(panel.background = element_blank(), text = element_text(size = 20),
          legend.title = element_blank(), legend.position = "top") +
    xlab("Number of Boys")


# Chp 7 Homework

choose(12, 5) * (5 / 12)^5 * (1 - (5 / 12))^(12 - 5)
choose(12, 7) * (5 / 12)^5 * (1 - (5 / 12))^(12 - 5)

0.4375 - (1.96 * sqrt((0.4375 *(1 - 0.4375)) / 16))
0.4375 + (1.96 * sqrt((0.4375 *(1 - 0.4375)) / 16))


(choose(17, 16)*(0.5)^16*(0.5) + choose(17, 17)*(0.5)^17*(0.5)^0) * 2

# Chap 8 Homework

df <- data.frame(obs = c(7, 4, 5, 6, 6))
df$exp <- 5.6
df$chis <- (df$obs-df$exp)^2/df$exp
df
sum(df$chis)
