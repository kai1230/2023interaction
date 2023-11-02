void setup(){
  size(400,400);  
}
float marioX=50,marioY=250,vx=0,vy=0;
void draw(){
   background(108,137,255);
   marioX+=vx;
   fill(255,0,0);ellipse(marioX,marioY,10,20);
   fill(229,119,42);rect(0,260,400,150);
}
void keyPressed(){
  if(keyCode==RIGHT)vx=2;
  if(keyCode==LEFT)vx=-2;
}
