import g4p_controls.*;

int t = 0;
float g = 0.03;
float halfway;
boolean demo = true;
Planet selectedPlanet;

//newton gravity global variables
float G = -0.8;
float deltaT = 0.1;

Planet mercury, venus, earth, mars, jupiter;
Star sun;
StarSystem sys;  
AsteroidBelt astBelt;

void setup() {
  size(900, 900);
  halfway = width/2.0;
  //createGUI();
  
  if (demo) {
    mercury = new Planet(0.2, 5, 100, new PVector (7, 0), color(160));
    venus = new Planet(0.9, 18, 170, new PVector(7, 0), color(240, 200, 5));
    earth = new Planet(1, 20, 250, new PVector(5.6569, 0), color(0, 0, 220));  //should have circular orbit
    mars = new Planet(0.4, 7, 300, new PVector(5, 0), color(230, 0, 0));
    jupiter = new Planet(50, 50, 400, new PVector(5, 0), color(250, 100, 0));
    sun = new Star(10000, 65);
    sys = new StarSystem(sun);
    astBelt = new AsteroidBelt(700);
    
    
    
    sys.addPlanet(mercury);
    sys.addPlanet(venus);
    sys.addPlanet(earth);
    sys.addPlanet(mars);
    sys.addPlanet(jupiter);
    sys.addAsteroidBelt(astBelt);
  }   
}

void draw() {
  background(0);
  sys.drawSystem();
}
