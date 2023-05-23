import g4p_controls.*;  //import gui
float halfway;          //middle of screen
ArrayList<String> allPlanetList = new ArrayList<String>();  //list of planet names for manipulating with gui planet list
PVector[] backgroundStars = new PVector[1000];              //positions of background stars

//gravity global variables
float g = 0.8;          //default gravitational constant
float G = -g;           //negative version of g
float deltaT = 0.1;     //speed of animation

StarSystem sys;          //star system that will contain all objects
Star defaultStar;        //default star to begin program
Planet defaultPlanet;    //default planet when user adds a planet
Planet selectedPlanet;   //the current planet being edited
AsteroidBelt selectedBelt; //the current asteroid belt being edited

//demo objects
Planet mercury, venus, earth, mars;  //planets
Moon moon;                           //moon
Star sun;                            //sun
AsteroidBelt astBelt;                //asteroid belt
Comet halley;                        //comet

void setup() {
  size(900, 900);
  halfway = width/2.0; 
  createGUI();
  
  //set default object values
  defaultStar = new Star(10000, 65, "Red dwarf");
  defaultPlanet = new Planet("Default Name", 1, 20, 250, new PVector(5.6569, 0), color(0, 0, 255));
  sys = new StarSystem(defaultStar);
  setPosBackgroundStars();
}

void draw() {
  background(0);
  sys.drawSystem();
}

void setDemo() {
  //give parameters of demo objects
  mercury = new Planet("Mercury", 0.2, 5, 100, new PVector (7, 0), color(160));    
  venus = new Planet("Venus", 0.9, 18, 170, new PVector(7, 0), color(240, 200, 5));    
  earth = new Planet("Earth", 1, 20, 250, new PVector(5.6569, 0), color(0, 0, 255));  //should have circular orbit    
  mars = new Planet("Mars", 0.4, 7, 280, new PVector(5, 0), color(230, 0, 0));    
  moon = new Moon(0.001, 20, 5);
  sun = new Star(10000, 65, "Yellow dwarf");  
  halley = new Comet(0.01, 300, new PVector(6, 0));
  astBelt = new AsteroidBelt(700);  
  astBelt.name = "Asteroid Belt #1";
  
  //add all objects to star system and moon to earth
  earth.addMoon(moon);
  sys.addPlanet(mercury);    
  sys.addPlanet(venus);    
  sys.addPlanet(earth);    
  sys.addPlanet(mars);       
  sys.addAsteroidBelt(astBelt);
  sys.addComet(halley);
  sys.star = sun;
}

void setPosBackgroundStars() {  //set positions of background stars
  for (int i = 0; i < 1000; i++) {  //for 1000 background stars
    //random position on screen
    float randX = random(1000);
    float randY = random(1000);
    float r = random(0.5, 1.8);  //random size
    backgroundStars[i] = new PVector(randX, randY, r);  //add position and size to array
  }
}

void drawBackgroundStars() {  //draw stars every frame
  for (int i = 0; i < 1000; i++) {  //for every star
    fill(255);
    noStroke();
    circle(backgroundStars[i].x, backgroundStars[i].y, backgroundStars[i].z);
  }
}

void clearArrayLists() {  //clear all arrays
  sys.planets.clear();  
  sys.belts.clear();  
  sys.comets.clear();
  allPlanetList.clear();
}
