/**
 *    バー
 */
class Bar {
  final int y = height - 50;    // バーの左上のy座標 (底から50で固定)
  final int y0 = 50;
  int sizeX;                    // バー全体の幅(なるべく5の倍数が良い)
  int sizeY;                    // バーの高さ
  int boxSizeX;                 // 分割した時の箱一つ分の幅(全体の1/5)
  int[] boxX;   // バーの各区切りのx座標(左から0)
  
  Bar(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    boxSizeX = sizeX / 5;
    boxX = new int[6];
  }
  
  void collision(Ball ball) {
    if((ball.getY() >= (y - ball.getD() / 2)) &&
       (ball.getY() <= (y + sizeY - ball.getD() / 2))) {  // ボールのy座標がバーと重なる時
      if((ball.getX() >= boxX[0]) && (ball.getX() <= boxX[1])) {  // 左黒Boxに衝突
        ball.setVx(-2);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
      else if((ball.getX() > boxX[1]) && (ball.getX() <= boxX[2])) {   // 左白Boxに衝突
        ball.setVx(-1);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
      else if((ball.getX() > boxX[2]) && (ball.getX() <= boxX[3])) {   // 中心赤Boxに衝突
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(true);     // ボールのブロック貫通性あり
      }
      else if((ball.getX() > boxX[3]) && (ball.getX() <= boxX[4])) {   // 右白Boxに衝突
        ball.setVx(1);
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
      else if((ball.getX() > boxX[4]) && (ball.getX() <= boxX[5])) {   // 右黒Boxに衝突
        ball.setVx(2); 
        ball.setY(y - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
    }

    if((ball.getY() >= (y0 - ball.getD() )) &&
       (ball.getY() <= (y0 + sizeY - ball.getD()))) {  // ボールのy座標がバーと重なる時
      if((ball.getX() >= boxX[0]) && (ball.getX() <= boxX[1])) {  // 左黒Boxに衝突
        ball.setVx(-2);
        ball.setY(y0 - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
      else if((ball.getX() > boxX[1]) && (ball.getX() <= boxX[2])) {   // 左白Boxに衝突
        ball.setVx(-1);
        ball.setY(y0 - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
      else if((ball.getX() > boxX[2]) && (ball.getX() <= boxX[3])) {   // 中心赤Boxに衝突
        ball.setY(y0 - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(true);     // ボールのブロック貫通性あり
      }
      else if((ball.getX() > boxX[3]) && (ball.getX() <= boxX[4])) {   // 右白Boxに衝突
        ball.setVx(1);
        ball.setY(y0 - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
      else if((ball.getX() > boxX[4]) && (ball.getX() <= boxX[5])) {   // 右黒Boxに衝突
        ball.setVx(2); 
        ball.setY(y0 - ball.getD() / 2);
        ball.setVy(-ball.getVy());
        ball.setPenetrability(false);    // ボールのブロック貫通性なし
      }
    }
  }




  // バー表示メソッド
  void show() {
    boxX[0] = mouseX - this.sizeX / 2;            // 左黒Boxの左上頂点のx座標
    boxX[1] = mouseX - 3 * (boxSizeX / 2);     // 左白Boxの左上頂点のx座標
    boxX[2] = mouseX - boxSizeX / 2;           // 中央赤Boxの左上頂点のx座標
    boxX[3] = mouseX + boxSizeX / 2;           // 右白Boxの左上頂点のx座標
    boxX[4] = mouseX + 3 * (boxSizeX /2);      // 右黒Boxの左上頂点のx座標
    boxX[5] = mouseX + this.sizeX / 2;            // 右黒Boxの"右上"頂点のx座標
    
    // バーの描画
    fill(100);
    rect(boxX[0], y, boxSizeX, sizeY);        // 左黒Box
    rect(boxX[0], y0, boxSizeX, sizeY);        // 左黒Box
    fill(#D9DDDE);
    rect(boxX[1], y, boxSizeX, sizeY);        // 左白Box
    rect(boxX[1], y0, boxSizeX, sizeY);        // 左白B
    fill(255, 0, 0);
    rect(boxX[2], y, boxSizeX, sizeY);        // 中央赤Box
    rect(boxX[2], y0, boxSizeX, sizeY);        // 中央赤Box
    fill(#D9DDDE);
    rect(boxX[3], y, boxSizeX, sizeY);        // 右黒Box
    rect(boxX[3], y0, boxSizeX, sizeY);        // 右黒Box
    fill(100);
    rect(boxX[4], y, boxSizeX, sizeY);        // 右白Box
    rect(boxX[4], y0, boxSizeX, sizeY);        // 右白Box
  }
  
  int getX(int i) {
    return boxX[i];
  }
  int getY(){
    return y;
  }
  int getY0(){
    return y0;
  }
  int getSizeX(){
    return sizeX;
  }
  int getSizeY(){
    return sizeY;
  }
}
