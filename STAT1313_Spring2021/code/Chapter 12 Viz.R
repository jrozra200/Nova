## Chapter 12

# Example 12.2

data <- data.frame(
    id_num = c(1, 4, 5, 6, 9, 10, 15, 16, 17, 19, 20, 23, 24),
    bef_aft = c(rep("before", 13), rep("after", 13), rep("difference", 13)),
    values = c(4.65, 3.91, 4.91, 4.50, 4.80, 4.88, 4.88, 4.78, 4.98, 4.87, 4.75, 
               4.70, 4.93, 4.44, 4.30, 4.98, 4.45, 5.00, 5.00, 5.01, 4.96, 5.02, 
               4.73, 4.77, 4.60, 5.01, -0.21, 0.39, 0.07, -0.05, 0.20, 0.12, 
               0.13, 0.18, 0.04, -0.14, 0.02, -0.10, 0.08)
)

library(ggplot2)

ggplot(data[data$bef_aft != "difference", ], 
       aes(x = factor(bef_aft, levels = c("before", "after")), y = values, 
           group = id_num)) + 
    geom_line() + 
    geom_point(color = "dark red") + 
    xlab("Implant Treatment") + 
    ylab("Antibody Production Rate (ln[mOD/min])") + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20))

library(knitr)
library(reshape2)

wide_data <- dcast(data, id_num ~ bef_aft)
wide_data <- wide_data[, c("id_num", "before", "after", "difference")]
wide_data
