# Chapter 17 - #59

dat <- c(1219, 1214, 1087, 1200, 1419, 1121, 1325, 1345, 1244, 1258, 1356, 1132, 
         1191, 1270, 1295, 1135)

hist(dat)
mean(dat)
sd(dat)
sd(dat) / sqrt(16)
qt(0.975, 15)

mean(dat) - (qt(0.975, 15) * (sd(dat) / sqrt(16)))
mean(dat) + (qt(0.975, 15) * (sd(dat) / sqrt(16)))


