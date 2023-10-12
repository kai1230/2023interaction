void setup(){
  size(400,400,P3D);//3D功能
}
void draw(){
  background(#FFFFF2);
  pushMatrix();
    translate(mouseX,mouseY);
    rotateY(radians(mouseX));//對Y軸轉
    fill(0,255,0);
    box(100);//3D的方塊
    
    noFill();
    scale(2);
    box(100);
  popMatrix();
}
