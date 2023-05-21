/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:Window1:347532:
  appc.background(230);
} //_CODE_:Window1:347532:

//Add Planet button clicked
public void addPlanetClicked(GButton source, GEvent event) {
  sys.addPlanet(new Planet("Default Name " + str(sys.planets.size()+1), 1, 20, 250, new PVector(5.6569, 0), color(0, 0, 255))); //add new default planet to system 
  selectedPlanet = sys.planets.get(sys.planets.size()-1);  //current planet being edited is this planet
  PlanetName.setText("Default Name " + str(sys.planets.size()));  //show name of selectedPlanet in textbox
  PlanetList.addItem("Default Name "+ str(sys.planets.size()));   //add this planet to options in planet list
  allPlanetList.add("Default Name "+ str(sys.planets.size()));    //add name to list of planets in system
  PlanetList.setSelected(allPlanetList.size());                   //make the selected planet's name shown in the dropdown
  PlanetColour.setSelected(4);  //show in dropdown that default colour is blue
} 

//Planet Mass slider dragged
public void MassSliderDragged(GSlider source, GEvent event) { 
  selectedPlanet.mass = Mass.getValueF()/2;  //set selected planet's mass to value on slider divided by 2
}

//Planet Radius slider dragged
public void RadiusSliderDragged(GSlider source, GEvent event) {
  selectedPlanet.orbitRad = Radius.getValueF()*50;  //set selected planet's distance from planet to value on slider * 50
  selectedPlanet.pos = selectedPlanet.pos.sub(sys.star.pos).normalize().mult(selectedPlanet.orbitRad).add(sys.star.pos);  //draw planet at that distance from star next frame
} 

//Planet List dropdown item selected
public void PlanetListSelected(GDropList source, GEvent event) {
  for (int i = 0; i < sys.planets.size(); i++) {  //for every planet in the system...
    if (PlanetList.getSelectedText().equals(sys.planets.get(i).name)) {  //if that planet's name matches the text in textbox...
      selectedPlanet = sys.planets.get(i);  //that planet is now the selected planet
    }
  }

  if (PlanetList.getSelectedText().equals("None selected")) {  //if the "None selected" option has been chosen...    
    selectedPlanet = new Planet();  //selected planet is "void" planet
    PlanetColour.setSelected(0);  //set back to first item of colour list
  }
  
  else {  //an actual planet has been selected
    //set the planet colour dropdown selected to selected planet's colour
    if (selectedPlanet.planetCol == color(255, 0, 0))
      PlanetColour.setSelected(0);
    else if (selectedPlanet.planetCol == color(255, 160, 0))
      PlanetColour.setSelected(1);
    else if (selectedPlanet.planetCol == color(255, 255, 0))
      PlanetColour.setSelected(2);
    else if (selectedPlanet.planetCol == color(0, 255, 0))      
      PlanetColour.setSelected(3);
    else if (selectedPlanet.planetCol == color(0, 0, 255))     
      PlanetColour.setSelected(4);
    else if (selectedPlanet.planetCol == color(170, 0, 255))      
      PlanetColour.setSelected(5);
    else if (selectedPlanet.planetCol == color(160))      
      PlanetColour.setSelected(6);
    else      
      PlanetColour.setSelected(7);
  }

  PlanetName.setText(selectedPlanet.name);  //put selected planet's name in textbox
}

//Planet Colour from dropdown list selected
public void PlanetColourChosen(GDropList source, GEvent event) {
  //set selected planet's colour based on what item from dropdown was chosen
  if (PlanetColour.getSelectedText().equals("Red")) {
    selectedPlanet.planetCol = color(255, 0, 0);
  } 
  else if (PlanetColour.getSelectedText().equals("Orange")) {    
    selectedPlanet.planetCol = color(255, 160, 0);
  } 
  else if (PlanetColour.getSelectedText().equals("Yellow")) {
    selectedPlanet.planetCol = color(255, 255, 0);
  } 
  else if (PlanetColour.getSelectedText().equals("Green")) {  
    selectedPlanet.planetCol = color(0, 255, 0);
  } 
  else if (PlanetColour.getSelectedText().equals("Blue")) {
    selectedPlanet.planetCol = color(0, 0, 255);
  } 
  else if (PlanetColour.getSelectedText().equals("Purple")) {
    selectedPlanet.planetCol = color(170, 0, 255);
  } 
  else if (PlanetColour.getSelectedText().equals("Grey")) {
    selectedPlanet.planetCol = color(160);
  } 
  else if (PlanetColour.getSelectedText().equals("Random")) {  //randomly generate colour of planet
    //random RGB
    int randRed = int(random(255));
    int randGreen = int(random(255));
    int randBlue = int(random(255));
    selectedPlanet.planetCol = color(randRed, randGreen, randBlue);
  }
}

