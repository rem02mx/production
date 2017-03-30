/**
 *    ブロック（ボールとブロックの衝突判定など）
 */
class Block {
  int x;                       // 左上頂点のx座標
  int y;                       // 左上頂点のy座標
  int sizeX;                   // ブロックの幅
  int sizeY;                   // ブロックの高さ
  boolean isBroken;            // ブロックが破壊されているか否か
  int count=0;
  // コンストラクタ
  Block(int x, int y, int sizeX, int sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    isBroken = false;
  }
  // ブロックの描画メソッド
  void show() {
    noStroke();
    if (count==0) {
      fill(0, 0, 255);       // ブロックの色は青
    } else if (count==1) {
      fill(#7F84FC);
    } else if (count==2) {
      fill(#ADC8F5);
    }else if(count==3){
      fill(#ADEFF5);
    }else if(count==4){
      fill(#E5001F);
    }
          rect(x, y, sizeX, sizeY);
  }
  // ボールとブロックとの衝突と破壊判定
  // 今回,ボールの衝突判定はボールの中心座標のみで行っている
  void collision(Ball ball) {
    // ボールが貫通弾でないなら、衝突した際にボールの進行方向を変える(速度を変える)
    if (!ball.getPenetrability()) {
      // ブロック左側に当たった場合
      if ((ball.getX() >= x) && (ball.getX() <= (x + 5)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
        ball.setVx(-1 * ball.getVx());
      }
      // ブロック右側に当たった場合
      if ((ball.getX() >= (x + sizeX - 5)) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y+sizeY))) {
        ball.setVx(-1 * ball.getVx());
        count=count+1;
      }
      // ブロック上側に当たった場合
      if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + 5))) {
        ball.setVy(-1 * ball.getVy());
        count=count+1;
      }
      // ブロック下側に当たった場合
      if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= (y + sizeY - 5)) && (ball.getY() <= (y + sizeY))) {
        ball.setVy(-1 * ball.getVy());
        count=count+1;
      }
    } else {
      if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
        isBroken=true;
      }
    }
    // 衝突による破壊判定
    if (count>=5) {
      isBroken = true;
    }
  }
  boolean isBroken() {
    return isBroken;
  }
}

