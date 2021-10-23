class Bacteria {
  int myY; 
  int myX;
  int speed;
  int myW = 52;
  int myH = 65;
  int r = (int)(Math.random()*256);
  int g = (int)(Math.random()*256);
  int b = (int)(Math.random()*256);
  Bacteria()
  {
    myX = (int)(Math.random()*600);
    myY = 600;
    speed = (int)(Math.random()*3)*1;
  }
  void walk()
  {
    if (speed == 2) {
      myY = myY + (int)(Math.random()*4)-8;
    }
    if (speed == 1) { 
      myY = myY + (int)(Math.random()*4)-6;
    }
    if (speed == 0) {
      myY = myY + (int)(Math.random()*4)-4;
    }
    if (myY < -200) {
      myY = 600;
    }
    myX = myX + (int)(Math.random()*3)-1;
  }
  void pop() { 
    fill(0);
    textSize(24);
    if (dist(myX, myY, mouseX, mouseY) <= myW/2) {
      myW = 0;
      myH = 0;
    }
  }
  void show()
  {
    if (myH == 65) {
      strokeWeight(2);
      noFill();
      stroke(0);
      beginShape(); 
      curveVertex(myX, myY + 20);
      curveVertex(myX, myY + 20);
      curveVertex(myX - 10, myY + 30);
      curveVertex(myX, myY + 40);
      curveVertex(myX - 10, myY + 50);
      curveVertex(myX, myY + 60);
      curveVertex(myX, myY + 60);
      endShape();
      strokeWeight(0);
      fill(r, g, b);
      ellipse(myX, myY, myW, myH);
    }
  }
}


Bacteria bob;
Bacteria [] balloon = new Bacteria[50];
void setup() {
  size (600, 600);
  noStroke();
  frameRate(30);
  bob = new Bacteria();
  int i = 0;
  while (i < balloon.length) {
    balloon[i] = new Bacteria();
    i++;
  }
}

void draw() { 
  background(192, 192, 192);
  for (int i = 0; i < balloon.length; i++) {
    balloon[i].walk();
    balloon[i].pop();
    balloon[i].show();
  }
}
