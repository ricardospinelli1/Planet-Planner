import g4p_controls.*;

int t = 0;
float g = 9.8;
StarSystem currentSystem;
Planet selectedPlanet;
Star sun = new Star(500, 500);
StarSystem sunSys = new StarSystem(sun);  
Planet earth = new Planet(100, 30, 300, color(0, 0, 220));
Planet mars = new Planet(30, 10, 500, color(230, 0, 0));


void setup() {
  size(500,500); //temporary
  createGUI();  
  sunSys.addPlanet(earth);
  sunSys.addPlanet(mars);
}

void draw() {
  background(0);
  sunSys.drawSystem();
}
