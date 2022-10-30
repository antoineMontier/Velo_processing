class Roue {

  float x, y, diameter, angle;

  Roue(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  void dessiner(float x, float y, float diameter) {
    ellipse(x, y, diameter, diameter);
    arc(x, y, diameter, diameter, angle, (angle + PI), PIE);
    arc(x, y, diameter, diameter, (angle + HALF_PI + PI), (angle + HALF_PI + TWO_PI), PIE);
  }


  void tourner(float x, float diam) {
    angle = ((x+5)*PI) / ((diam*PI)/2);
  }
}
