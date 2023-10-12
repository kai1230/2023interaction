ArrayList<PVector>pt;
void setup(){
  size(400,400,P3D);
  pt = new ArrayList<PVector>();
  for(int i=0;i<37;i++){
    pt.add(new PVector(random(400),random(400)));
  }
}
void draw(){
  background(255);
  for(PVector p : pt){//畫出全部的頂點
    ellipse(p.x,p.y,10,10);
  }
  if(ans!=null)ellipse(ans.x,ans.y,15,15);
}
PVector ans= null;
void mouseDragged(){
  if(mouseButton==CENTER && ans!=null){
    ans.x=mouseX;
    ans.y=mouseY;
  }
}
void mousePressed(){
  if(mouseButton==LEFT)pt.add(new PVector(mouseX,mouseY));
  else if(mouseButton==CENTER){
    for(PVector p : pt){
      if(dist(p.x,p.y,mouseX,mouseY)<5){
        ans=p;
      }
    }
  }
}
