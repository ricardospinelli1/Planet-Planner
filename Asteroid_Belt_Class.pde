//ASTEROID BELT CLASS
class AsteroidBelt {
  //FIELDS
  float orbRadius;  //distance from one end of belt to the other
  String name;      //name of belt
  StarSystem starSys;  //which star system it belongs to
  
  //CONSTRUCTOR
  AsteroidBelt(float or) {  //regular constructor
    this.orbRadius = or;
  }
  
  AsteroidBelt() {  //"void" belt for when none selected by user to edit
    this.name = "None";
    this.orbRadius = 2000;
  }
  
  //METHODS 
  void drawBelt() {
    fill(40);
    circle(halfway, halfway, orbRadius + 5);  //draw belt
    fill(0);
    circle(halfway, halfway, orbRadius - 5);  // make the middle of circle "hollow" to make ring effect 
  }
}
