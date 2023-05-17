class Star {
  //FIELDS
  String starType = "White dwarf";
  color col = color(255);
  float mass;
  float radius; //size

  PVector pos = new PVector (halfway, halfway);
   
  //CONTRSUCTORS
  Star(float m, float r, String t) {
    this.mass = m;
    this.radius = r;
    this.starType = t;
    
    if(this.starType.equals("Yellow dwarf"))      
      this.col = color(252, 186, 3);
    else if(this.starType.equals("White dwarf"))       
      this.col = color(255, 255, 255); 
    else if (this.starType.equals("Red dwarf"))       
      this.col = color(245, 51, 12);
    
  }
  
  //METHODS
  void drawStar() { // temporary variables to fill in for now
    fill(this.col); 
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius);
  } 
  
  void setStarCol() {  // user selected star type will determine color of star
    if(this.starType.equals("Yellow dwarf"))
      this.col = color(252, 186, 3);
      
    else if(this.starType.equals("Red dwarf")) 
      this.col = color(245, 51, 12);
      
    else if(this.starType.equals("White dwarf")) 
      this.col = color(255, 255, 255);     
  }
}
