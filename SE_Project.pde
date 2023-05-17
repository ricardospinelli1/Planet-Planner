import g4p_controls.*;

int t = 0;
float g = 0.03;
float halfway;
boolean demo = true;
String chosenStarType;

Planet selectedPlanet;

//newton gravity global variables
float G = -0.8;
float deltaT = 0.1;

Planet mercury, venus, earth, mars, jupiter;
Star sun;
StarSystem sys;  
AsteroidBelt astBelt;
Comet test1;

void setup() {
  size(900, 900);
  halfway = width/2.0;
  createGUI();
  
  if (demo) {
    //earth = new Planet(100, 30, 200, color(0, 0, 220));
    //mars = new Planet(30, 10, 300, color(230, 0, 0));
    //sun = new Star(500, 120, "yellow dwarf");
    //mercury = new Planet(2, 5, 100, color(160));
    //venus = new Planet(9, 19, 170, color(240, 200, 5));
    //earth = new Planet(10, 20, 250, color(0, 0, 220));
    //mars = new Planet(4, 7, 300, new PVector(4, 0), color(230, 0, 0));
    //sun = new Star(10000, 100, "yellow dwarf");

    mercury = new Planet(0.2, 5, 100, new PVector (7, 0), color(160));
    venus = new Planet(0.9, 18, 170, new PVector(7, 0), color(240, 200, 5));
    earth = new Planet(1, 20, 250, new PVector(5.6569, 0), color(0, 0, 220));  //should have circular orbit
    mars = new Planet(0.4, 7, 300, new PVector(5, 0), color(230, 0, 0));
    jupiter = new Planet(50, 50, 400, new PVector(5, 0), color(250, 100, 0));
    sun = new Star(12500, 65, "yellow dwarf");
  
    test1 = new Comet(0.01, 400, new PVector(3, 0));
    
    sys = new StarSystem(sun);
    astBelt = new AsteroidBelt(700);
    
    sys.addPlanet(mercury);
    sys.addPlanet(venus);
    sys.addPlanet(earth);
    sys.addPlanet(mars);
    sys.addPlanet(jupiter);
    sys.addAsteroidBelt(astBelt);
    sys.addComet(test1);
  }
}

void draw() {
  background(0);
  sys.drawSystem();
}
