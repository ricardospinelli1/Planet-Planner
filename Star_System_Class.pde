class StarSystem {
  //fields
  ArrayList<Star> centralBody = new ArrayList<Star>();
  ArrayList<Planet> planets = new ArrayList<Planet>();
  ArrayList<AsteroidBelt> belts = new ArrayList<AsteroidBelt>();
  int starMass = 0;
  
  //constructor
  StarSystem(Star s1, Star s2) {
    this.starMass = s1.mass + s2.mass;   
    this.centralBody.add(s1);
    this.centralBody.add(s2);
  }
  
  StarSystem(Star s) {
    this.starMass = s.mass;
    this.centralBody.add(s);
  }
  
  //methods
  //void addStar(Star s) {
  //  this.centralBody.add(s);
  //}
  
  void addPlanet(Planet p) {
    this.planets.add(p);
    p.starSys = this;
    p.speed = sqrt(g*this.starMass/p.orbitRad);
  }
  
  void removePlanet(Planet p) {
    this.planets.remove(p);
  }
  
  void addAsteroidBelt(AsteroidBelt a) {
    this.belts.add(a);
    a.starSys = this;
  }
  
  void removeAsteroidBelt(AsteroidBelt a) {
    this.belts.remove(a);
  }
  
  void drawSystem() { 
    //for (int i = 0; i < this.belts.size(); i++) {
    //  this.belts.get(i).drawBelt();    
    //}
    
    for (int i = 0; i < this.centralBody.size(); i++) {
      this.centralBody.get(i).drawStar();
    }
    
    for (int i = 0; i < this.planets.size(); i++) {
      this.planets.get(i).drawPlanet();
    }
        
    t++;
  }

}
