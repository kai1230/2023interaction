PImage imgRack;
PImage imgRack1;
PFont myFont; // 定義字體變數
int buttonX = 300, buttonY = 300; // 開始遊戲按鈕位置
int buttonW = 10, buttonR = 10; // 停止按鈕位置
int buttonWidth1 = 200, buttonHeight1 = 100; // 開始遊戲按鈕大小
int buttonWidth2 = 50, buttonHeight2 = 30; // 停止按鈕大小

boolean flying = false;
int State = 0;
boolean game1Completed = false;
boolean game2Completed = false;
boolean introScreen = false; // 追蹤是否在介紹畫面


float x, y, vx, vy;
float X = 700; // 初始位置 x 座標
float Y = 550; // 初始位置 y 座標

boolean shotMade = false;
int score = 0;
int score2= 0;
int score3= 0;
int attempts = -1; // 追蹤投籃的次數
int t=500;//計時器

void setup() {
  size(800, 800);
  textSize(50);
  imgRack = loadImage("1.jpg");
  imgRack1 = loadImage("2.jpg");
  myFont = createFont("標楷體", 32); // 載入中文字型，32是字體大小
  textFont(myFont); // 設置使用自定義字體
}

void draw() {
  background(200);
  if (State == 0) {
    // 初始畫面
    image(imgRack1, -200, -400);
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("點擊開始遊戲進入介紹畫面", 400, 450);

    // 檢查開始遊戲按鈕範圍
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 繪製開始遊戲按鈕
    rect(buttonX, buttonY, buttonWidth1, buttonHeight1);

    // 顯示開始遊戲按鈕文字
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("開始遊戲", buttonX + buttonWidth1 / 2, buttonY + buttonHeight1 / 2);
  } else if (State == 1) {
    // 介紹畫面
    background(200);
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("遊戲介紹\n使用滑鼠向下拉投籃\n點擊繼續進入遊戲", 400, 500);

    // 檢查開始遊戲按鈕範圍
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 繪製繼續遊戲按鈕
    rect(buttonX, buttonY, buttonWidth1, buttonHeight1);

    // 顯示繼續遊戲按鈕文字
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("繼續", buttonX + buttonWidth1 / 2, buttonY + buttonHeight1 / 2);
  } else if (State == 2) {
    // 遊戲畫面
    background(255);
    image(imgRack, -200, -400);

    // 停止按鈕的檢查與顯示
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
    text("停止", buttonW + buttonWidth2 / 2, buttonR + buttonHeight2 / 2);
    fill(0);
    rect(315, 120, 70, 10); // 籃框
    if (flying) {
      x += vx; // 反過來說, 沒有 game over 就會動
      y += vy;
      vy += 6;
      // 檢查是否進球
      if (y > 120 && y < 140 && x > 260 && x < 380) {
        if (vy < 0) vy = -vy;
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
    fill(255, 0, 0);
    textSize(30);
    text("得分: " + score, width / 1.25, 50);
    text("嘗試次數: " + attempts, width / 1.25, 80);
    if (attempts > 10 && score <= 6) {
      State = 0;
      score = 0; // 重置分數
      attempts = -1 ; // 重置投籃次數
    }
    if (game1Completed) {
      //顯示通關畫面
      background(200);
      fill(0);
      textSize(50);
      textAlign(CENTER, CENTER);
      text("關卡1通關", width/2, height/2);

      if (mouseX > buttonW+325 && mouseX < 485 &&
        mouseY > buttonR+450 && mouseY < 535) {
        fill(0); // 如果滑鼠在按鈕上，改變填充顏色
      } else {
        fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
      }
      rect(buttonW+325, buttonR+450, 150, 75);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("回首頁", 410, 495);

      if (mouseX > buttonW+325 && mouseX < 485 &&
        mouseY > buttonR+550 && mouseY < 620) {
        fill(0); // 如果滑鼠在按鈕上，改變填充顏色
      } else {
        fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
      }
      rect(buttonW+325, buttonR+550, 150, 75);
      fill(255);
      textSize(30);
      text("下一關", 410, 595);
    } else if (score > 2) {
      game1Completed = true;
    }
  }
  if (State==4) {
    // 介紹畫面
    background(200);
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("遊戲介紹\n使用滑鼠向下拉投籃\n增加計時器:15秒內進3球\n點擊繼續進入遊戲", 400, 500);

    // 檢查開始遊戲按鈕範圍
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 繪製繼續遊戲按鈕
    rect(buttonX, buttonY, buttonWidth1, buttonHeight1);

    // 顯示繼續遊戲按鈕文字
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("繼續", buttonX + buttonWidth1 / 2, buttonY + buttonHeight1 / 2);
  }
  if (State==5) {
    // 遊戲畫面
    background(255);
    image(imgRack, -200, -400);

    // 停止按鈕的檢查與顯示
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
    text("停止", buttonW + buttonWidth2 / 2, buttonR + buttonHeight2 / 2);
    fill(0);
    rect(315, 120, 70, 10); // 籃框
    if (flying) {
      x += vx; // 反過來說, 沒有 game over 就會動
      y += vy;
      vy += 6;
      // 檢查是否進球
      if (y > 120 && y < 140 && x > 260 && x < 380) {
        if (vy < 0) vy = -vy;
        else if (!shotMade) {
          score2 += 2; // 進球，增加2分
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
    fill(255, 0, 0);
    textSize(30);
    text("得分: " + score2, width / 1.25, 50);
    text("嘗試次數: " + attempts, width / 1.25, 80);
    //顯示計時器
    fill(0);
    textSize(30);
    text("Time: "+t, 100, 100);
    t--;
    if (t==0) {
      score2 = 0; // 重置分數
      attempts = -1 ; // 重置投籃次數
      State=4;
      t=500;
    }
  }
  if (game2Completed) {
    //顯示通關畫面
    background(200);
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("關卡2通關", width/2, height/2);

    if (mouseX > buttonW+325 && mouseX < 485 &&
      mouseY > buttonR+450 && mouseY < 535) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }
    rect(buttonW+325, buttonR+450, 150, 75);
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("回首頁", 410, 495);

    if (mouseX > buttonW+325 && mouseX < 485 &&
      mouseY > buttonR+550 && mouseY < 620) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }
    rect(buttonW+325, buttonR+550, 150, 75);
    fill(255);
    textSize(30);
    text("下一關", 410, 595);
  } else if (score2 > 2) {
    game2Completed = true;
  }
  if(State==6){
    // 介紹畫面
    background(200);
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("遊戲介紹\n使用滑鼠向下拉投籃\n增加計時器:15秒內進3球\n點擊繼續進入遊戲", 400, 500);

    // 檢查開始遊戲按鈕範圍
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
      fill(0); // 如果滑鼠在按鈕上，改變填充顏色
    } else {
      fill(150); // 如果滑鼠不在按鈕上，填充原始顏色
    }

    // 繪製繼續遊戲按鈕
    rect(buttonX, buttonY, buttonWidth1, buttonHeight1);

    // 顯示繼續遊戲按鈕文字
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("繼續", buttonX + buttonWidth1 / 2, buttonY + buttonHeight1 / 2);
  }
  if (State==7) {
    // 遊戲畫面
    background(255);
    image(imgRack, -200, -400);

    // 停止按鈕的檢查與顯示
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
    text("停止", buttonW + buttonWidth2 / 2, buttonR + buttonHeight2 / 2);
    fill(0);
    rect(315, 120, 70, 10); // 籃框
    if (flying) {
      x += vx; // 反過來說, 沒有 game over 就會動
      y += vy;
      vy += 6;
      // 檢查是否進球
      if (y > 120 && y < 140 && x > 260 && x < 380) {
        if (vy < 0) vy = -vy;
        else if (!shotMade) {
          score3 += 2; // 進球，增加2分
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
    fill(255, 0, 0);
    textSize(30);
    text("得分: " + score3, width / 1.25, 50);
    text("嘗試次數: " + attempts, width / 1.25, 80);
    
    if (attempts > 10 && score3 <= 6) {
      score3 = 0; // 重置分數
      attempts = -1 ; // 重置投籃次數
      State=6;
    }
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
  if (State == 0 && mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
    // 進入介紹畫面
    State = 1;
  } else if (State == 1 && mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
    // 進入遊戲畫面
    State = 2; //introScreen = false;
  }
  if (State == 2 && mouseX > buttonW && mouseX < buttonW + buttonWidth2 && mouseY > buttonR && mouseY < buttonR + buttonHeight2) {
    // 停止遊戲
    State = 0;
    score = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
  if (game1Completed && mouseX > buttonW+325 && mouseX < 485 && mouseY > buttonR+460 && mouseY < 535) {
    // 回首頁
    State = 0;
    game1Completed = false;
    score = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
  if (game1Completed && mouseX > buttonW+325 && mouseX < 485 && mouseY > buttonR+550 && mouseY < 620) {
    //下一關
    State = 4;
    game1Completed = false;
    score = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
  if (State==4 && mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
    State=5;
  }
  if (State == 5 && mouseX > buttonW && mouseX < buttonW + buttonWidth2 && mouseY > buttonR && mouseY < buttonR + buttonHeight2) {
    // 停止遊戲
    State = 4;
    score2 = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
  if (game2Completed && mouseX > buttonW+325 && mouseX < 485 && mouseY > buttonR+460 && mouseY < 535) {
    // 回首頁
    State = 0;
    game2Completed = false;
    score2 = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
  if (game2Completed && mouseX > buttonW+325 && mouseX < 485 && mouseY > buttonR+550 && mouseY < 620) {
    //下一關
    State = 6;
    game2Completed = false;
    score = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
  if (State==6 && mouseX > buttonX && mouseX < buttonX + buttonWidth1 &&mouseY > buttonY && mouseY < buttonY + buttonHeight1) {
    State=7;
  }
  if (State == 7 && mouseX > buttonW && mouseX < buttonW + buttonWidth2 && mouseY > buttonR && mouseY < buttonR + buttonHeight2) {
    // 停止遊戲
    State = 6;
    score3 = 0; // 重置分數
    attempts = -1 ; // 重置投籃次數
  }
}
void mouseReleased() {
  vx = X - mouseX;
  vy = Y - mouseY;
  flying = true; // 飛行
}
