clusterWord <- twi_table[twi_table$Freq>2, ]
clusterWord <- clusterWord[clusterWord$Info2=="固有名詞", ]
cluster <- data.frame(word=as.character(clusterWord[,1]),freq=clusterWord[,4])
cluster <- subset(cluster, rank(-freq)<3)
clusterName <- cluster[1,1]

txt <- paste0(userID, "さんは、「", clusterName, "」クラスタです")

clusterplot<-
ggplot(cluster, aes(x=reorder(word,freq*-1), y=freq)) +
   geom_bar(stat = "identity", fill="#b4ebfa",  width = 0.5,) +
   theme_minimal()+
   ggtitle("よくつぶやく固有名詞")+
    xlab("単語")+
    ylab("頻度(回)")+
    annotate("text", label=txt[[1]], x=1.2, y=25, size=1.8,family = "Osaka")+
    theme(legend.position="none", text = element_text(size=4, family = "Osaka"))
ggsave(file = "cluster.png", plot = clusterplot, dpi = 700, width = 3, height = 3)