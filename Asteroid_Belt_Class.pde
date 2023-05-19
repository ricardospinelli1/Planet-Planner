class AsteroidBelt {
  //fields
  float orbRadius;
  String name;
  StarSystem starSys;
  
  //constructor
  AsteroidBelt(float or) {
    this.orbRadius = or;
  }
  
  //methods  
  void drawBelt() {
    fill(40);
    circle(halfway, halfway, orbRadius + 5);
    fill(0);
    circle(halfway, halfway, orbRadius - 5);  
  }
}
