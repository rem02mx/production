#指定アカウントのツイートの,　ネガティブワード・ポジティブワードの""数""を表したグラフを生成する
#ポジティブワード・ネガティブワードの""割合""を円グラフにするものは作成中

#単語感情極性表を読み込む
pndic <- read.table("http://www.lr.pi.titech.ac.jp/~takamura/pubs/pn_ja.dic",
                     sep=":",
                     col.names = c("term","kana","pos","value"),
                     colClasses=c("character","character","factor","numeric"),
                     fileEncoding = "SJIS")

#名詞＋品詞で複数の候補がある場合は平均値を採用
pndic2 <- aggregate(value ~ term + pos,pndic,mean)

#下処理したデータから単語感情極性表に含まれる単語を抽出
tweetDF<-subset(twi_table,Term %in% pndic2$term)

#単語感情極性表の属性をマージ
tweetDF<-merge(tweetDF, pndic2,by.x = c("Term","Info1"),by.y=c("term","pos"))

#単語毎にスコア算出
score<-tweetDF[4:(ncol(tweetDF) - 2)]*pndic2$value

#描画用データを作成
ans <-c(sum(score > 0),sum(score < 0))

#グラフ作成のライブラリを読み込む
library(ggplot2)

#グラフ用データフレームを作成
ansDF <- data.frame(
  emotion = c("positive", "negative"),
  value = ans
  )

#グラフ作成
emoPlot <-  ggplot(ansDF) +
   geom_bar(aes(x=emotion, y= value, fill=emotion), width = 0.5, stat="identity", position="dodge") +
   geom_text(aes(x= emotion, y= value, label=value),size=1.5, position="stack",vjust = 3) +
   ggtitle("ツイートワードネガポジ")+
   ylab("単語数(個)")+
   theme_minimal()+
   scale_fill_brewer(palette="Blues")+
   theme(legend.position="none",text = element_text(size=4, family = "Osaka"))

#作成したグラフをpng形式で保存
ggsave(file = "emotion.png", plot = emoPlot, dpi = 700, width = 3, height = 2)
