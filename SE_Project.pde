int t = 0;

void setup() {
  StarSystem sunSys = new StarSystem();
  Planet earth = new Planet(100, 30, 300, color(0, 0, 220));
  Planet mars = new Planet(30, 10, 500, color(230, 0, 0));
  
  sunSys.addPlanet(earth);
  sunSys.addPlanet(mars);
}

void draw() {

}