//Planet Speed slider has been dragged
public void PlanetSpeedDragged(GSlider source, GEvent event) { 
  selectedPlanet.velocity.normalize();  //get unit vector in direction of selected planet's velocity
  selectedPlanet.velocity.mult(PlanetSpeed.getValueF());  //multiply unit vector by scalar chosen speed value
}

//Typing in planet name textbox
public void PlanetNameChosen(GTextField source, GEvent event) {
  //nothing to be done here because user may not be done typing
} 

//Pause button has been clicked
public void PauseButtonClicked(GButton source, GEvent event) {
  if (PauseButton.getText().equals("Pause")) {  //if the button is in pause button form
    noLoop();  //stop looping draw()
    PauseButton.setText("Resume");  //set text to resume on button
  } 
  else {
    loop();  //resume loop
    PauseButton.setText("Pause");  //set text back to pause on button
  }
}

//Star Mass slider has been dragged
public void StarMassDragged(GSlider source, GEvent event) {
  sys.star.mass = StarMass.getValueF()*5000; //set star's mass to value on slider * 5000
}

//Star Radius slider has been dragged
public void StarRadiusDragged(GSlider source, GEvent event) {
  sys.star.radius = StarRadius.getValueF()*100;  //set star's radius to value on slider * 100
}

//Planet Submit Name button has been clicked
public void SubmitNameClicked(GButton source, GEvent event) {
  int ind = 0;  //index of selected planet
  
  for (int i = 0; i < allPlanetList.size(); i++) {  //for every planet in the system...
    if (allPlanetList.get(i).equals(selectedPlanet.name)) {  //if the planet's name matches the selected planet's name...
      ind = i;  //index of selected planet is current index being checked
      i = sys.planets.size();  //break out of loop
    }
  }
  
  //if anything but "none" planet selected
  if (!PlanetList.getSelectedText().equals("None selected")) {
    PlanetList.removeItem(ind+1);  //remove old name from list (ind + 1 because PlanetList also includes "None selected" but allPlanetList doesn't)
    PlanetList.addItem(PlanetName.getText());  //add new name to planet list
    allPlanetList.remove(ind);  //remove old name from list
    allPlanetList.add(PlanetName.getText());  //add new name
    selectedPlanet.name = PlanetName.getText();  //selected planet's name is now new name
    PlanetList.setSelected(allPlanetList.size());  //show selected from dropdown as last item in list (new name)
  }
}

//Add moon to this planet button clicked
public void AddMoonClicked(GButton source, GEvent event) {
  selectedPlanet.addMoon(new Moon(0.03, selectedPlanet.size + 2, 4));  //add moon to selected planet of mass 0.03, distance from planet just bigger than planet diameter
                                                                       //and radius 4
}

//Star type chosen from droplist
public void StarTypeChosen(GDropList source, GEvent event) {
  sys.star.starType = StarType.getSelectedText();  //set star's type to selected star type
  sys.star.setStarCol();  //update colour of star based on new type
}

//Add Asteroid button clicked
public void AddAsteroidClicked(GButton source, GEvent event) {
  sys.addAsteroidBelt(new AsteroidBelt(500));  //add new belt to system of default size
  selectedBelt = sys.belts.get(sys.belts.size()-1);  //set selected belt to the new belt
  selectedBelt.name = "Asteroid Belt #" + str(sys.belts.size());  //name asteroid belt
  AsteroidList.addItem(selectedBelt.name);  //add new name to droplist of asteroid belts
  AsteroidList.setSelected(sys.belts.size());  //show new asteroid belt as the one selected from droplist
}

//Asteroid belt distance slider dragged
public void BeltDistanceDragged(GSlider source, GEvent event) {
  if (!selectedBelt.name.equals("None"))
    selectedBelt.orbRadius = BeltDistance.getValueF()*1000;  //set distance from star of selected belt to value on slider * 1000
}

