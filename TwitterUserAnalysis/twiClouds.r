png("cloud.png")
cloud_table <- subset(twi_table, rank(-Freq)<100)

library( wordcloud )
library( RColorBrewer )
par(family = "Osaka")
wordcloud( cloud_table[c(-1),1],cloud_table[c(-1),4], scale = c( 6, 1 ), min.freq = 1 ,max.words = Inf, random.order = FALSE, rot.per =.05,colors = brewer.pal(9, "Blues"))
 dev.off()