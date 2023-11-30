PImage imgRack;
int buttonX = 300, buttonY = 300;//startgame按鍵
int buttonW=10, buttonR=10;//stop按鍵
int buttonWidth1 = 200, buttonHeight1 = 100;//startgame長跟寬
int buttonWidth2 = 50, buttonHeight2 = 30;//stop長跟寬
boolean flying = false;
boolean gameStarted = false;
float x, y, vx, vy;
float X = 700; // 固定初始位置 x 座標
float Y = 650; // 固定初始位置 y 座標

boolean shotMade = false;
int score = 0;
int attempts = -1; // 追蹤投籃的次數
void setup() {
  size(800, 800);
  textSize(50);
  imgRack = loadImage("1.jpg");
}

void draw() {
  background(200);
  if (gameStarted) {
    // 在遊戲畫面顯示的內容
    background(255);
    image(imgRack, -200, -400);
    if (mouseX > buttonW && mouseX < buttonW + buttonWidth2 &&
      mouseY > buttonR && mouseY < buttonR + buttonHeight2) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }
    rect(buttonW, buttonR, buttonWidth2, buttonHeight2);
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Stop", buttonW + buttonWidth2 / 2, buttonR + buttonHeight2 / 2);
    fill(0);
    rect(315, 120, 70, 10);//籃框
    if (flying) {
      x += vx; //反過來說, 沒有 game over 就會動
      y += vy;
      vy += 6;
      // 檢查是否進球
      if (y > 120 && y < 140 && x > 260 && x < 400) {
        if(vy<0) vy = - vy; 
        else if (!shotMade) {
          score += 2; // 進球，增加2分
          shotMade = true;
        }
      }
      // 檢查是否超出邊界
      if (y > 1000) {
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
    fill(255,0,0);
    textSize(30);
    text("Score: " + score, width/1.25, 50);
    text("Attempts: " + attempts, width/1.25, 80);
    if(attempts==5 && score<=6)gameStarted = false;
  } else {
    // 檢查滑鼠是否在按鈕範圍內
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 畫按鈕
    rect(buttonX, buttonY, buttonWidth1, buttonHeight1);

    // 顯示按鈕文字
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Start Game", buttonX + buttonWidth1 / 2, buttonY + buttonHeight1 / 2);
  }
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
  x = X ;
  y = Y ;
  shotMade = false;
  flying = false; //不飛行
  // 檢查滑鼠是否在按鈕範圍內
  if (!gameStarted && mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
    mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
    // 開始遊戲
    gameStarted = true;
  }
  if (gameStarted && mouseX > buttonW && mouseX < buttonW + buttonWidth2 &&
    mouseY > buttonR && mouseY < buttonR + buttonHeight2) {
    // 開始遊戲
    gameStarted = false;
  }
}
void mouseReleased() {
  vx = X-mouseX;
  vy = Y-mouseY;
  flying = true; //飛行
}
