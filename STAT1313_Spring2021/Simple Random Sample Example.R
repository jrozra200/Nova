library(ggplot2)


df <- data.frame()
for(i in 1:100){
    samp <- sample(1:10, 4)
    tmp <- data.frame(iteration = i,
                      mean = mean(samp),
                      median = median(samp),
                      samp = paste(samp, collapse = ","))
    
    df <- rbind(df, tmp)
}

ggplot(data = df, aes(x = iteration, y = mean)) +
    geom_point() +
    # geom_line() +
    geom_hline(yintercept = mean(1:10), color = "red") + 
    ggtitle(paste(dim(df)[1], "four 'person' samples from 1-10; average of the",
                  "samples is: ", mean(df$mean)))
