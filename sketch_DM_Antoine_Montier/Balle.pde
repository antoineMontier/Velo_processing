class Balle {
  float alpha=random (PI/12, PI/3), vitesse=2, d=30, x=d/2, y = random(velo.y-2*velo.diameter), vx=vitesse*cos(alpha)+random(2, 12), vy=vitesse*sin(alpha), acceleration=0.8;

  Balle(float x, float y, float d, float vitesse, float acceleration) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vitesse = vitesse;
    this.acceleration = acceleration;
    alpha = random (PI/12, PI/3);
    y = random(velo.y-2*velo.diameter);
    vx=vitesse*cos(alpha)+random(2, 12);
    vy=vitesse*sin(alpha);
  }

  void dessiner(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    stroke(165, 42, 42);
    fill(244, 164, 96);
    ellipse(x, y, d, d);
  }

  void bouger() {
    x += vx;
    y += vy;
    if (y > velo.y + velo.diameter/2 && vy > 0) {
      vy *= -0.99999;
    }
    if (x > width-d/2) {
      x = d/2;
    }
    vy += acceleration ;
  }

  void grossir() {
    vitesse += 0.8;
    d += 15;
    x = d/2;
    y = random(velo.y - 2*velo.diameter);
    vx = vitesse*cos(alpha)+random(2, 12);
    vy = vitesse*sin(alpha);
    parametres.level ++;
  }
}
