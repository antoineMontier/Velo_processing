class Velo {

  float x = 0 ;
  //position selon Y des roues :
  float y;
  //vitesse selon X du vélo :
  float vitesse = 5;
  //variable pour les angles :
  float angle = 0 ;
  //diamètre des roues (facultatif) :
  float diameter = 60;
  //variable pour la position selon X du tube de selle :
  float tube = random(20, 60);
  //variable pour la taille de la selle :
  float selle = random(2, 10);
  //variable pour le niveau d'énergie :
  float energie = 150;
  //variable pour les petites roues :
  boolean petitesRoues = false;
  //variable pour rendre le vélo multicolore :
  boolean pimpMyBike = true;

  Roue roueAr;
  Roue roueAv;
  Roue petiteRoue;

  Velo(float x, float y, float vitesse, float angle, float diameter, float tube, float selle, float energie, boolean petitesRoues, boolean pimpMyBike) {
    this.x = x;
    this.y = y;
    this.vitesse = vitesse;
    this.angle = angle;
    this.diameter = diameter;
    this.tube = tube;
    this.selle = selle;
    this.energie = energie;
    this.petitesRoues = petitesRoues;
    this.pimpMyBike = pimpMyBike;
    roueAr = new Roue(x - 110, y, diameter);
    roueAv = new Roue(x, y, diameter);
    petiteRoue = new Roue(x - 120, y + diameter/2 - diameter/8, diameter/3.5);
  }

  void dessiner(float x, float y, float v, float diameter, float tube, boolean petitesRoues, boolean pimpMyBike) {
    noFill();
    strokeWeight(2);
    if (pimpMyBike) {
      stroke(random(0, 255), random(0, 255), random(0, 255));
    } else {
      stroke (0);
    }
    //cadre :
    quad(x-10, y - 40, x - 110 + tube, y -30, x - 110, y, x - 110 + tube, y);
    //tube de selle :
    line(x - 110 + tube, y, x - 110 + tube, y - 40);
    //selle :
    triangle(x - 110 + tube - selle, y - 40, x - 110 + tube - selle, y - 40 - selle, x - 110 + tube + selle, y - 40 - selle/2);
    stroke(0);
    //fourche :
    line(x, y, x - 10, y - 50);
    //guidon :
    arc(x - 35, y - 50, 50, 10, -HALF_PI, HALF_PI);
    stroke(abs(v)*10, 0, 0);
    roueAr.dessiner(x - 110, y, diameter);
    roueAv.dessiner(x, y, diameter);

    if (petitesRoues) {
      stroke(0);
      //les petites roues changent aussi de couleur de la même manière que les grandes roues :
      line(x - 110, y, x - 110 - 10, y + diameter/2 - diameter/8);
      stroke(abs(vitesse)*10, 0, 0);
      petiteRoue.dessiner(x - 120, y + diameter/2 - diameter/8, diameter/3.5);
    }
  }

  void avancer() {
    roueAv.tourner(x, diameter);
    roueAr.tourner(x - 110, diameter);
    petiteRoue.tourner(x - 120, diameter/3.5);

    y = constrain(y, 0 + diameter/2+70, height-diameter/2 - 2);
    x= (x + vitesse ) % (width + 110);
    if (x < -10) {
      x = width + 110;
    }
  }

  void dessinerBarreEnergie() {
    noStroke();
    fill(255, 55+energie, 0, 180);
    rect(10, 210, 30, -energie, 15, 15, 5, 5);
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(10, 10, 30, 200, 5);
    line(10, 50, 40, 50);
    line(10, 90, 40, 90);
    line(10, 130, 40, 130);
    line(10, 170, 40, 170);
  }

  void incrementerEnergie() {
    //pimpmybike ne fais pas perdre d'energie les 10 premières secondes :
    if (pimpMyBike && millis() > 10000) {
      //l'energie descend plus vite en mode pimpmybike :
      energie -= 1.5 - abs(velo.vitesse)/10 + 0.8 ;
      energie = constrain(energie, 0, 200);

      if (energie < 1) {
        pimpMyBike = false;
      }
    } else {
      energie -=  abs(velo.vitesse)/10 - 0.8;
      energie = constrain(energie, 0, 200);
    }
    while (energie < 5 && abs(velo.vitesse) > 8) {
      if (velo.vitesse > 0) {
        velo.vitesse = 8-velo.y*0.001;
      } else {
        velo.vitesse = -8 ;
      }
    }
  }
}
