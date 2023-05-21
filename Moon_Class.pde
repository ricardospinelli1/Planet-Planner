//MOON CLASS
class Moon {
  //FIELDS
  float mass;     //mass of moon
  float orbRad;   //distance from planet
  float radius;   //radius of moon
  float speed;    //assume circular orbit
  PVector pos;    //position
  Planet planet;  //planet orbiting
  int T = 0;      //where in "time" the moon is in its orbit
  
  //CONSTRUCTOR
  Moon(float m, float or, float r) {
    this.mass = m;
    this.orbRad = or;
    this.radius = r;
  }
  
  //METHODS
  void drawMoon() {  //draw moon
    fill(240);
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius*2);
    
    this.updatePosition();   //change position for next frame
  }
  
  void updatePosition() {  //update position
    //orbit in a circle of radius orbRad, centred at position of planet
    this.pos.x = this.orbRad*cos(T*this.speed/this.orbRad/deltaT) + this.planet.pos.x;    
    this.pos.y = this.orbRad*sin(T*this.speed/this.orbRad/deltaT) + this.planet.pos.y;
    T++;  //increment "time"
  }
}
