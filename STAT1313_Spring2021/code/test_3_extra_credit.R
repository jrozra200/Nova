# Extra Credit

set.seed(42)

beer <- round(rnorm(15, mean = 30, sd = 5), 0)
water <- round(rnorm(15, mean = 20, sd = 5), 0)

n_beer <- length(beer)
n_water <- length(water)

df_beer <- n_beer - 1
df_water <- n_water - 1

df_tot <- df_beer + df_water

s_beer <- sd(beer)
s_water <- sd(water)

ybar_beer <- mean(beer)
ybar_water <- mean(water)

sp2 <- ((df_beer * s_beer ^ 2) + (df_water * s_water ^ 2)) / (df_beer + df_water)
se_beer_water <- sqrt(sp2 * ((1 / n_beer) + (1 / n_water)))
tstat <- (ybar_beer - ybar_water) / se_beer_water

tcrit <- qt(0.05, df_tot, lower.tail = FALSE)
pt(tstat, df_tot, lower.tail = FALSE)

library(ggplot2)
ggplot(plot_dat, aes(x = value, fill = variable)) + 
    geom_histogram(position = "identity", alpha = 0.5, bins = 5) + 
    facet_wrap(~ variable) + 
    theme(panel.background = element_blank(), 
          panel.grid.major.y = element_line(color = "light gray"),
          panel.grid.major.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_line(color = "light gray"),
          text = element_text(size = 20), 
          legend.position = "none",
          strip.background = element_blank(), 
          legend.title = element_blank(), 
          axis.title = element_blank())
