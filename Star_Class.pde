class Star {
  //FIELDS
  String starType;
  color c;
  float mass;
  float radius; //size

  PVector pos = new PVector (halfway, halfway);
   
  //CONTRSUCTORS
  Star(float m, float r) {
    this.mass = m;
    this.radius = r;
  }
  
  //METHODS
  void drawStar() { // temporary variables to fill in for now
    fill(starTypeSetting()); 
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius);
  } 
  
  color starTypeSetting() {  // user selected star type will determine color of star
    if(this.starType.equals("yellow dwarf"))
      c = color(252, 186, 3);
      
    else if(this.starType.equals("red dwarf")) 
      c = color(245, 51, 12);
      
    else if(this.starType.equals("white dwarf")) 
      c = color(255, 255, 255);     
      
     return c;
  }
}
