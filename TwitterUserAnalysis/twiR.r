#RでMeCabを利用した形態素解析をするためのライブラリを読み込む
library(RMeCab)

#解析データの読み込み
tweets <- RMeCabFreq("tweetData.R")

#除外する文字データの読み込み
excludeWord <- read.table( "Exclude.txt", header = T )

#解析データを副詞, 接尾辞以外の動詞, 形容詞, 感動詞, 接続詞, 一般名詞, 固有名詞のみに絞る
twi_table <- tweets[(tweets[,2]=="副詞")|(tweets[,2]=="動詞"&(tweets[,3]!="接尾"))
                    |(tweets[,2]=="形容詞")|(tweets[,2]=="感動詞")|(tweets[,2]=="接続詞")
                    |(tweets[,2]=="名詞"&(tweets[,3]=="一般"|tweets[,3]=="固有名詞")),]

#flagを追加
flags <- c(rep(0, times = nrow( twi_table )))
twi_table <- cbind( twi_table, flags)

#解析データと除外文字データをマッチング
twi_table[na.omit( match( excludeWord$exclude, twi_table$Term)), 5] <- 1

#下処理したデータから, 単語頻出回数が1以上かつ,マッチングさせた中でフラグが立っていないデータを抽出し,単語頻出回数の多い順にソート
#(念入りに2回行う)
twi_table <- twi_table[twi_table[,4] > 1 & twi_table[,5] == 0, ]
twi_table <- twi_table[rev(order(twi_table$Freq)),]
twi_table <- twi_table[twi_table[,4] > 1 & twi_table[,5] == 0, ]
twi_table <- twi_table[rev(order(twi_table$Freq)),]
