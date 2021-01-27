## GOOD PLOTS 

library(rStrava)
library(lubridate)
library(ggplot2)
library(Hmisc)
library(scales)

jake <- get_activity_list(stoken)

jake_df <- data.frame()

for(i in 1:length(jake)){
    tmp <- data.frame(act_name = jake[[i]]$name,
                      distance = jake[[i]]$distance,
                      moving_time = jake[[i]]$moving_time,
                      elapsed_time = jake[[i]]$elapsed_time,
                      total_elevation_gain = jake[[i]]$total_elevation_gain,
                      type = jake[[i]]$type,
                      start_time = jake[[i]]$start_date_local,
                      lat = ifelse(is.null(jake[[i]]$start_latlng[[1]]), 
                                   NA, jake[[i]]$start_latlng[[1]]),
                      lon = ifelse(is.null(jake[[i]]$start_latlng[[2]]), 
                                   NA, jake[[i]]$start_latlng[[2]]),
                      timezone = jake[[i]]$timezone,
                      utc_offset = jake[[i]]$utc_offset,
                      achievement_count = jake[[i]]$achievement_count,
                      elev_high = ifelse(is.null(jake[[i]]$elev_high), NA, 
                                         jake[[i]]$elev_high),
                      elev_low = ifelse(is.null(jake[[i]]$elev_low), NA, 
                                        jake[[i]]$elev_low),
                      pr_count = jake[[i]]$pr_count)
    
    jake_df <- rbind(jake_df, tmp)
}

jake_df$start_time_2 <- as.POSIXct(jake_df$start_time, "%Y-%m-%dT%H:%M:%SZ", 
                                   tz = "America/New_York")

jake_df$miles <- jake_df$distance / 1609.34
jake_df$minutes <- jake_df$moving_time / 60
jake_df$total_elevation_gain_ft <- jake_df$total_elevation_gain * 3.28084

jake_df$date <- as_date(jake_df$start_time_2)

jake_df <- jake_df[jake_df$date >= "2020-12-25", ]

# SHOW THE DATA

ggplot(jake_df, aes(x = type, y = minutes)) + 
    geom_point(aes(color = type), color = "red") + 
    stat_summary(fun = mean, geom = "crossbar", fun.min = mean, fun.max = mean,
                 color = "black") + 
    theme(panel.background = element_blank(), axis.ticks = element_blank()) +
    xlab("Exercise Type") + 
    ylab("Time per Event (minutes)") + 
    scale_y_continuous(limits = c(0, max(jake_df$minutes + 5)))

ggplot(jake_df, aes(x = type, y = minutes)) + 
    stat_summary(fun = mean, geom = "bar", fun.min = mean, fun.max = mean,
                 color = "black", fill = "dark red") + 
    theme(panel.background = element_blank(), axis.ticks = element_blank()) +
    xlab("Exercise Type") + 
    ylab("Time per Event (minutes)")


dat <- jake_df[jake_df$type == "Run", ]
dat <- dat[dat$distance > 0, ]

dat <- dat[order(dat$date), ]

sum_dat <- data.frame()

for(i in 1:dim(dat)[1]){
    if((i - 7) < 1){
        tmp <- data.frame(
            date = dat$date[i],
            total_time = sum(dat$minutes[1:i]),
            total_miles = sum(dat$miles[1:i]),
            total_activites = dim(dat[1:i, ])[1]
        )
    } else {
        tmp <- data.frame(
            date = dat$date[i],
            total_time = sum(dat$minutes[(i-7):i]),
            total_miles = sum(dat$miles[(i-7):i]),
            total_activites = dim(dat[(i-7):i, ])[1]
        )
    }
    sum_dat <- rbind(sum_dat, tmp)
}

sum_dat$avg_speed <- sum_dat$total_miles / (sum_dat$total_time / 60)
sum_dat$avg_time <- sum_dat$total_time / sum_dat$total_activites
sum_dat$min_per_mile <- 1 / (sum_dat$avg_speed / 60)

ggplot(data = sum_dat, aes(x = date, y = min_per_mile)) + 
    geom_line(color = "navy", size = 2) +
    scale_y_continuous(label = comma_format(), limits = c(0, max(sum_dat$min_per_mile) + 0.25)) +
    ggtitle("Average Run Speed (Mile Time)", 
            subtitle = "7 Run Moving Average") +
    ylab("Minutes per Mile") +
    theme(panel.background = element_blank(), 
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_line(color = "grey"),
          legend.position = "top", legend.text = element_text(size = 12),
          legend.title = element_blank(), title = element_text(size = 16),
          axis.text = element_text(size = 12),
          axis.title.x = element_blank(),
          axis.ticks = element_blank(),
          plot.background = element_rect(fill = "white", 
                                         color = "light gray", size = 1))

ggplot(data = sum_dat, aes(x = date, y = min_per_mile)) + 
    geom_line(color = "navy", size = 2) +
    scale_y_continuous(label = comma_format()) +
    ggtitle("Average Run Speed (Mile Time)", 
            subtitle = "7 Run Moving Average") +
    ylab("Minutes per Mile") +
    theme(panel.background = element_blank(), 
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_line(color = "grey"),
          legend.position = "top", legend.text = element_text(size = 12),
          legend.title = element_blank(), title = element_text(size = 16),
          axis.text = element_text(size = 12),
          axis.title.x = element_blank(),
          axis.ticks = element_blank(),
          plot.background = element_rect(fill = "white", 
                                         color = "light gray", size = 1))
