class AsteroidBelt {
  //fields
  int orbitalRadius;
  StarSystem starSys;
  
  //constructor
  AsteroidBelt(int or) {
    this.orbitalRadius = or;
  }
  
  //methods  
  void drawBelt() {
    fill(40);
    circle(halfway, halfway, orbitalRadius + 5);
    fill(0);
    circle(halfway, halfway, orbitalRadius - 5);  
  }
}
