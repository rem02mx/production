/**
 * ブロック崩し
 */
class BlockBreak {
  //ブロック数設定
  final int blockNumX = 50;                           // x軸方向のブロック数(適当に変えてもOK)
  final int blockNumY = 10;                            // y軸方向のブロック数(適当に変えてもOK)
  final int blockNumAll = blockNumX * blockNumY;      // 総ブロック数
  //ブロック関連の初期値や固定値の設定
  final int blockX_init = 0;                          // ブロック位置x軸初期値
  int blockX = 0;                                     // ブロック位置x軸
  int blockY = 180;                                    // ブロック位置y軸
  // 各オブジェクト定義
  Ball ball;                                          // ボール定義
  Bar bar;                                            // バー定義
  Block[][] block;                                    // ブロック配列定義
  // コンストラクタ
  BlockBreak() {
    // ボールの生成
    ball = new Ball(width / 4, 100,3,4,5);
    // バーの生成
    bar = new Bar(width / 5, height / 100);
    // ブロック配列を生成
    block = new Block[blockNumY][blockNumX];
    // ブロックのサイズを決定
    int blockSizeX = width / blockNumX;
    int blockSizeY = height / 30;
    // ブロック群を生成 [回答欄]
    for(int i=0;i<blockNumY;i++){
     for(int j=0;j<blockNumX;j++){
       block[i][j]=new Block(blockX,blockY,blockSizeX,blockSizeY);
       blockX+=blockSizeX;
 }
 blockX=0;
 blockY+=blockSizeY;
 }}
  
  /** 1フレームごとの描画処理 */
void draw() {
    int breakBlockNum = 0;          // 壊れているブロックの数を初期化
    // 全てのブロックの破壊判定と描画 [回答欄]
    // クリアしているかの判定のため、壊れているブロックの数をカウントもしておく
    // ヒント: ブロックが消滅している場合、ブロックの衝突判定も描画も行わない
    for(int i=0;i<blockNumY;i+=1){
     for(int j=0;j<blockNumX;j+=1){
      if(block[i][j].isBroken()==true){
          breakBlockNum ++;
        }else{
          block[i][j].collision(ball);
          block[i][j].show();
        }}}



  
    // ブロックが残っているならばボール移動
    if(breakBlockNum < blockNumAll) {
      ball.move();                            // ボールの移動処理
      if(ball.collision() == false) {         // 壁との衝突判定
        fill(0, 0, 0);
        textSize(35);
        textAlign(CENTER, CENTER);
        text("Game Over!!", width / 2, height / 2);
      textSize(20);
      textAlign(CENTER, CENTER);                // テキストの配置を整える
      text("Press Mouse to restart!", width / 2, height/4);

        if(mousePressed==true){
  size(400, 500);         // ウインドウ設定
  fill(0, 0, 0);          // 塗りつぶし初期値
  blockBreak = new BlockBreak();
  background(255, 255, 255);      // 背景の初期化(フラッシュ)
  blockBreak.draw();
        }
      }
      else {
        bar.collision(ball);                    // バーとの衝突判定
      }
    }
    else {  // ブロックがすべて壊れているならば
      textSize(35);
      textAlign(CENTER, CENTER);                // テキストの配置を整える
      text("Clear!!", width / 2, height / 2);   // クリア表示
      textSize(20);
      textAlign(CENTER, CENTER);                // テキストの配置を整える
      text("Press Mouse to restart!", width / 2, height/4);
      if(mousePressed==true){
// ブロック崩し本体
  size(400, 500);         // ウインドウ設定
  fill(0, 0, 0);          // 塗りつぶし初期値
  blockBreak = new BlockBreak();
  background(255, 255, 255);      // 背景の初期化(フラッシュ)
  blockBreak.draw();
    }
    }    
    fill(0, 0, 0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text("Block:" + (blockNumAll - breakBlockNum), width - 40, height - 25);   // 残りブロック数表示
    bar.show();            // ボールを打ち返すためのボードを表示
    ball.show();           // ボールの描画
  }
}