//Asteroid Belt selected from droplist
public void AsteroidListChosen(GDropList source, GEvent event) {
  for (int i = 0; i < sys.belts.size(); i++) {  //for every belt in the system...
    if (AsteroidList.getSelectedText().equals(sys.belts.get(i).name)) {  //if the name matches the asteroid belt chosen in the droplist...
      selectedBelt = sys.belts.get(i);  //set selected belt to this belt
    }
  }
  
  if (AsteroidList.getSelectedText().equals("None selected")) {  //if selected item from droplist is none...
    selectedBelt = new AsteroidBelt();  //set selected belt to void asteroid belt
  }
} 

//Clear all button clicked
public void clearButtonClicked(GButton source, GEvent event) { 
  for (int i = sys.planets.size(); i > 0; i--) {  //for every item in planet droplist except first... (backwards to avoid mixing up indices with removing items)
    PlanetList.removeItem(i);  //remove planet name
  }
  
  for (int i = sys.belts.size(); i > 0; i--) {  //for every item in asteroid belt droplist
    AsteroidList.removeItem(i);  //remove asteroid belt name
  }
  clearArrayLists();  //clear all array lists
  sys.star = new Star(10000, 65, "Red dwarf");  //reset star to default
  PlanetName.setText("None selected");  //reset planet name text to default
  
  //reset gravitational constant and time interval variables
  g = 0.8; 
  G = -0.8;
  deltaT = 0.1;
}

//Planet Size slider dragged
public void PlanetSizeDragged(GSlider source, GEvent event) {
  selectedPlanet.size = 50*PlanetSize.getValueF();  //set selected planet's size to slider value * 50
}

//Delete planet button clicked
public void DeletePlanetClicked(GButton source, GEvent event) {
  for (int i = 0; i < sys.planets.size(); i++) {  //for every planet in the system...
    if (selectedPlanet.name.equals(allPlanetList.get(i))) {  //if name matches the currently selected planet's name
      sys.removePlanet(selectedPlanet);  //remove this planet from system
      PlanetList.removeItem(i+1);  //remove name from planet droplist
      PlanetList.setSelected(0); //set selected planet to none
      PlanetName.setText("None selected");  //set current selected planet name in textbox to default
      PlanetColour.setSelected(0);  //set colour to first item
      selectedPlanet = new Planet();  //set selected to void planet
    }
  }
}

//Delete asteroid belt button clicked
public void DeleteBeltClicked(GButton source, GEvent event) { 
  for (int i = 0; i < sys.belts.size(); i++) {  //for every belt in system...
    if (selectedBelt.name.equals(sys.belts.get(i).name)) {
      sys.removeAsteroidBelt(selectedBelt);  //remove this belt from system
      AsteroidList.removeItem(i+1);  //remove from asteroid belt droplist
      AsteroidList.setSelected(0);  //set selected asteroid belt to first in droplist
      selectedBelt = new AsteroidBelt();  //selected belt is now void belt
    }
  }
}

//Demo button clicked
public void DemoClicked(GButton source, GEvent event) {
  //remove all items (except "None selected") from droplists
  for (int i = sys.planets.size(); i > 0; i--) {    
    PlanetList.removeItem(i);  
  }  
  for (int i = sys.belts.size(); i > 0; i--) {    
    AsteroidList.removeItem(i);  
  }
  
  clearArrayLists();  //clear all array lists
  PlanetName.setText("None selected");  //set planet name droplist to none selected
  setDemo();  //set up demo objects in system
  
  //add everything to appropriate arrays
  allPlanetList.add("Mercury");
  allPlanetList.add("Venus");
  allPlanetList.add("Earth");
  allPlanetList.add("Mars");
  allPlanetList.add("Jupiter");
  PlanetList.addItem("Mercury");
  PlanetList.addItem("Venus");
  PlanetList.addItem("Earth");
  PlanetList.addItem("Mars");
  PlanetList.addItem("Jupiter");
  AsteroidList.addItem("Asteroid Belt #1");
  
  //set grav. const. and time interval between frames to default
  g = 0.8;  
  G = -0.8;  
  deltaT = 0.1;
}

