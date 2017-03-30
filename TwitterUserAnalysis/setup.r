setwd("~/Desktop/TwitterUserAnalysis")

library(twitteR)
library(ROAuth)
consumerKey <- "dbETnsOE5gBlfJjnAcNphucdv"
consumerSecret <- "VvunMWZl5qiG8i6VINm8ewaEncEH8XsaTkt958Jjhu1o29RKdx"
accessToken <- "2828699870-qBlWT5fBb5JeK5JJWjzLygWg5LKDy5YpmIiCnpv"
accessSecret <- "pIa5smFKm0nSEbFWSbpF1BhRcL3DaEpqf0lvJ75sBkSdD"
download.file(url="https://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL ="https://api.twitter.com/oauth/request_token",
                         accessURL = "https://api.twitter.com/oauth/access_token",
                         authURL="https://api.twitter.com/oauth/authorize")
load("new authentication.Rdata")
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessSecret)