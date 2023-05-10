class Planet {
  //fields
  int mass;
  int size;
  int orbitRad;
  //float eccentricity;
  PVector position;
  PVector speed;
  color planetCol;
  StarSystem starSys = null;
  
  //constructor
  Planet(int m, int s, int or, color pc) {
    this.mass = m;
    this.size = s;
    this.orbitRad = or;
    this.planetCol = pc;
    this.speed = sqrt(g*this.starSys.star.mass/orbitRad);
    //float reducedMass = 1/(1/this.mass + 1/this.starSys.star.mass);
    //this.eccentricity = sqrt(1 + 
    //float period = 2*PI*sqrt(pow(this.orbitRad, 3)/g/this.starSys.star.mass);
    
  }
  
  //methods
  
  void drawPlanet() {
    noStroke();
    fill(this.planetCol);
    circle(this.position.x, this.position.y, this.size);
    
    this.updatePosition();
  }
  
  void updatePosition() {
    this.position.x = orbitRad*cos(t);
    this.position.y = orbitRad*sin(t);
  }
}
