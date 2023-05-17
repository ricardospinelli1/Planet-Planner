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

public void addPlanetClicked(GButton source, GEvent event) { //_CODE_:addPlanet:878009:
  sys.addPlanet(new Planet("Default Name", 1, 20, 250, new PVector(5.6569, 0), color(0, 0, 220)));
  selectedPlanet = sys.planets.get(sys.planets.size()-1);
  PlanetName.setText("Default Name");
  PlanetList.addItem("Default Name");
} //_CODE_:addPlanet:878009:

public void MassSliderDragged(GSlider source, GEvent event) { //_CODE_:Mass:947139:
  selectedPlanet.mass = Mass.getValueF()/2;
} //_CODE_:Mass:947139:

public void RadiusSliderDragged(GSlider source, GEvent event) { //_CODE_:Radius:618588:
  selectedPlanet.orbitRad = Radius.getValueF()*50;
  selectedPlanet.pos = selectedPlanet.pos.sub(sys.star.pos).normalize().mult(selectedPlanet.orbitRad).add(sys.star.pos);
} //_CODE_:Radius:618588:

public void PlanetListSelected(GDropList source, GEvent event) { //_CODE_:PlanetList:712299:
  for (int i = 0; i < sys.planets.size(); i++) {
    if (PlanetList.getSelectedText().equals(sys.planets.get(i).name)) {
      selectedPlanet = sys.planets.get(i);
    }
  }
  
  PlanetName.setText(selectedPlanet.name);
} //_CODE_:PlanetList:712299:

public void PlanetColourChosen(GDropList source, GEvent event) { //_CODE_:PlanetColour:682409:
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
    selectedPlanet.planetCol = color(200, 0, 255);
  }
  else if (PlanetColour.getSelectedText().equals("Grey")) {
    selectedPlanet.planetCol = color(130);
  }
  else if (PlanetColour.getSelectedText().equals("Random")){
    int randRed = int(random(255));
    int randGreen = int(random(255));
    int randBlue = int(random(255));
    selectedPlanet.planetCol = color(randRed, randGreen, randBlue);
  }
} //_CODE_:PlanetColour:682409:

public void PlanetSpeedDragged(GSlider source, GEvent event) { //_CODE_:PlanetSpeed:243815:
  selectedPlanet.speed = PlanetSpeed.getValueF()/100;  
  selectedPlanet.velocity.normalize();
  selectedPlanet.velocity.mult(PlanetSpeed.getValueF());
} //_CODE_:PlanetSpeed:243815:

public void PlanetNameChosen(GTextField source, GEvent event) { //_CODE_:PlanetName:640182:
  //int lengthStr = PlanetName.getText().length();
  //if (PlanetName.getText().substring(lengthStr-1, lengthStr).equals('\n')) {
  //  PlanetList.addItem(PlanetName.getText());
  //  selectedPlanet.name = PlanetName.getText();
  //}
  
  //PlanetList.removeItem(0);
  
} //_CODE_:PlanetName:640182:

public void PauseButtonClicked(GButton source, GEvent event) { //_CODE_:PauseButton:725603:
  if (PauseButton.getText().equals("Pause")) {
    noLoop();
    PauseButton.setText("Resume");
  }
  else {
    loop();
    PauseButton.setText("Pause");
  }
} //_CODE_:PauseButton:725603:

public void StarMassDragged(GSlider source, GEvent event) { //_CODE_:StarMass:715608:
  sys.star.mass = StarMass.getValueF()*5000;
} //_CODE_:StarMass:715608:

public void StarRadiusDragged(GSlider source, GEvent event) { //_CODE_:StarRadius:406222:
  sys.star.radius = StarRadius.getValueF()*100;
} //_CODE_:StarRadius:406222:

public void SubmitNameClicked(GButton source, GEvent event) { //_CODE_:SubmitName:278753:
  //if (selectedPlanet.name.equals("Default Name"))
  PlanetList.addItem(PlanetName.getText());
  selectedPlanet.name = PlanetName.getText();
} //_CODE_:SubmitName:278753:

public void AddMoonClicked(GButton source, GEvent event) { //_CODE_:AddMoon:214185:
  selectedPlanet.addMoon(new Moon(0.03, selectedPlanet.size + 2, 4));
} //_CODE_:AddMoon:214185:

