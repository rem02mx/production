#ツイート単語と頻出回数のみのデータフレームを作成しその中で上位10単語以内を抽出
#(解析にかけているユーザのアカウントIDがトップに来てしまうためそれは覗いて抽出している)
rank_table <- data.frame(word=as.character(twi_table[c(-1),1]),freq=twi_table[c(-1),4])
rank_table <- subset(rank_table, rank(-freq)<10)

#グラフ作成のライブラリを読み込む
library(ggplot2)

#グラフ作成
rankPlot <-
 ggplot(rank_table, aes(x=reorder(word,freq*-1), y=freq)) +
   geom_bar(stat = "identity", fill="#b4ebfa",  width = 0.5,) +
   theme_minimal()+
   ggtitle("よくつぶやく単語")+
    xlab("単語")+
    ylab("頻度(回)")+
    theme(legend.position="none",text = element_text(size=4, family = "Osaka"))

#作成したグラフをpng形式で保存
ggsave(file = "rank.png", plot = rankPlot, dpi = 700, width = 3, height = 3)
