#下処理したデータから, 単語頻出回数が2以上のデータを抽出
clusterWord <- twi_table[twi_table$Freq>2, ]

#名詞で絞り込む
clusterWord <- cloud_table[cloud_table$Info1=="名詞" , ]

#単語と頻出回数のみのデータフレームを作成しその中で上位3単語以内を抽出
cluster <- data.frame(word=as.character(clusterWord[,1]),freq=clusterWord[,4])
cluster <- subset(cluster, rank(-freq)<5)

#頻出回数がトップの単語を保管
clusterName <- cluster[1,1]

#表示する文字列の形成
txt <- paste0(userID, "さんは、「", clusterName, "」クラスタです")

#グラフ作成
clusterplot<-
ggplot(cluster, aes(x=reorder(word,freq*-1), y=freq)) +
   geom_bar(stat = "identity", fill="#b4ebfa",  width = 0.5,) +
   theme_minimal()+
   ggtitle("よくつぶやく用語")+
    xlab("単語")+
    ylab("頻度(回)")+
    annotate("text", label=txt[[1]], x=3, y=30, size=1.8,family = "Osaka")+
    theme(legend.position="none", text = element_text(size=4, family = "Osaka"))

#作成したグラフをpng形式で保存
ggsave(file = "cluster.png", plot = clusterplot, dpi = 700, width = 3, height = 3)
