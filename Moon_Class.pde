class Moon {
  //FIELDS
  PVector pos;
  PVector speed;
 
  //CONTRUCTORS
 
  //METHODS
  void drawMoon() { // position of moon is determined by which planet the user has chosen
    fill(133, 129, 126);
    noStroke();
    circle(this.pos.x, this.pos.y, 10);
  }
}
