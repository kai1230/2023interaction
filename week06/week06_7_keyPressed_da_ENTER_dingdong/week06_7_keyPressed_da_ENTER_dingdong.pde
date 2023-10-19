import processing.sound.*;
SoundFile da,dingdong,ouch;

void setup(){
  size(800,300);
  textSize(64);
  da=new SoundFile(this,"da.mp3");
  dingdong = new SoundFile(this,"dingdong.mp3");
  ouch = new SoundFile(this,"ouch.mp3");
}
String line="";
void draw(){
  text("Input: "+line,50,100);
}
void keyPressed(){
  if(key>='A' && key<='Z'){line +=key;da.play();}
  if(key>='a' && key<='z'){line +=key;da.play();}
  if(key==BACKSPACE && line.length()>0){ 
    line= line.substring(0,line.length()-1);
    ouch.play();
  }
  if(key==ENTER){
    dingdong.play();
  }
}
