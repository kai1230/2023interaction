PImage img,imgBox;
void setup(){
  size(600,600);
  img =loadImage("princess.png");
  imgBox=loadImage("box.png");
}

void draw(){
  imageMode(CENTER);
  if(mousePressed){
    image(imgBox,mouseX,mouseY);
  }else{
  image(img,300,300,200,300);
  }
}
