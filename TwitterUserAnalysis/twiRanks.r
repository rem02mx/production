rank_table <- data.frame(word=as.character(twi_table[c(-1),1]),freq=twi_table[c(-1),4])
rank_table <- subset(rank_table, rank(-freq)<10)

library(ggplot2)
rankPlot <-
 ggplot(rank_table, aes(x=reorder(word,freq*-1), y=freq)) +
   geom_bar(stat = "identity", fill="#b4ebfa",  width = 0.5,) +
   theme_minimal()+
   ggtitle("よくつぶやく単語")+
    xlab("単語")+
    ylab("頻度(回)")+
    theme(legend.position="none",text = element_text(size=4, family = "Osaka"))
ggsave(file = "rank.png", plot = rankPlot, dpi = 700, width = 3, height = 3)