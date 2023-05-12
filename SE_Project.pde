import g4p_controls.*;

int t = 0;
float g = 0.03;

Planet selectedPlanet, earth, mars;
Star sun;
StarSystem sunSys;  



void setup() {
  size(500, 500);
  earth = new Planet(100, 30, 300, color(0, 0, 220));
  mars = new Planet(30, 10, 500, color(230, 0, 0));
  sun = new Star(500, 200);
  sunSys = new StarSystem(sun);
  //createGUI();
  
  sunSys.addPlanet(earth);
  sunSys.addPlanet(mars);
  frameRate(1);
  
  
}

void draw() {
  background(0);
  sunSys.drawSystem();
  //println(earth.mass);
  earth.drawPlanet();
  //earth.updatePosition();
  //sun.drawStar();
}