//Add comet button clicked
public void AddCometClicked(GButton source, GEvent event) {
  Comet comet = new Comet(0.01, 300, new PVector(6, 0));  //new comet with default parameters
  sys.addComet(comet);  //add comet to system
}

//Delete comet button clicked
public void DeleteCometClicked(GButton source, GEvent event) {
  sys.comets.remove(0);  //remove first comet from system (doesn't matter which since they're all identical)
}

//Gravitational constant slider dragged
public void GravConstantDragged(GSlider source, GEvent event) {
  g = GravitationalConstant.getValueF();  //set g to value on slider
  G = -g;  //set G to negative g
}

//Animation speed slider dragged
public void AnimationSpeedDragged(GSlider source, GEvent event) {
  deltaT = AnimationSpeed.getValueF();  //set deltaT to value on slider
}

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  Window1 = GWindow.getWindow(this, "Mass", 0, 0, 450, 530, JAVA2D);
  Window1.noLoop();
  Window1.setActionOnClose(G4P.KEEP_OPEN);
  Window1.addDrawHandler(this, "win_draw1");
  Planets = new GLabel(Window1, 6, 30, 80, 20);
  Planets.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  Planets.setText("Planets");
  Planets.setOpaque(true);
  addPlanet = new GButton(Window1, 10, 60, 80, 30);
  addPlanet.setText("Add Planet");
  addPlanet.addEventHandler(this, "addPlanetClicked");
  Mass = new GSlider(Window1, 10, 100, 100, 40, 10.0);
  Mass.setLimits(5.0, 1.0, 10.0);
  Mass.setNumberFormat(G4P.DECIMAL, 2);
  Mass.setOpaque(false);
  Mass.addEventHandler(this, "MassSliderDragged");
  Radius = new GSlider(Window1, 131, 100, 100, 40, 10.0);
  Radius.setLimits(5.0, 1.0, 10.0);
  Radius.setNumberFormat(G4P.DECIMAL, 2);
  Radius.setOpaque(false);
  Radius.addEventHandler(this, "RadiusSliderDragged");
  PlanetList = new GDropList(Window1, 116, 61, 100, 80, 3, 10);
  PlanetList.setItems(loadStrings("list_712299"), 0);
  PlanetList.addEventHandler(this, "PlanetListSelected");
  PlanetColour = new GDropList(Window1, 132, 170, 90, 80, 3, 10);
  PlanetColour.setItems(loadStrings("list_682409"), 0);
  PlanetColour.addEventHandler(this, "PlanetColourChosen");
  PlanetSpeed = new GSlider(Window1, 10, 170, 100, 40, 10.0);
  PlanetSpeed.setLimits(5.0, 1.0, 10.0);
  PlanetSpeed.setNumberFormat(G4P.DECIMAL, 2);
  PlanetSpeed.setOpaque(false);
  PlanetSpeed.addEventHandler(this, "PlanetSpeedDragged");
  PlanetName = new GTextField(Window1, 232, 60, 120, 30, G4P.SCROLLBARS_NONE);
  PlanetName.setOpaque(true);
  PlanetName.addEventHandler(this, "PlanetNameChosen");
  MassLabel = new GLabel(Window1, 10, 90, 80, 20);
  MassLabel.setText("Mass");
  MassLabel.setOpaque(false);
  RadiusLabel = new GLabel(Window1, 132, 88, 80, 20);
  RadiusLabel.setText("Orbit Radius");
  RadiusLabel.setOpaque(false);
  PlanetColourLabel = new GLabel(Window1, 132, 151, 80, 20);
  PlanetColourLabel.setText("Planet Colour");
  PlanetColourLabel.setOpaque(false);
  PlanetSpeedLabel = new GLabel(Window1, 10, 160, 80, 20);
  PlanetSpeedLabel.setText("Planet Speed");
  PlanetSpeedLabel.setOpaque(false);
  label1 = new GLabel(Window1, 230, 44, 80, 20);
  label1.setText("Planet Name");
  label1.setOpaque(false);
  PauseButton = new GButton(Window1, 139, 3, 80, 25);
  PauseButton.setText("Pause");
  PauseButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  PauseButton.addEventHandler(this, "PauseButtonClicked");
  StarLabel = new GLabel(Window1, 10, 230, 80, 20);
  StarLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  StarLabel.setText("Star");
  StarLabel.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarLabel.setOpaque(true);
  StarMass = new GSlider(Window1, 10, 260, 100, 40, 10.0);
  StarMass.setLimits(1.0, 1.0, 10.0);
  StarMass.setNumberFormat(G4P.DECIMAL, 2);
  StarMass.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarMass.setOpaque(false);
  StarMass.addEventHandler(this, "StarMassDragged");
  StarRadius = new GSlider(Window1, 140, 260, 100, 40, 10.0);
  StarRadius.setLimits(0.5, 0.5, 1.0);
  StarRadius.setNumberFormat(G4P.DECIMAL, 2);
  StarRadius.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarRadius.setOpaque(false);
  StarRadius.addEventHandler(this, "StarRadiusDragged");
  StarMassLabel = new GLabel(Window1, 10, 250, 80, 20);
  StarMassLabel.setText("Mass");
  StarMassLabel.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarMassLabel.setOpaque(false);
  StarRadiusLabel = new GLabel(Window1, 140, 250, 80, 20);
  StarRadiusLabel.setText("Radius");
  StarRadiusLabel.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarRadiusLabel.setOpaque(false);
  SubmitName = new GButton(Window1, 363, 59, 60, 30);
  SubmitName.setText("Submit name");
  SubmitName.addEventHandler(this, "SubmitNameClicked");
  AddMoon = new GButton(Window1, 238, 161, 80, 30);
  AddMoon.setText("Add moon to this planet");
  AddMoon.addEventHandler(this, "AddMoonClicked");
  StarType = new GDropList(Window1, 262, 264, 90, 80, 3, 10);
  StarType.setItems(loadStrings("list_608410"), 0);
  StarType.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarType.addEventHandler(this, "StarTypeChosen");
  AddAsteroid = new GButton(Window1, 16, 348, 80, 30);
  AddAsteroid.setText("Add Asteroid Belt");
  AddAsteroid.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  AddAsteroid.addEventHandler(this, "AddAsteroidClicked");
  BeltDistance = new GSlider(Window1, 143, 344, 100, 40, 10.0);
  BeltDistance.setLimits(0.5, 0.0, 1.0);
  BeltDistance.setNumberFormat(G4P.DECIMAL, 2);
  BeltDistance.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  BeltDistance.setOpaque(false);
  BeltDistance.addEventHandler(this, "BeltDistanceDragged");
  BeltDistanceLabel = new GLabel(Window1, 143, 331, 99, 25);
  BeltDistanceLabel.setText("Orbit Radius");
  BeltDistanceLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  BeltDistanceLabel.setOpaque(false);
  AsteroidList = new GDropList(Window1, 13, 407, 100, 80, 3, 10);
  AsteroidList.setItems(loadStrings("list_663708"), 0);
  AsteroidList.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  AsteroidList.addEventHandler(this, "AsteroidListChosen");
  clearButton = new GButton(Window1, 240, 3, 80, 25);
  clearButton.setText("Clear all");
  clearButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  clearButton.addEventHandler(this, "clearButtonClicked");
  PlanetSize = new GSlider(Window1, 280, 106, 100, 40, 10.0);
  PlanetSize.setLimits(0.5, 0.0, 1.0);
  PlanetSize.setNumberFormat(G4P.DECIMAL, 2);
  PlanetSize.setOpaque(false);
  PlanetSize.addEventHandler(this, "PlanetSizeDragged");
  PlanetSizeLabel = new GLabel(Window1, 279, 94, 100, 20);
  PlanetSizeLabel.setText("Planet Radius");
  PlanetSizeLabel.setOpaque(false);
  DeletePlanet = new GButton(Window1, 340, 161, 80, 30);
  DeletePlanet.setText("Delete Planet");
  DeletePlanet.addEventHandler(this, "DeletePlanetClicked");
  DeleteBelt = new GButton(Window1, 150, 394, 80, 30);
  DeleteBelt.setText("Delete Asteroid Belt");
  DeleteBelt.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  DeleteBelt.addEventHandler(this, "DeleteBeltClicked");
  SelectPlanetLabel = new GLabel(Window1, 116, 40, 100, 20);
  SelectPlanetLabel.setText("Select planet...");
  SelectPlanetLabel.setOpaque(false);
  StarTypeLabel = new GLabel(Window1, 263, 248, 80, 20);
  StarTypeLabel.setText("Star Type");
  StarTypeLabel.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  StarTypeLabel.setOpaque(false);
  SelectAsteroidLabel = new GLabel(Window1, 12, 386, 130, 20);
  SelectAsteroidLabel.setText("Select asteroid belt...");
  SelectAsteroidLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  SelectAsteroidLabel.setOpaque(false);
  AsteroidLabel = new GLabel(Window1, 13, 324, 80, 20);
  AsteroidLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  AsteroidLabel.setText("Asteroid Belts");
  AsteroidLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  AsteroidLabel.setOpaque(true);
  Demo = new GButton(Window1, 316, 479, 80, 30);
  Demo.setText("Demo");
  Demo.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  Demo.addEventHandler(this, "DemoClicked");
  CometLabel = new GLabel(Window1, 256, 322, 80, 20);
  CometLabel.setText("Comets");
  CometLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  CometLabel.setOpaque(true);
  AddComet = new GButton(Window1, 254, 360, 80, 30);
  AddComet.setText("Add Comet");
  AddComet.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  AddComet.addEventHandler(this, "AddCometClicked");
  DeleteComet = new GButton(Window1, 341, 361, 80, 30);
  DeleteComet.setText("Delete Comet");
  DeleteComet.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  DeleteComet.addEventHandler(this, "DeleteCometClicked");
  Other = new GLabel(Window1, 8, 435, 80, 20);
  Other.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  Other.setText("Other");
  Other.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  Other.setOpaque(true);
  GravitationalConstant = new GSlider(Window1, 6, 474, 100, 40, 10.0);
  GravitationalConstant.setLimits(0.5, 0.01, 1.0);
  GravitationalConstant.setNumberFormat(G4P.DECIMAL, 2);
  GravitationalConstant.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  GravitationalConstant.setOpaque(false);
  GravitationalConstant.addEventHandler(this, "GravConstantDragged");
  AnimationSpeed = new GSlider(Window1, 174, 474, 100, 40, 10.0);
  AnimationSpeed.setLimits(0.25, 0.01, 0.5);
  AnimationSpeed.setNumberFormat(G4P.DECIMAL, 2);
  AnimationSpeed.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  AnimationSpeed.setOpaque(false);
  AnimationSpeed.addEventHandler(this, "AnimationSpeedDragged");
  GravConstLabel = new GLabel(Window1, 6, 460, 135, 20);
  GravConstLabel.setText("Gravitational Constant");
  GravConstLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  GravConstLabel.setOpaque(false);
  AnimSpeedLabel = new GLabel(Window1, 173, 459, 102, 20);
  AnimSpeedLabel.setText("Animation Speed");
  AnimSpeedLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  AnimSpeedLabel.setOpaque(false);
  Window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow Window1;
