import g4p_controls.*;

int t = 0;
float g = 0.03;
float halfway;
boolean demo = true;
String chosenStarType;

Planet earth, mars;
Star sun;
StarSystem sys;  
AsteroidBelt astBelt;

void setup() {
  size(900, 900);
  halfway = width/2.0;
  createGUI();
  
  if (demo) {
    earth = new Planet(100, 30, 200, color(0, 0, 220));
    mars = new Planet(30, 10, 300, color(230, 0, 0));
    sun = new Star(500, 120, "yellow dwarf");
    sys = new StarSystem(sun);
    astBelt = new AsteroidBelt(700);
   
    sys.addPlanet(earth);
    sys.addPlanet(mars);
    sys.addAsteroidBelt(astBelt);
  }
  
  
}

void draw() {
  background(0);
  sys.drawSystem();
}
