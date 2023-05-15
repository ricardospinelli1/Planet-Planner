class Planet {
  //fields
  float mass;
  int size;
  int orbitRad;
  PVector pos = new PVector (0, 0);
  float speed = 0.1;
  color planetCol;
  StarSystem starSys;
   
  //extra fields for newton gravity
  PVector acc;
  PVector velocity;
  boolean circularOrb;
  
  //constructor
  Planet(float m, int s, int or, color pc) {
    this.mass = m;
    this.size = s;
    this.orbitRad = or;
    this.planetCol = pc; 
    this.circularOrb = true;
  }
  
  Planet(float m, int s, int or, PVector v, color pc) {
    this.mass = m;    
    this.size = s;  
    this.orbitRad = or;
    this.velocity = v;    
    this.planetCol = pc; 
    this.pos = new PVector(halfway, halfway - this.orbitRad);
    this.circularOrb = false;
  }
  
  //methods  
  void drawPlanet() {
    noStroke();
    fill(this.planetCol);
    circle(this.pos.x, this.pos.y, this.size);
    
    if (this.circularOrb)
      this.circularPosition();
    else
      this.newtonPosition();
    
  }
  
  void circularPosition() {  //determine position assuming circular orbit
    this.pos.x = orbitRad*cos(t*5*this.speed/this.orbitRad) + halfway;
    this.pos.y = orbitRad*sin(t*5*this.speed/this.orbitRad) + halfway;    
  } 
  
  void newtonPosition() {  //determine position using newton's gravity
    PVector r = PVector.sub(this.pos, this.starSys.centralBody.get(0).pos);
    PVector forceDir = r.normalize(null);
    float rSquared = r.magSq();
    float forceMag = G*this.mass*this.starSys.starMass/rSquared;
    PVector force = PVector.mult(forceDir, forceMag);
    this.acc = PVector.div(force, this.mass);
    
    PVector deltaV = PVector.mult(this.acc, deltaT);
    this.velocity.add(deltaV);
    
    PVector deltaPos = PVector.mult(this.velocity, deltaT);
    this.pos.add(deltaPos);
  }
}
