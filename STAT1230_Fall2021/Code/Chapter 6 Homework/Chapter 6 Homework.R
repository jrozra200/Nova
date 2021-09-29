# 42

options(scipen = 999)

x <- c(22, 17, 40, 5, 37, 19, 23, 6, 7, 53, 34)
y <- c(4, 3, 21, 1, 16, 8, 14, 3, 3, 31, 24)

sum(x)
sum(y)
mean(x)
mean(y)
x - mean(x)
sum(x - mean(x))
(x - mean(x))^2
sum((x - mean(x))^2)
y - mean(y)
sum(y - mean(y))
(y - mean(y))^2
sum((y - mean(y))^2)
(x - mean(x)) * (y - mean(y))
sum((x - mean(x)) * (y - mean(y)))
sum((x - mean(x))^2) / 10
sqrt(sum((x - mean(x))^2) / 10)
sqrt(sum((y - mean(y))^2) / 10)
sum((x - mean(x)) * (y - mean(y))) / (10 * sqrt(sum((x - mean(x))^2) / 10) * sqrt(sum((y - mean(y))^2) / 10))