public void StarTypeChosen(GDropList source, GEvent event) { //_CODE_:StarType:608410:
  sys.star.starType = StarType.getSelectedText();
  sys.star.setStarCol();
} //_CODE_:StarType:608410:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  Window1 = GWindow.getWindow(this, "Mass", 0, 0, 400, 400, JAVA2D);
  Window1.noLoop();
  Window1.setActionOnClose(G4P.KEEP_OPEN);
  Window1.addDrawHandler(this, "win_draw1");
  Planets = new GLabel(Window1, 5, 20, 80, 20);
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
  Radius = new GSlider(Window1, 150, 100, 100, 40, 10.0);
  Radius.setLimits(5.0, 1.0, 10.0);
  Radius.setNumberFormat(G4P.DECIMAL, 2);
  Radius.setOpaque(false);
  Radius.addEventHandler(this, "RadiusSliderDragged");
  PlanetList = new GDropList(Window1, 150, 60, 90, 80, 3, 10);
  PlanetList.setItems(loadStrings("list_712299"), 0);
  PlanetList.addEventHandler(this, "PlanetListSelected");
  PlanetColour = new GDropList(Window1, 280, 110, 90, 80, 3, 10);
  PlanetColour.setItems(loadStrings("list_682409"), 0);
  PlanetColour.addEventHandler(this, "PlanetColourChosen");
  PlanetSpeed = new GSlider(Window1, 10, 170, 100, 40, 10.0);
  PlanetSpeed.setLimits(5.0, 1.0, 10.0);
  PlanetSpeed.setNumberFormat(G4P.DECIMAL, 2);
  PlanetSpeed.setOpaque(false);
  PlanetSpeed.addEventHandler(this, "PlanetSpeedDragged");
  PlanetName = new GTextField(Window1, 140, 175, 120, 30, G4P.SCROLLBARS_NONE);
  PlanetName.setOpaque(true);
  PlanetName.addEventHandler(this, "PlanetNameChosen");
  MassLabel = new GLabel(Window1, 10, 90, 80, 20);
  MassLabel.setText("Mass");
  MassLabel.setOpaque(false);
  RadiusLabel = new GLabel(Window1, 150, 90, 80, 20);
  RadiusLabel.setText("Orbit Radius");
  RadiusLabel.setOpaque(false);
  PlanetColourLabel = new GLabel(Window1, 280, 90, 80, 20);
  PlanetColourLabel.setText("Planet Colour");
  PlanetColourLabel.setOpaque(false);
  PlanetSpeedLabel = new GLabel(Window1, 10, 160, 80, 20);
  PlanetSpeedLabel.setText("Planet Speed");
  PlanetSpeedLabel.setOpaque(false);
  label1 = new GLabel(Window1, 140, 160, 80, 20);
  label1.setText("Planet Name");
  label1.setOpaque(false);
  PauseButton = new GButton(Window1, 310, 10, 80, 30);
  PauseButton.setText("Pause");
  PauseButton.addEventHandler(this, "PauseButtonClicked");
  StarLabel = new GLabel(Window1, 10, 230, 80, 20);
  StarLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  StarLabel.setText("Star");
  StarLabel.setOpaque(false);
  StarMass = new GSlider(Window1, 10, 260, 100, 40, 10.0);
  StarMass.setLimits(1.0, 1.0, 10.0);
  StarMass.setNumberFormat(G4P.DECIMAL, 2);
  StarMass.setOpaque(false);
  StarMass.addEventHandler(this, "StarMassDragged");
  StarRadius = new GSlider(Window1, 140, 260, 100, 40, 10.0);
  StarRadius.setLimits(0.5, 0.5, 1.0);
  StarRadius.setNumberFormat(G4P.DECIMAL, 2);
  StarRadius.setOpaque(false);
  StarRadius.addEventHandler(this, "StarRadiusDragged");
  StarMassLabel = new GLabel(Window1, 10, 250, 80, 20);
  StarMassLabel.setText("Mass");
  StarMassLabel.setOpaque(false);
  StarRadiusLabel = new GLabel(Window1, 140, 250, 80, 20);
  StarRadiusLabel.setText("Radius");
  StarRadiusLabel.setOpaque(false);
  SubmitName = new GButton(Window1, 270, 170, 60, 30);
  SubmitName.setText("Submit name");
  SubmitName.addEventHandler(this, "SubmitNameClicked");
  AddMoon = new GButton(Window1, 280, 50, 80, 30);
  AddMoon.setText("Add moon to this planet");
  AddMoon.addEventHandler(this, "AddMoonClicked");
  StarType = new GDropList(Window1, 255, 260, 90, 80, 3, 10);
  StarType.setItems(loadStrings("list_608410"), 0);
  StarType.addEventHandler(this, "StarTypeChosen");
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
