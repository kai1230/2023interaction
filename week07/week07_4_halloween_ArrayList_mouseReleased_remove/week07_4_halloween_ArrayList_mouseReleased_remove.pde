ArrayList<PVector>pt=new ArrayList<PVector>();
void setup(){
  size(400,400);
  background(255);
}
float ghostX=400,ghostY=20;
void mouseDragged(){
  pt.add(new PVector(mouseX,mouseY));
}
void draw(){
  ellipse(200,200,15,15);
  background(255);
  //if(mousePressed)line(mouseX,mouseY,pmouseX,pmouseY);
  for(int i=0;i<pt.size()-1;i++){
    PVector p=pt.get(i),p2=pt.get(i+1);
    line(p.x,p.y,p2.x,p2.y);
  }
  ellipse(ghostX,ghostY,15,15);
  float dx=200-ghostX,dy=200-ghostY,len=sqrt(dx*dx+dy*dy);
  ghostX+=dx/len/3;
  ghostY+=dy/len/3;
}
void mouseReleased(){
  for(int i=pt.size()-1;i>=0;i--){
    pt.remove(i);
  }
}
