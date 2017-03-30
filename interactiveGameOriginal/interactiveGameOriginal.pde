//落ちてくるアルファベットを拾うゲーム
//フィールド上でマウスを左右に動かしてアルファベットを拾う
//アルファベットひとつひとつにポイントが設定してあり、100個落ち切るとポイントの平均値が表示される
//今回は時間や技術不足の都合でここまでだが、これを1～4のステージにし、
//さらに細かいポイント換算や落ちてくるものの変化を加えて大作にしたい
//(ゲームオーバー＝留年,クリア＝卒業)etc...

int x=50;
int y=8;              
Text[] aText = new Text[100];
Bar aBar;
int m;
float point;
float get = 0;

void setup() {
  frameRate(60);
  size(400, 500);
  noStroke();
  smooth();
  fill(0);
  for (int i = 0; i < aText.length; i++) {
    aText[i] = new Text();
    aBar = new Bar();
  }
  m = 0;
}

void draw() {
  background(255);
  for (int i =0; i <= m; i++) {
    aText[i].drawText();
    aBar.drawBar();
    println(point);
    println(get);
  }
  if(aText[99].y >= height){
  text("GPA=", 200, 250);
  text(point/get,270,250);
  }
}



class Text {
  float x;
  float y;
  float i;
  float speed;
  Text() {
    this.x = random(100, 300);
    this.i = (int)random(1, 6);
    this.speed = 5;
  }
  void drawText() {
    if (y == 100 && m < aText.length-1) {
      m++;
      aText[m].x = random(100, 300);
      aText[m].y = 0;
      aText[m].speed = speed;
    }

    textSize(20);
    if (i == 1) {
      textAlign(CENTER);
      text("S", x, y);
      if (y == aBar.y && x > mouseX - aBar.sizeX/2 && x < mouseX + aBar.sizeX/2) {
        point += 4;
        x = -50;
        get += 1;
      }
    }
    if (i == 2) {
      text("A", x, y );
      if (y == aBar.y && x > mouseX - aBar.sizeX/2 && x < mouseX + aBar.sizeX/2) {
        point += 3;
        x = -50;
        get += 1;
      }
    }
    if (i == 3) {
      text("B", x, y );
      if (y == aBar.y && x > mouseX - aBar.sizeX/2 && x < mouseX + aBar.sizeX/2) {
        point += 2;
        x = -50;
        get += 1;
      }
    }
    if (i == 4) {
      text("C", x, y );
      if (y == aBar.y && x > mouseX - aBar.sizeX/2 && x < mouseX + aBar.sizeX/2) {
        point += 1;
        x = -50;
        get += 1;
      }
    }
    if (i == 5) {
      text("D", x, y );
      if (y == aBar.y && x > mouseX - aBar.sizeX/2 && x < mouseX + aBar.sizeX/2) {
        point += 0;
        x = -50;
        get += 1;
      }
    }
     if (frameCount < 200) {
    textSize(28);
    text("Let's get TANNI !!!", width / 5, height / 2);
  }
  else {
    if (frameCount < 250) {
      textSize(32);
      text("Go!", width / 2 -30, height / 2);
    }
    y = y + speed;  
  }
}
}

class Bar {
  final int y = height - 50;
  int sizeX = 75;
  int sizeY = 5;
  void drawBar() {
    rect(mouseX-sizeX/2, y, sizeX, sizeY);
  }
}


