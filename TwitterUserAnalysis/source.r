#TwitterAPIを使用するための準備
source('~/Desktop/TwitterUserAnalysis/setup.R')

#手打ち
#ツイートを読み込みデータ化する
#解析するTwitterのアカウントID
userID <- "pyyyming"

#ツイート読み込み
tldata <- userTimeline(userID,n=1000,maxID=NULL,sinceID=NULL,includeRts=FALSE,excludeReplies=FALSE)

#読み込んだツイートをRのデータとして書き出し
sink( file = "tweetData.R" )
tldata
sink()
#手打ちここまで

#読み込んだツイートデータの下処理
source("~/Desktop/TwitterUserAnalysis/twiR.R")

#ランキング, グラフ作成
source("~/Desktop/TwitterUserAnalysis/twiRanks.R")

#クラスター分析, グラフ作成
source("~/Desktop/TwitterUserAnalysis/cluster.R")

#ワードクラウド作成
source("~/Desktop/TwitterUserAnalysis/twiClouds.R")

#ネガポジ判定, グラフ作成
source("~/Desktop/TwitterUserAnalysis/negpoj.R")
