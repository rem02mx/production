// ブロック崩し本体
BlockBreak blockBreak;
  
// セットアップ
void setup() {
  size(400, 500);         // ウインドウ設定
  fill(0, 0, 0);          // 塗りつぶし初期値
  blockBreak = new BlockBreak();
}
  
// 1フレームごとの描画処理
void draw() {
  background(255, 255, 255);      // 背景の初期化(フラッシュ)
  blockBreak.draw();
}
