//COMET CLASS
class Comet {
  //FIELDS
  float mass;  //mass of comet
  float orbitRad;  //initial distance from star
  PVector pos;  //current position
  PVector lastPos;  //position in last frame
  PVector velocity;  //velocity
  PVector acc;       //acceleration
  StarSystem starSys;  //star system this comet belongs to
  
  //CONSTRUCTORS
  Comet(float m, float or, PVector v) {
    this.mass = m;
    this.orbitRad = or;
    this.velocity = v;
    this.pos = new PVector(halfway, halfway - this.orbitRad);  //initial position directly above star
    this.lastPos = new PVector(halfway - 20, halfway - this.orbitRad);  //"last" position 20 pixels behind initial position
  }
  
  //METHODS
  void drawComet() {  //draw comet
    //tail
    strokeWeight(3);
    stroke(220, 255, 210);
    line(this.pos.x, this.pos.y, this.pos.x + this.lastPos.x, this.pos.y + this.lastPos.y);  //draw tail
    
    //comet
    noStroke();    
    fill(100, 100, 220);    
    circle(this.pos.x, this.pos.y, 5);  //draw actual comet
    
    this.updatePosition();  //update position
  }
  
  void updatePosition() {  //using newton gravity
    //set previous position to current position
    this.lastPos.x = this.pos.x;  
    this.lastPos.y = this.pos.y;
    
    PVector r = PVector.sub(this.pos, this.starSys.star.pos);  //distance between comet and star
    PVector forceDir = r.normalize(null);  //transform to unit vector
    float rSquared = r.magSq();  //square magnitude of r
    float forceMag = G*this.mass*this.starSys.star.mass/rSquared;  //Fg = GMm/r^2
    PVector force = PVector.mult(forceDir, forceMag);              //compute force
    this.acc = PVector.div(force, this.mass);                      //a = F/m
    
    PVector deltaV = PVector.mult(this.acc, deltaT);  //change in velocity over period of time deltaT
    this.velocity.add(deltaV);  //add change in velocity to current velocity   
    PVector deltaPos = PVector.mult(this.velocity, deltaT);  //change in position over period of time deltaT
    this.pos.add(deltaPos);  //add change in position to current position
    
    this.lastPos.sub(this.pos).normalize().mult(20);  //vector that represents difference in position between current and last frame; convert to unit vector
                                                      //then multiply by scalar 20 to make comet tail 20 pixels long, in the direction of travel of comet
    
  }
}
