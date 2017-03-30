library(RMeCab)
tweets <- RMeCabFreq("tweetData.R")
excludeWord <- read.table( "Exclude.txt", header = T )
twi_table <- tweets[(tweets[,2]=="副詞")|(tweets[,2]=="動詞"&(tweets[,3]!="接尾"))|(tweets[,2]=="形容詞")|(tweets[,2]=="感動詞")|(tweets[,2]=="接続詞")|(tweets[,2]=="名詞"&(tweets[,3]=="一般"|tweets[,3]=="固有名詞")),]
flags <- c(rep(0, times = nrow( twi_table )))
twi_table <- cbind( twi_table, flags)
twi_table[na.omit( match( excludeWord$exclude, twi_table$Term)), 5] <- 1
twi_table <- twi_table[ twi_table[,4] > 1 & twi_table[,5] == 0, ]
twi_table[na.omit( match( excludeWord$exclude, twi_table$Term)), 5] <- 1
twi_table <- twi_table[ twi_table[,4] > 1 & twi_table[,5] == 0, ]
twi_table  <- twi_table[rev(order(twi_table$Freq)),]