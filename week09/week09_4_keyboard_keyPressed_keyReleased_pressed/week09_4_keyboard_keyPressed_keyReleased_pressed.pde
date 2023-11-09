PImage img;
int [][] pos={{88,491},{246,526},{178,526},{159,491},{152,456},{196,489},{228,488},{262,490},{320,457},{297,489},{331,487},{364,488},{311,523},{280,526},{353,456},{392,458},{83,457},{187,456},{126,490},{220,458},{288,456},{211,525},{116,455},{141,524},{254,459},{111,522}};
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
    if(pressed[i])rect(pos[i][0],pos[i][1],28,30,5);
  }
}
boolean[]pressed=new boolean[26];
void keyPressed(){
  if(key>='a'&&key<='z')pressed[key-'a']=true;
}
void keyReleased(){
  if(key>='a'&&key<='z')pressed[key-'a']=false;
}
