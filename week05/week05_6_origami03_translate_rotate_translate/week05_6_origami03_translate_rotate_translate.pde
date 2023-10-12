ArrayList<PVector>pt;//大的資料結構ArrayList

void setup(){
  size(400,400,P3D);
  pt=new ArrayList<PVector>();
}///初始化
void draw(){
  background(#FFFFF2);
  pushMatrix();
    if(mousePressed && mouseButton==RIGHT){
      translate(200,200);
      rotateY(radians(frameCount));
      translate(-200,-200);
    }
    for(PVector p : pt){
       ellipse(p.x,p.y,10,10);
    }
    beginShape();
    for(PVector p : pt){
      vertex(p.x,p.y);
    }
    endShape(CLOSE);
  popMatrix();
}
void mousePressed(){
  if(mouseButton==LEFT){
    pt.add(new PVector(mouseX,mouseY));
  }
}//加入小的資料結構PVector
