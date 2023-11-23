int state=0;
void setup(){
  size(400,400);
  textSize(50);
}
void draw(){
  if(state==0){
    background(255);
    fill(0);text("Please Click to Start",80,200);
  }else if(state==1){
    
    background(255,0,0);
  }else if(state==2){
    
    background(0,0,255);
  }
}
void mousePressed(){
  if(state==0)state=1;
}
