#ワードクラウドを保存するためのpng作成
png("cloud.png")

#下処理したデータの頻出回数上位100単語を抽出
cloud_table <- subset(twi_table, rank(-Freq)<100)

#100単語中動詞を削除
cloud_word <- cloud_table[cloud_table$Info1!="動詞" , ]

#ワードクラウドを作成するためのライブラリを読み込む
library( wordcloud )

#カラーパレットを使用するためのライブラリを読み込む
library( RColorBrewer )

#ワードクラウドを作成し保存
par(family = "Osaka")
wordcloud( cloud_word[c(-2),1],cloud_word[c(-1),4], scale = c( 6, 1 ), min.freq = 1 ,
          max.words = Inf, random.order = FALSE, rot.per =.05,colors = brewer.pal(9, "Blues"))
 dev.off()
