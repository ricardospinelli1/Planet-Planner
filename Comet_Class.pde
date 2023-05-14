class Comet {
  //FIELDS
  int mass; 
  int orbitRadius;
  PVector pos;
  PVector velocity;
  float speed;
  
  //CONTRSUCTORS
  Comet(int m, int r) {
    this.mass = m;
    this.orbitRadius = r;
    this.pos = new PVector(100, 100); //temporary position
  }
  
  //METHODS
  void drawComet() {
    fill(255);
    noStroke();
    circle(this.pos.x, this.pos.y, 50);
    
    updatePosition();
  }
  
  void updatePosition() {
    
  }
}
