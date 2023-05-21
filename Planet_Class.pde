//PLANET CLASS
class Planet {
  //FIELDS
  String name;    //name
  float mass;     //mass
  float size;     //diameter
  float orbitRad; //initial distance from star
  PVector pos;    //position  
  PVector velocity; //velocity
  PVector acc;      //acceleration
  color planetCol; //colour of planet
  StarSystem starSys;  //star system it belongs to
  ArrayList<Moon> moons = new ArrayList<Moon>();  //list of moons belonging to this planet

  
  //CONSTRUCTORS
  Planet(String n, float m, int s, float or, PVector v, color pc) {
    this.name = n;
    this.mass = m;    
    this.size = s;  
    this.orbitRad = or;
    this.velocity = v;    
    this.planetCol = pc; 
    this.pos = new PVector(halfway, halfway - this.orbitRad);
  }
  
  Planet() {  //second constructor for when no planet is selected
    this.name = "None";
    this.mass = 0;
    this.size = 0;
    this.orbitRad = 1000;
    this.velocity = new PVector(0, 0);
    this.planetCol = color(0);
    this.pos = new PVector(2000, 2000);
  }
  
  //METHODS 
  //draw the planet
  void drawPlanet() {
    noStroke();
    fill(this.planetCol);
    circle(this.pos.x, this.pos.y, this.size);
    
    //draw moons
    for (int i = 0; i < this.moons.size(); i++) {
      this.moons.get(i).drawMoon();
    } 
    
    this.updatePosition();    //then update position
  }
  
  void updatePosition() {  //determine position using newton gravity
    PVector r = PVector.sub(this.pos, this.starSys.star.pos);  //distance between star and planet
    PVector forceDir = r.normalize(null);  //convert to unit vector
    float rSquared = r.magSq();  //square radius magnitude
    float forceMag = G*this.mass*this.starSys.star.mass/rSquared;  //Fg = GMm/r^2
    PVector force = PVector.mult(forceDir, forceMag);  //compute force
    this.acc = PVector.div(force, this.mass);  //a = F/m
    
    PVector deltaV = PVector.mult(this.acc, deltaT);  //change in velocity over period of time deltaT
    this.velocity.add(deltaV);  //add change in velocity to current velocity    
    PVector deltaPos = PVector.mult(this.velocity, deltaT);  //change in position over period of time deltaT
    this.pos.add(deltaPos);  //add change in position to current position
  }
  
  //add a moon to this planet
  void addMoon(Moon m) {
    this.moons.add(m);
    m.planet = this;  //moon's planet is now this planet
    m.speed = sqrt(g*this.mass/m.orbRad);  //for circular orbit, v = sqrt(GM/r)
    m.pos = new PVector(this.pos.x + m.orbRad, this.pos.y);  //starting position of moon directly to the right of planet
  }
  
  //remove moon (method not necessary, but nice for consistency with addMoon())
  void removeMoon(Moon m) {
    this.moons.remove(m);
  }
}