GLabel Planets; 
GButton addPlanet; 
GSlider Mass; 
GSlider Radius; 
GDropList PlanetList; 
GDropList PlanetColour; 
GSlider PlanetSpeed; 
GTextField PlanetName; 
GLabel MassLabel; 
GLabel RadiusLabel; 
GLabel PlanetColourLabel; 
GLabel PlanetSpeedLabel; 
GLabel label1; 
GButton PauseButton; 
GLabel StarLabel; 
GSlider StarMass; 
GSlider StarRadius; 
GLabel StarMassLabel; 
GLabel StarRadiusLabel; 
GButton SubmitName; 
GButton AddMoon; 
GDropList StarType; 
GButton AddAsteroid; 
GSlider BeltDistance; 
GLabel BeltDistanceLabel; 
GDropList AsteroidList; 
GButton clearButton; 
GSlider PlanetSize; 
GLabel PlanetSizeLabel; 
GButton DeletePlanet; 
GButton DeleteBelt; 
GLabel SelectPlanetLabel; 
GLabel StarTypeLabel; 
GLabel SelectAsteroidLabel; 
GLabel AsteroidLabel; 
GButton Demo; 
GLabel CometLabel; 
GButton AddComet; 
GButton DeleteComet; 
GLabel Other; 
GSlider GravitationalConstant; 
GSlider AnimationSpeed; 
GLabel GravConstLabel; 
GLabel AnimSpeedLabel; 
