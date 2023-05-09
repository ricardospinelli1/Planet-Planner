class Planet {
  //fields
  int mass;
  int orbitRad;
  int axialRotPeriod;
  PVector position;
  PVector speed;
  color planetCol;
  
  //constructor
  Planet(int m, int or, int arp, color pc) {
    this.mass = m;
    this.orbitRad = or;
    this.axialRotPeriod = arp;
    this.planetCol = pc;  
  }
  
  //methods
  
  void drawPlanet() {
  
  }
  
  void updatePosition() {
  
  }
}
