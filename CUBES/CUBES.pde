PImage diamond, dirt, Grass_Side, Grass_Top;
float spinX, spinY;
void setup() {
  size(800, 800, P3D);
  diamond = loadImage("diamond.png");
  dirt    = loadImage("dirt.png");
  Grass_Side = loadImage("Grass_Side.png");
  Grass_Top  = loadImage("Grass_Top.png");
  textureMode(NORMAL);
}

void draw() {
  background(#0088ff);

  texturedCube(width/2, height/2, 0, diamond, 100);
  texturedCube(width*.3, height/2, 0, dirt, 100);
  texturedCube(width*.7, height/2, 0, Grass_Top, Grass_Side, dirt, 100);
}

void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(spinX);
  rotateY(spinY);

  noStroke();

  beginShape(QUADS);
  texture(texture);

  //top
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bot
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();
}


void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bot, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(spinX);
  rotateY(spinY);

  noStroke();

  beginShape(QUADS);
  texture(top);

  //top
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bot);
  //bot
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(side);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();
}


void mouseDragged() {
  spinX = spinX + (pmouseY - mouseY)*0.01;
  spinY = spinY + (pmouseX - mouseX)*-0.01;
}
