class Planet {
  //fields
  int mass;
  int size;
  int orbitRad;
  int axialRotPeriod;
  float eccentricity;
  PVector position;
  PVector speed;
  color planetCol;
  StarSystem starSys;
  
  //constructor
  Planet(int m, int s, int or, int arp, color pc) {
    this.mass = m;
    this.size = s;
    this.orbitRad = or;
    this.axialRotPeriod = arp;
    this.planetCol = pc;
    this.speed = sqrt(g*this.starSys.star.mass/orbitRad);
    //float reducedMass = 1/(1/this.mass + 1/this.starSys.star.mass);
    //this.eccentricity = sqrt(1 + 
    float period = 2*PI*sqrt(pow(this.orbitRad, 3)/g/this.starSys.star.mass);
    
  }
  
  //methods
  
  void drawPlanet() {
    noStroke();
    fill(this.planetCol);
    circle(this.position.x, this.position.y, this.size);
    
    this.updatePosition();
  }
  
  void updatePosition() {
    //ellipse stuff
  }
}
