PImage img;
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
  
}
void mousePressed(){
  println(mouseX,mouseY);//定位、印出mouse座標
}
