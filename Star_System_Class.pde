class StarSystem {
  //fields
  Star star;
  ArrayList<Planet> planets = new ArrayList<Planet>();
  ArrayList<AsteroidBelt> belts = new ArrayList<AsteroidBelt>();
  
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
  
  void drawSystem() { 
    for (int i = 0; i < this.belts.size(); i++) {
      this.belts.get(i).drawBelt();    
    }
    
    this.star.drawStar();
    
    for (int i = 0; i < this.planets.size(); i++) {
      this.planets.get(i).drawPlanet();
    }
        
    t++;
  }

}
