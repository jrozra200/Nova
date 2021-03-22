# Chp 9

library(titanic)

data("titanic_test")
data("titanic_train")

head(titanic_test)
head(titanic_train)


dat <- titanic_train

dat$Survived <- ifelse(dat$Survived == 0, "Died", "Survived")

library(ggmosaic)

ggplot(dat) + 
    geom_mosaic(aes(x = product(Survived, Sex), fill = Survived)) + 
    scale_fill_brewer(palette = "Set1") + 
    ggtitle("Data") +
    theme(text = element_text(size = 16), legend.position = "top", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks = element_blank(), axis.title.y = element_blank())



other_dat <- data.frame(Sex = dat$Sex,
                        Survived = ifelse(rnorm(891) > 0, "Survived", "Died"))

ggplot(other_dat) + 
    geom_mosaic(aes(x = product(Survived, Sex), fill = Survived)) + 
    scale_fill_brewer(palette = "Set1") + 
    ggtitle("Independence") +
    theme(text = element_text(size = 16), legend.position = "top", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks = element_blank(), axis.title.y = element_blank())
table(other_dat$Sex)

# Section 4

dat <- data.frame(eaten = c("Eaten", "Not Eaten"),
                  infection = c("Uninfected", "Uninfected", "Lightly Infected",
                               "Lightly Infected", "Highly Infected", 
                               "Highly Infected"),
                  values = c(1, 49, 10, 35, 37, 9))

dat$eaten <- factor(dat$eaten, levels = c("Not Eaten", "Eaten"))
dat$infection <- factor(dat$infection, 
                        levels = c("Uninfected", "Lightly Infected", 
                                   "Highly Infected"))

ggplot(dat) + 
    geom_mosaic(aes(x = product(eaten, infection), fill = eaten, weight = values)) + 
    scale_fill_brewer(palette = "Set1") + 
    theme(text = element_text(size = 16), legend.position = "top", 
          legend.title = element_blank(), panel.background = element_blank(),
          axis.ticks = element_blank(), axis.title = element_blank())
