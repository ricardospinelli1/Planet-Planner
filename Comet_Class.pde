class Comet {
  //FIELDS
  float mass; 
  float orbitRad;
  float speed = 0.1;
  PVector pos = new PVector(0, 0);
  PVector trailPos = new PVector(0, 0);;
  PVector velocity;
  PVector acc;
  PVector trailDeltaPos;
  StarSystem starSys;
  
  //CONTRSUCTORS
  Comet(float m, float or, PVector v) {
    this.mass = m;
    this.orbitRad = or;
    this.velocity = v;
    this.pos = new PVector(halfway, halfway - this.orbitRad);
  }
  
  //METHODS
  void drawComet() {
    noStroke();
    fill(255);
    circle(this.pos.x, this.pos.y, 2.5);
    
    updatePosition();
  }
  
  void updatePosition() {
    PVector r = PVector.sub(this.pos, this.starSys.centralBody.get(0).pos);
    PVector forceDir = r.normalize(null);
    float rSquared = r.magSq();
    float forceMag = G*this.mass*this.starSys.starMass/rSquared;
    PVector force = PVector.mult(forceDir, forceMag);
    this.acc = PVector.div(force, this.mass);
    
    PVector deltaV = PVector.mult(this.acc, deltaT);
    this.velocity.add(deltaV);
    
    PVector deltaPos = PVector.mult(this.velocity, deltaT); 
    trailPos = this.pos;
    this.pos.add(deltaPos);  
    
  }
}
