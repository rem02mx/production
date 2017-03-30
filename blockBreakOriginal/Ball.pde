/**
 *    ボール（主にボールの移動）
 */
class Ball {
  int x;                          // ボールのX座標
  int y;                          // ボールのY座標
  float vx;                         // ボールのX軸速度
  float vy;                         // ボールのY軸速度
  int d;                          // ボールの直径
  boolean penetrability;          // ボールのブロック貫通性
  
  // コンストラクタ
  Ball(int x, int y, float vx, float vy, int d) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.d = d;
    penetrability = false;
  }
  
  // ボールの移動
  void move() {
    x += vx;
    y += vy; 
  }
  
  // 壁との衝突判定
  boolean collision() {
    if(x <= d / 2){  // 左壁
      x = d / 2;
      vx = -vx;
    }
    if(y <= d/2){  // 天井
      vx = 0;
      vy = 0;
      return false;
    }    
    if(x >= (width - d / 2)){  // 右壁
      x = width - d / 2;
      vx = -vx;
    }
    if(y >= (height - d / 2)){  // 底面(ゲームオーバー)
      vx = 0;
      vy = 0;
      return false;
    }
    return true;
  }
  
  // ボールの描画
  void show() {
        noStroke();
    if(penetrability) {
      fill(255, 0, 0);        //　貫通弾の時は赤
    }
    else {
      fill(0, 0, 0);          //　通常時は黒
    }
    ellipse(x, y, d, d);      // ボールの描画
  }
  
  // これ以降、SetterとGetter
  int getX() {
    return x;
  }
  void setY(int y){
    this.y = y;
  }
  int getY(){
    return y;
  }
  void setVx(float vx) {
    this.vx = vx;
  }
  float getVx(){
    return vx;
  }
  void setVy(float vy) {
    this.vy = vy;
  }
  float getVy() {
    return vy;
  }
  int getD() {
    return d;
  }
  void setPenetrability(boolean penetrability) {
    this.penetrability = penetrability;
  }
  boolean getPenetrability() {
    return penetrability;
  }
}

