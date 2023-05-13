class Planet {
  //fields
  int mass;
  int size;
  int orbitRad;
  //float eccentricity;
  PVector pos = new PVector (0, 0);
  PVector direction = new PVector(0, 0);
  float speed = 0.1;
  color planetCol;
  StarSystem starSys;
  
  //constructor
  Planet(int m, int s, int or, color pc) {
    this.mass = m;
    this.size = s;
    this.orbitRad = or;
    this.planetCol = pc;
 
    //this.eccentricity = sqrt(1 + 
    //float period = 2*PI*sqrt(pow(this.orbitRad, 3)/g/this.starSys.star.mass);
    
  }
  
  //methods
  
  void drawPlanet() {
    noStroke();
    fill(this.planetCol);
    circle(this.pos.x, this.pos.y, this.size);
    
    this.updatePosition();
  }
  
  void updatePosition() {
    this.pos.x = orbitRad*cos(t*5*this.speed/this.orbitRad) + halfway;
    this.pos.y = orbitRad*sin(t*5*this.speed/this.orbitRad) + halfway;    
  } 
}
