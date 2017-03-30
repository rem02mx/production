# 制作物　　


## TwitterUserAnalysis  
TwitterのユーザIDを指定 → 解析 → 4つのpngを作成
* よくつぶやく単語ランキング(rank.png)  
* クラスター分析(cluster.png)  
* ワードクラウド(cloud.png)  
* ツイート単語ネガポジ(emotion.png)  
### 動かし方
*Rの実行環境が整っていることを前提とする*
1. DesktopにTwitterUserAnalysisというフォルダを生成
2. TwitterUserAnalysisに以下を格納
  * setup.r
  * twiR.r
  * twiRanks.r
  * cluster.r
  * twiClouds.r
  * negpoj.r
  * Exclude.txt
  * cacert.pem
  * new authentication.Rdata
  * source.r  
3. source.rを上から順に実行  
  

## blockBreakOriginal
所謂ブロック崩し  
バー操作はウインドウ上でマウスを動かすことで行う  
天井または床にボールが当たるとゲームオーバー  
ブロック破壊の難易度は5段階（5回当てるとブロックが消える）  
ゲームオーバーまたはゲームクリアのときに「Press Mouse to restart!」の案内が出現、  
マウスボタンをクリックすることでまたゲームが開始される  
  
  
## interactiveGameOriginal
落ちてくるアルファベットを拾うゲーム（単位取りゲーム）  
フィールド上でマウスを左右に動かしてアルファベットを拾う  
アルファベットひとつひとつにポイントが設定してあり、100個落ち切るとポイントの平均値が表示される  
