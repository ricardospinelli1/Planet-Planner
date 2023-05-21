//STAR CLASS
class Star {
  //FIELDS
  String starType;  //type of star (red dwarf, yellow dwarf, white dwarf)
  color col;    //colour, determined by starType
  float mass;   //mass
  float radius; //size of star
  PVector pos = new PVector (halfway, halfway);  //star always positioned in the centre of screen
   
  //CONTRSUCTORS
  Star(float m, float r, String t) {
    this.mass = m;
    this.radius = r;
    this.starType = t;
    
    //assign colour based on type
    setStarCol();
  }
  
  //METHODS
  void drawStar() {  //draw the star
    fill(this.col); 
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius);
  } 
  
  void setStarCol() {  //set the colour of the star based on star type 
    if(this.starType.equals("Yellow dwarf"))
      this.col = color(252, 186, 3);  //yellowish colour
      
    else if(this.starType.equals("Red dwarf")) 
      this.col = color(245, 51, 12);  //reddish colour
      
    else if(this.starType.equals("White dwarf")) 
      this.col = color(255);   //white  
  }
}
