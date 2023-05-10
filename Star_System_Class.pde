class StarSystem {
  //fields
  ArrayList<Planet> planets = new ArrayList<Planet>();
  ArrayList<AsteroidBelt> belts = new ArrayList<AsteroidBelt>();
  
  //constructor
  
  //methods
  void addPlanet(Planet p) {
    this.planets.add(p);
    p.starSys = this;
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
    
    for (int i = 0; i < this.planets.size(); i++) {
      this.planets.get(i).drawPlanet();
    }
        
    t++;
  }

}
