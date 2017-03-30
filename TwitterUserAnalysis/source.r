source('~/Desktop/TwitterUserAnalysis/setup.R')

#手打ち
userID <- "pyyyming"
tldata <- userTimeline(userID,n=1000,maxID=NULL,sinceID=NULL,includeRts=FALSE,excludeReplies=FALSE)
sink( file = "tweetData.R" )
tldata
sink()
#ここまで

source("~/Desktop/TwitterUserAnalysis/twiR.R")
source("~/Desktop/TwitterUserAnalysis/twiRanks.R")
source("~/Desktop/TwitterUserAnalysis/cluster.R")
source("~/Desktop/TwitterUserAnalysis/twiClouds.R")
source("~/Desktop/TwitterUserAnalysis/negpoj.R")