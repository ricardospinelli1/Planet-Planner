class Star {
  //FIELDS
  int mass;
  int radius; //size
  PVector pos = new PVector (width/2, height/2);
  //PVector speed; // possibly needed for Binary Stars
   
  //CONTRSUCTORS
  Star(int m, int r) {
    this.mass = m;
    this.radius = r;
  }
  
  //METHODS
  void drawStar() { // temporary variables to fill in for now
    fill(255); 
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius);
  } 
  
  void determineStarType() {
  
  }
}
