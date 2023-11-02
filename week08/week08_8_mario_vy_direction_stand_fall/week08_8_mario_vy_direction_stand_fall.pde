void setup(){
  size(400,400);  
}
float marioX=50,marioY=250,vx=0,vy=0;
void draw(){
   background(108,137,255);
   marioX+=vx;
   if(flying){
     marioY+=vy;
     vy+=0.98;
     if(marioY>=250){
       marioY=250;//站在地板上
       flying=false;//不再飛行
     }
   }
   
   fill(255,0,0);ellipse(marioX,marioY,10,20);
   fill(229,119,42);rect(0,260,400,150);
   fill(229,119,42);rect(200,150,20,20);
   if(hitBox(200,150,20,20)){
     if(vy>0){
       marioY=150-10;
       flying=false;
     }else{
       vy=0;
       marioY=150+20+10;
     }
   }
}
boolean hitBox(int x,int y,int w,int h){
  if(x-7<marioX && marioX<x+w+7 && y-10<marioY && marioY<y+h+10)return true;
  else return false;
}
boolean flying=false;
void keyPressed(){
  if(keyCode==RIGHT)vx=2;
  if(keyCode==LEFT)vx=-2;
  if(keyCode==UP && flying==false){//如果沒有在飛的話,才能飛
    vy=-20;
    flying=true;//開始飛行
  }
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT)vx=0;
}
