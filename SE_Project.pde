import g4p_controls.*;

int t = 0;
float g = 0.03;

Planet selectedPlanet, earth, mars;
Star sun;
StarSystem sunSys;  



void setup() {
  size(500, 500);
  Planet earth = new Planet(100, 30, 300, color(0, 0, 220));
  Planet mars = new Planet(30, 10, 500, color(230, 0, 0));
  Star sun = new Star(500, 500);
  StarSystem sunSys = new StarSystem(sun);
  //createGUI();
  
  sunSys.addPlanet(earth);
  sunSys.addPlanet(mars);
}

void draw() {
  background(0);
  //sunSys.drawSystem();
  
  earth.drawPlanet();
}
