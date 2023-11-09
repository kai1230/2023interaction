PImage img;
int [][] pos={{83,455},{115,457},{153,456},{183,457},{217,456},{255,459},{283,456},{323,456},{356,457},{389,455},{95,492},{128,489},{160,491},{195,489},{229,491},{263,491},{297,491},{328,491},{370,490},{105,527},{145,523},{174,522},{209,527},{245,523},{279,525},{313,523}};
void setup(){
  size(800,600);
  img=loadImage("keyboard.png");
  rectMode(CENTER);//用中心點畫四邊形
}
void draw(){
  background(#FFFFF2);
  image(img,0,600-266);
  fill(255,0,0,128);
  rect(mouseX,mouseY,28,30,5);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    rect(pos[i][0],pos[i][1],28,30,5);
  }
}
void mousePressed(){
  println(mouseX,mouseY);//定位、印出mouse座標
}
