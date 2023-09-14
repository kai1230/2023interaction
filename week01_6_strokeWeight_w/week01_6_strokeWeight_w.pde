void setup(){
  size(500,500);
  background(255);
}

void draw(){
  if(mousePressed) {line(mouseX,mouseY,pmouseX,pmouseY);}
}
int w=1;
void keyPressed(){
  if(key=='1')stroke(255,0,0);
  if(key=='2')stroke(0,255,0);
  if(key=='3')stroke(0,0,255);
  if(key=='s'||key=='S')save("output.png");
  if(key=='+')strokeWeight(++w);
  if(key=='-')strokeWeight(--w);
  println(w);
}
