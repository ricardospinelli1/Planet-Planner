class Moon {
  //fields
  float mass;
  float orbRad;
  float radius;
  float speed; //assume circular orbit
  PVector pos;
  Planet planet;
  
  //constructor
  Moon(float m, float or, float r) {
    this.mass = m;
    this.orbRad = or;
    this.radius = r;
  }
  //methods
  
  void drawMoon() {
    fill(240);
    noStroke();
    circle(this.pos.x, this.pos.y, this.radius*2);
    
    this.updatePosition();
  }
  
  void updatePosition() {
    this.pos.x = orbRad*cos(t*this.speed/this.orbRad) + this.planet.pos.x;    
    this.pos.y = orbRad*sin(t*this.speed/this.orbRad) + this.planet.pos.y;   
  }
}
