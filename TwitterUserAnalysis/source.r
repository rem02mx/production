#TwitterAPIを使用するための準備
#(DesktopのTwitterUserAnalysisというフォルダ内に格納されたソースコードsetup.rを起動)
source('~/Desktop/TwitterUserAnalysis/setup.r')

#手打ち
#ツイートを読み込みデータ化する
#解析するTwitterのアカウントID
userID <- "pyyyming"

#ツイート読み込み
tldata <- userTimeline(userID,n=1000,maxID=NULL,sinceID=NULL,includeRts=FALSE,excludeReplies=FALSE)

#ツイートの初期処理
exts <- sapply(tldata, statusText)
texts %<>% str_replace_all(“\\p{ASCII}”, “”)
texts <- texts[!is.na(texts)]

#読み込んだツイートをRのデータとして書き出し
sink( file = "tweetData.r" )
tldata
sink()
#手打ちここまで

#読み込んだツイートデータの下処理
#(DesktopのTwitterUserAnalysisというフォルダ内に格納されたソースコードtwiR.rを起動)
source("~/Desktop/TwitterUserAnalysis/twiR.r")

#ランキング, グラフ作成
#(DesktopのTwitterUserAnalysisというフォルダ内に格納されたソースコードtwiRanks.rを起動)
source("~/Desktop/TwitterUserAnalysis/twiRanks.r")

#クラスター分析, グラフ作成
#(DesktopのTwitterUserAnalysisというフォルダ内に格納されたソースコードcluster.rを起動)
source("~/Desktop/TwitterUserAnalysis/cluster.r")

#ワードクラウド作成
#(DesktopのTwitterUserAnalysisというフォルダ内に格納されたソースコードtwiClouds.rを起動)
source("~/Desktop/TwitterUserAnalysis/twiClouds.r")

#ネガポジ判定, グラフ作成
#(DesktopのTwitterUserAnalysisというフォルダ内に格納されたソースコードnegpoj.rを起動)
source("~/Desktop/TwitterUserAnalysis/negpoj.r")
