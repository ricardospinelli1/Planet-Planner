class Planet {
  //fields
  int mass;
  int size;
  int orbitRad;
  //float eccentricity;
  float posX = 0;
  float posY = 0;
  float speed = 1;
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
    circle(this.posX, this.posY, this.size);
    
    this.updatePosition();
  }
  
  void updatePosition() {
    this.posX = orbitRad*cos(t*0.1/this.speed) + 250;
    this.posY = orbitRad*sin(t*0.1/this.speed) - 250;
  }
}
