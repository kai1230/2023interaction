void setup() {
  size(800, 800);
  resetGame();//投完1球，位置會重置
}

float x, y, vx, vy;
float X = 700; // 固定初始位置 x 座標
float Y = 650; // 固定初始位置 y 座標

boolean flying = false;
boolean shotMade = false;
int score = 0;
int attempts = 0; // 追蹤投籃的次數

void draw() {
  background(255);
  fill(255);
  stroke(255, 0, 0);
  rectMode(CENTER);
  rect(200, 100, 250, 200);//籃板

  fill(255);
  rect(200, 100, 125, 100);//籃板框線

  fill(255, 0, 0);
  rect(200, 120, 70, 10);//籃框

  if (flying) {
    x += vx;
    y += vy;
    vy += 8;

    // 檢查是否進球
    if (y > 100 && y < 140 && x > 150 && x < 250) {
      if (!shotMade) {
        score += 2; // 進球，增加2分
        shotMade = true;
      }
    }
    
    // 檢查是否超出邊界
    if (y > height) {
      resetGame(); // 重置遊戲狀態
    }
  } else {
    x = mouseX;
    y = mouseY;
    if (mousePressed) {
      fill(255);
      ellipse(X, Y, 20, 20);
      line(X, Y, x, y);
    }
  }
  fill(#FFA652);
  ellipse(x, y, 50, 50);

  // 顯示得分板
  fill(0);
  textSize(24);
  text("Score: " + score, width/2, 50);
  text("Attempts: " + attempts, width/2, 80);
}

void resetGame() {
  x = X;
  y = Y;
  vx = 0;
  vy = 0;
  flying = false;
  shotMade = false;
  attempts++;
}

void mousePressed() {
  x = X;
  y = Y;
  flying = false;
  shotMade = false;
}

void mouseReleased() {
  vx = X - mouseX;
  vy = Y - mouseY;
  flying = true;
}
