pndic <- read.table("http://www.lr.pi.titech.ac.jp/~takamura/pubs/pn_ja.dic",
                     sep=":",
                     col.names = c("term","kana","pos","value"),
                     colClasses=c("character","character","factor","numeric"),
                     fileEncoding = "SJIS")
pndic2 <- aggregate(value ~ term + pos,pndic,mean)
tweetDF<-subset(twi_table,Term %in% pndic2$term)
tweetDF<-merge(tweetDF, pndic2,by.x = c("Term","Info1"),by.y=c("term","pos"))
score<-tweetDF[4:(ncol(tweetDF) - 2)]*pndic2$value

ans <-c(sum(score > 0),sum(score < 0))
library(ggplot2)
ansDF <- data.frame(
  emotion = c("positive", "negative"),
  value = ans
  )
emoPlot <-  ggplot(ansDF) +
   geom_bar(aes(x=emotion, y= value, fill=emotion), width = 0.5, stat="identity", position="dodge") +
   geom_text(aes(x= emotion, y= value, label=value),size=1.5, position="stack",vjust = 3) +
   ggtitle("ツイートワードネガポジ")+
   ylab("単語数(個)")+
   theme_minimal()+
   scale_fill_brewer(palette="Blues")+
   theme(legend.position="none",text = element_text(size=4, family = "Osaka"))
   ggsave(file = "emotion.png", plot = emoPlot, dpi = 700, width = 3, height = 2)