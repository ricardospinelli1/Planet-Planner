class StarSystem {
  //fields
  Star star;
  ArrayList<Planet> planets = new ArrayList<Planet>();
  ArrayList<AsteroidBelt> belts = new ArrayList<AsteroidBelt>();
  FloatList beltRads = new FloatList();
  ArrayList<Comet> comets = new ArrayList<Comet>();
  
  int starMass = 0;
  
  //constructor
  
  StarSystem(Star s) {
    this.star = s;
  }
  
  //methods  
  void addPlanet(Planet p) {
    this.planets.add(p);
    p.starSys = this;
    p.speed = sqrt(g*this.star.mass/p.orbitRad);
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
  
  void addComet(Comet c) {
    this.comets.add(c);
    c.starSys = this;
    c.speed = sqrt(g*this.starMass/c.orbitRad);
  }
  
  void removeComet(Comet c) {
    this.comets.remove(c);
  }
  
  void drawSystem() { 
    for (int i = 0; i < this.belts.size(); i++) {
      this.beltRads.append(this.belts.get(i).orbRadius);
    }
    this.beltRads.sort();
    this.beltRads.reverse();
    for (int i = 0; i < this.beltRads.size(); i++) {
      AsteroidBelt drawn = new AsteroidBelt(this.beltRads.get(i));
      drawn.drawBelt();  
    }
    
    this.star.drawStar();
    
    for (int i = 0; i < this.planets.size(); i++) {
      this.planets.get(i).drawPlanet();
    }
    
    for(int i = 0; i < this.comets.size(); i++) {
      this.comets.get(i).drawComet();
    }
        
    t++;
    this.beltRads.clear();
  }

}
