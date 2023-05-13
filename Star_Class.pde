class Star {
  //FIELDS
  int mass;
  int radius; //size
  PVector pos = new PVector (halfway, halfway);
  //PVector speed; // possibly needed for Binary Stars
   
  //CONTRSUCTORS
  Star(int m, int r) {
    this.mass = m;
    this.radius = r;

    //this.pos.x = 250;
    //this.pos.y = 250;
  }
  
  //METHODS
  void drawStar() { // temporary variables to fill in for now
    fill(255); 
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius);
  } 
}
