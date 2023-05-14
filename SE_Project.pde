import g4p_controls.*;

int t = 0;
float g = 0.03;
float halfway;
boolean demo = true;

//newton gravity global variables
float G = -0.8;
float deltaT = 0.1;

Planet mercury, venus, earth, mars;
Star sun;
StarSystem sys;  
AsteroidBelt astBelt;

void setup() {
  size(900, 900);
  halfway = width/2.0;
  //createGUI();
  
  if (demo) {
    //mercury = new Planet(2, 5, 100, color(160));
    //venus = new Planet(9, 19, 170, color(240, 200, 5));
    //earth = new Planet(10, 20, 250, color(0, 0, 220));
    mars = new Planet(4, 7, 300, new PVector(4, 0), color(230, 0, 0));
    sun = new Star(10000, 100);
    sys = new StarSystem(sun);
    astBelt = new AsteroidBelt(700);
    
    earth = new Planet(1, 20, 200, new PVector(5, 0), color(0, 0, 220));
    
    //sys.addPlanet(mercury);
    //sys.addPlanet(venus);
    sys.addPlanet(earth);
    sys.addPlanet(mars);
    sys.addAsteroidBelt(astBelt);
  }   
}

void draw() {
  background(0);
  sys.drawSystem();
}
