import g4p_controls.*;
int t = 0;
float g = 0.03;
float halfway;
String chosenStarType;
ArrayList<String> allPlanetList = new ArrayList<String>();

//newton gravity global variables
float G = -0.8;
float deltaT = 0.1;

StarSystem sys;
Star defaultStar;
Planet defaultPlanet;
Planet selectedPlanet;
AsteroidBelt selectedBelt;


Planet mercury, venus, earth, mars, jupiter;
Star sun; 
AsteroidBelt astBelt;
Comet test1;

void setup() {
  size(900, 900);
  halfway = width/2.0;
  createGUI();

  defaultStar = new Star(10000, 65, "White dwarf");
  defaultPlanet = new Planet("Default Name", 1, 20, 250, new PVector(5.6569, 0), color(0, 0, 220));
  sys = new StarSystem(defaultStar);
}

void draw() {
  background(0);
  sys.drawSystem();
}

void setDemo() {
  mercury = new Planet("Mercury", 0.2, 5, 100, new PVector (7, 0), color(160));    
  venus = new Planet("Venus", 0.9, 18, 170, new PVector(7, 0), color(240, 200, 5));    
  earth = new Planet("Earth", 1, 20, 250, new PVector(5.6569, 0), color(0, 0, 220));  //should have circular orbit    
  mars = new Planet("Mars", 0.4, 7, 300, new PVector(5, 0), color(230, 0, 0));    
  jupiter = new Planet("Jupiter", 50, 50, 400, new PVector(5, 0), color(250, 100, 0));    
  sun = new Star(10000, 65, "Yellow dwarf");    
  astBelt = new AsteroidBelt(700);
  astBelt.name = "Asteroid Belt #1";
  sys.addPlanet(mercury);    
  sys.addPlanet(venus);    
  sys.addPlanet(earth);    
  sys.addPlanet(mars);    
  sys.addPlanet(jupiter);    
  sys.addAsteroidBelt(astBelt);
  sys.star = sun;
}
