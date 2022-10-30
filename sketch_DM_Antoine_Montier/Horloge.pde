class Horloge {

  float cx = width/2, cy = 75, dx = 100, dy = 100, d = 100;

  Horloge(float cx, float cy, float dx, float dy, float d) {
    this.cx = cx;
    this.cy = cy;
    this.dx = dx;
    this.dy = dy;
    this.d = d;
  }


  void dessiner(float cx, float cy, float dx, float dy, float d) {
    float sec = d - d/8;
    float min = d - d/3;
    float s=millis()/1000;
    float m=millis()/(1000*60);


    fill(135, 206, 235);
    float r1x, r2x, r3x, r1y, r2y, r3y, x = 0, p = 0;
    r1x=dx-dx/10; // rayon ext heure & min x
    r2x=dx-dx/4; //rayon int heures x
    r3x=dx-dx/6; //rayon int minutes x
    r1y=dy-dy/10; // rayon ext heures & min y
    r2y=dy-dy/4; //rayon int heures y
    r3y=dy-dy/6; //rayon int minutes y

    //dessiner les marques des minutes :
    while (x<TWO_PI) {
      strokeWeight(1);
      arc(cx, cy, r1x, r1y, x, x+0.00001, PIE);
      x += PI/30;
      noStroke();
      ellipse(cx, cy, r3x, r3y);
      stroke(0);
    }
    //dessiner les marques des heures :
    while (p<TWO_PI) {
      stroke(0);
      strokeWeight(2);
      arc(cx, cy, r1x, r1y, p, p+0.00001, PIE);
      p += PI/6 % TWO_PI;
      noStroke();
      ellipse(cx, cy, r2x, r2y);
    }
    //redessiner le cadran :
    stroke(0);
    strokeWeight(1);
    noFill();
    ellipse(cx, cy, dx, dy);


    //aiguille des minutes :
    strokeWeight(2);
    arc(cx, cy, min, min, m*PI/6-PI/2, m*PI/6 + 0.00001-PI/2, PIE);
    // aiguille des secondes :
    strokeWeight(1);
    arc(cx, cy, sec, sec, s*PI/30-PI/2, s*PI/30 + 0.00001-PI/2, PIE);
  }
}
