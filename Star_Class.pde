class Star {
  //FIELDS
  int mass;
  int radius; //size
  String starType;
  color c;
  PVector pos = new PVector (halfway, halfway);
   
  //CONTRSUCTORS
  Star(int m, int r, String st) {
    this.mass = m;
    this.radius = r;
    this.starType = st;
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
