//STAR SYSTEM CLASS
class StarSystem {
  //FIELDS
  Star star;  //star of the star system
  ArrayList<Planet> planets = new ArrayList<Planet>();  //list of planets in the star system
  ArrayList<AsteroidBelt> belts = new ArrayList<AsteroidBelt>();  //list of asteroid belts in the system
  FloatList beltRads = new FloatList();  //arraylist to contain radii of asteroid belts to draw them in the right order
  ArrayList<Comet> comets = new ArrayList<Comet>();  //list of all comets in the star system
  
  //CONTRUCTOR 
  StarSystem(Star s) {
    this.star = s;
  }
  
  //METHODS
  void addPlanet(Planet p) {  //add planet to the star system
    this.planets.add(p);
    p.starSys = this;  //make the planet's star system this
  }
  
  void removePlanet(Planet p) {  //remove planet from star system (not necessary but pairs with addPlanet())
    this.planets.remove(p);
  }
  
  void addAsteroidBelt(AsteroidBelt a) {  //add asteroid belt to system
    this.belts.add(a);
    a.starSys = this;
  }
  
  void removeAsteroidBelt(AsteroidBelt a) {  //remove asteroid belt from system
    this.belts.remove(a);
  }
  
  void addComet(Comet c) {  //add comet to system
    this.comets.add(c);
    c.starSys = this;
  }
  
  void removeComet(Comet c) {  //remove comet from system
    this.comets.remove(c);
  }
  
  void drawSystem() {  //draw star system
    //algorithm for drawing asteroid belts in order by decreasing size (or else others get covered up by inner black circle)
    for (int i = 0; i < this.belts.size(); i++) {  //for every asteroid belt in the system...
      this.beltRads.append(this.belts.get(i).orbRadius);  //add its radius to the array list of radii
    }
    this.beltRads.sort();  //put in increasing order
    this.beltRads.reverse();  //change to decreasing order
    for (int i = 0; i < this.beltRads.size(); i++) {  //for every asteroid belt...
      AsteroidBelt drawn = new AsteroidBelt(this.beltRads.get(i));  //make new asteroid belt at radii i
      drawn.drawBelt();  //draw belt
    }
    
    drawBackgroundStars();  //draw background stars
    
    this.star.drawStar();  //draw star
    
    for (int i = 0; i < this.planets.size(); i++) {  //for every planet in the system...
      this.planets.get(i).drawPlanet();  //draw planet
    }
    
    for(int i = 0; i < this.comets.size(); i++) {  //for every comet in the system...
      this.comets.get(i).drawComet();  //draw comet
    }
    this.beltRads.clear();  //clear list of asteroid belt radii for next frame in case there are changes
  }

}
